import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/health_endpoint.dart';
import 'package:jinsei_bio_redesign_server/src/utils/version_service.dart';

import '../helpers/mock_session.dart';

void main() {
  group('HealthEndpoint Unit Tests', () {
    late HealthEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = HealthEndpoint();
      session = MockSession();
    });

    test('ping returns healthy pong message with service identity', () async {
      final response = await endpoint.ping(session);
      expect(response, contains('pong'));
      expect(response, contains('Jinsei Bio Redesign Serverpod API Live'));
    });

    test('status returns system status map matching production contracts',
        () async {
      final statusMap = await endpoint.status(session);

      expect(statusMap['status'], equals('HEALTHY'));
      expect(statusMap['service'], equals('jinsei_bio_redesign_server'));
      expect(statusMap['version'], equals(VersionService.version));
      expect(statusMap['database'], equals('PostgreSQL'));
      expect(statusMap['appMode'], equals('UNOFFICIAL_DEMO'));
    });
  });
}
