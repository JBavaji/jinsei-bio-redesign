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

  // Start the Serverpod Server
  await pod.start();
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
    request.response.write(
        '{"status":"HEALTHY","service":"jinsei_bio_redesign_server","version":"1.0.0","appMode":"UNOFFICIAL_DEMO"}');
    await request.response.close();
    return true;
  }
}
