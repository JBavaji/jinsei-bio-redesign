import 'dart:convert';
import 'dart:io';

import 'security_headers.dart';

/// Fallback Standalone HTTP Server for local development without active PostgreSQL instance
Future<void> startStandaloneLocalServer(int port) async {
  try {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
    print(
        '🚀 Jinsei Bio Redesign Local Server live at http://localhost:$port/');

    server.listen((HttpRequest request) async {
      final response = request.response;
      applyProductionSecurityHeaders(response);

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
          'version': '1.2.2+14',
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
