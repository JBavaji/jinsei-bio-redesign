import 'dart:io';
import 'package:serverpod/serverpod.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/routes/health_route.dart';
import 'src/server/standalone_sandbox_server.dart';

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
      await startStandaloneLocalServer(8080);
      await startStandaloneLocalServer(8081);
    }
  }
}
