import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:serverpod/serverpod.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

/// Serverpod initialization & launcher entrypoint for Jinsei Bio Redesign Server
void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // Determine active runtime environment mode
  final runMode = pod.runMode;
  final isProduction = runMode == 'production' || runMode == 'staging';

  // Register production REST HTTP Health routes
  final healthRoute = HealthRoute(isProduction: isProduction);
  pod.webServer.addRoute(healthRoute, '/health');
  pod.webServer.addRoute(healthRoute, '/health/*');

  try {
    // In Production: Attempt full Serverpod startup; fail-fast if Database is unavailable
    if (isProduction) {
      await pod.start();
    } else {
      // In Local Dev: 3-second database connection gate; fallback to sandbox server if offline
      await pod.start().timeout(const Duration(seconds: 3));
    }
  } catch (e) {
    if (isProduction) {
      // Fail Fast for Production Resilience (Cloud Run / K8s readiness probe gate)
      stderr.writeln('FATAL: Database connection failed in $runMode mode: $e');
      exit(1);
    } else {
      print(
          'ℹ️ Serverpod running in Standalone Local Sandbox Mode (PostgreSQL offline).');
      await _startStandaloneLocalServer(8080);
      await _startStandaloneLocalServer(8081);
    }
  }
}

/// Fallback Standalone HTTP Server for local development without active PostgreSQL instance
Future<void> _startStandaloneLocalServer(int port) async {
  try {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
    print(
        '🚀 Jinsei Bio Redesign Local Server live at http://localhost:$port/');

    server.listen((HttpRequest request) async {
      final response = request.response;
      _applyProductionSecurityHeaders(response);

      if (request.method == 'OPTIONS') {
        response.statusCode = HttpStatus.ok;
        await response.close();
        return;
      }

      final path = request.uri.path.toLowerCase();
      if (path == '/health' ||
          path == '/health/' ||
          path == '/health/ping' ||
          path == '/health/status' ||
          path == '/') {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'status': 'HEALTHY',
          'service': 'jinsei_bio_redesign_server',
          'version': '1.0.0',
          'appMode': 'UNOFFICIAL_DEMO',
          'environment': 'development-sandbox',
          'database': 'PostgreSQL (Local Standalone Sandbox)',
          'timestamp': DateTime.now().toUtc().toIso8601String(),
        }));
      } else {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'status': 'OK',
          'path': path,
          'message': 'Jinsei Bio Redesign Serverpod Sandbox Live',
          'timestamp': DateTime.now().toUtc().toIso8601String(),
        }));
      }
      await response.close();
    });
  } catch (e) {
    print('⚠️ Port $port fallback binding skipped: $e');
  }
}

/// Direct REST HTTP Route handler for health checks (handles GET & POST)
class HealthRoute extends Route {
  final bool isProduction;

  HealthRoute({this.isProduction = false});

  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    final response = request.response;
    _applyProductionSecurityHeaders(response, isProduction: isProduction);

    if (request.method == 'OPTIONS') {
      response.statusCode = HttpStatus.ok;
      await response.close();
      return true;
    }

    response.statusCode = HttpStatus.ok;
    response.write(jsonEncode({
      'status': 'HEALTHY',
      'service': 'jinsei_bio_redesign_server',
      'version': '1.0.0',
      'appMode': 'UNOFFICIAL_DEMO',
      'environment': session.serverpod.runMode,
      'timestamp': DateTime.now().toUtc().toIso8601String(),
    }));
    await response.close();
    return true;
  }
}

/// Helper method to inject OWASP Backend Security Headers
void _applyProductionSecurityHeaders(HttpResponse response,
    {bool isProduction = false}) {
  response.headers.contentType = ContentType.json;
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers',
      'Content-Type, Authorization, X-Serverpod-Method');
  response.headers.add('X-Content-Type-Options', 'nosniff');
  response.headers.add('X-Frame-Options', 'DENY');
  response.headers.add('X-XSS-Protection', '1; mode=block');
  if (isProduction) {
    response.headers.add(
        'Strict-Transport-Security', 'max-age=31536000; includeSubDomains');
  }
}
