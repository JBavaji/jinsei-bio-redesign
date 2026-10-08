import 'dart:io';
import 'package:serverpod/serverpod.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/routes/health_route.dart';
import 'src/server/standalone_sandbox_server.dart';

/// Serverpod initialization & launcher entrypoint for Jinsei Bio Redesign Server
void run(List<String> args) async {
  // Check if running on Cloud Run or in Standalone Staging Demo mode
  final isCloudRun = Platform.environment.containsKey('K_SERVICE') ||
      Platform.environment['RUN_MODE'] == 'staging' ||
      Platform.environment['APP_MODE'] == 'UNOFFICIAL_DEMO';

  if (isCloudRun) {
    print('🚀 Starting Jinsei Bio Server on 0.0.0.0:8080 (Cloud Run)...');
    await startStandaloneLocalServer(8080);
    return;
  }

  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  final runMode = pod.runMode;
  final isProduction = runMode == 'production';

  final healthRoute = HealthRoute(isProduction: isProduction);
  pod.webServer.addRoute(healthRoute, '/health');
  pod.webServer.addRoute(healthRoute, '/health/*');

  try {
    await pod.start().timeout(const Duration(seconds: 4));
  } catch (e) {
    print(
        'ℹ️ Serverpod DB unavailable ($e). Falling back to Standalone Sandbox Server on 0.0.0.0:8080.');
    await startStandaloneLocalServer(8080);
  }
}
