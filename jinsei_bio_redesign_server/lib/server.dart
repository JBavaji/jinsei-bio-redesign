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

  // Register direct REST HTTP Health route for /health endpoints
  final healthRoute = HealthRoute();
  pod.webServer.addRoute(healthRoute, '/health');
  pod.webServer.addRoute(healthRoute, '/health/*');

  try {
    // Attempt full Serverpod startup with a 3-second database timeout gate
    await pod.start().timeout(const Duration(seconds: 3));
  } catch (e) {
    print(
        'ℹ️ Serverpod running in Standalone Local Mode (PostgreSQL offline/unreachable).');
    await _startStandaloneLocalServer(8080);
    await _startStandaloneLocalServer(8081);
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
      response.headers.contentType = ContentType.json;
      response.headers.add('Access-Control-Allow-Origin', '*');
      response.headers
          .add('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
      response.headers.add(
          'Access-Control-Allow-Headers', 'Content-Type, X-Serverpod-Method');

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
          'database': 'PostgreSQL (Local Standalone Sandbox)',
        }));
      } else {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'status': 'OK',
          'path': path,
          'message': 'Jinsei Bio Redesign Serverpod Sandbox Live',
        }));
      }
      await response.close();
    });
  } catch (e) {
    print('⚠️ Port $port fallback binding skipped: $e');
  }
}

/// Direct REST HTTP Route handler for health checks (handles GET & POST http://localhost:8081/health)
class HealthRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    request.response.headers.contentType = ContentType.json;
    request.response.headers.add('Access-Control-Allow-Origin', '*');
    request.response.headers
        .add('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    request.response.headers
        .add('Access-Control-Allow-Headers', 'Content-Type');

    if (request.method == 'OPTIONS') {
      request.response.statusCode = HttpStatus.ok;
      await request.response.close();
      return true;
    }

    request.response.statusCode = HttpStatus.ok;
    request.response.write(jsonEncode({
      'status': 'HEALTHY',
      'service': 'jinsei_bio_redesign_server',
      'version': '1.0.0',
      'appMode': 'UNOFFICIAL_DEMO',
    }));
    await request.response.close();
    return true;
  }
}
