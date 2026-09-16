import 'package:serverpod/serverpod.dart';

/// Serverpod endpoint for health check & system status
class HealthEndpoint extends Endpoint {
  Future<String> ping(Session session) async {
    return 'pong: Jinsei Bio Redesign Serverpod API Live';
  }

  Future<Map<String, String>> status(Session session) async {
    return {
      'status': 'HEALTHY',
      'service': 'jinsei_bio_redesign_server',
      'version': '1.0.0',
      'database': 'PostgreSQL',
      'appMode': 'UNOFFICIAL_DEMO',
    };
  }
}
