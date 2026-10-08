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
    // Attempt Serverpod startup with a 4-second timeout gate for database readiness
    await pod.start().timeout(const Duration(seconds: 4));
  } catch (e) {
    print(
        'ℹ️ Serverpod DB unavailable ($e). Falling back to Standalone Sandbox Server on port 8080.');
    await startStandaloneLocalServer(8080);
  }
}
