import 'dart:convert';
import 'dart:io';
import 'package:serverpod/serverpod.dart';

import '../server/security_headers.dart';

/// Direct REST HTTP Route handler for health checks (handles GET & POST)
class HealthRoute extends Route {
  final bool isProduction;

  HealthRoute({this.isProduction = false});

  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    final response = request.response;
    applyProductionSecurityHeaders(response, isProduction: isProduction);

    if (request.method == 'OPTIONS') {
      response.statusCode = HttpStatus.ok;
      await response.close();
      return true;
    }

    response.statusCode = HttpStatus.ok;
    response.write(jsonEncode({
      'status': 'HEALTHY',
      'service': 'jinsei_bio_redesign_server',
      'version': '1.2.2+14',
      'appMode': 'UNOFFICIAL_DEMO',
      'environment': session.serverpod.runMode,
      'timestamp': DateTime.now().toUtc().toIso8601String(),
    }));
    await response.close();
    return true;
  }
}
