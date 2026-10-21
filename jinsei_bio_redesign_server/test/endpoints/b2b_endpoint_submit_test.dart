import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/b2b_endpoint.dart';
import 'package:jinsei_bio_redesign_server/src/generated/protocol.dart';

import '../helpers/mock_session.dart';

void main() {
  group('B2bEndpoint Unit Tests - Request Submission (JIN-22)', () {
    late B2bEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = B2bEndpoint();
      session = MockSession();
    });

    test(
        'submitSampleRequest succeeds with valid payload and generates tracking ID',
        () async {
      final request = B2bSampleRequest(
        strainId: 'gut_pro',
        fullName: 'Dr. Rajesh Sharma, VP of R&D',
        email: 'r.sharma@acmepharma.com',
        company: 'Acme Biotherapeutics Ltd.',
        formulationFormat: 'lyophilized_powder',
        clinicalScope: 'Phase-1 GI tolerance exploratory pilot',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'new',
      );

      final trackingId = await endpoint.submitSampleRequest(session, request);

      expect(trackingId, startsWith('JIN-REQ-2026-'));
      expect(trackingId.length, greaterThan(15));
    });

    test('submitSampleRequest preserves client trackingId if provided',
        () async {
      final request = B2bSampleRequest(
        strainId: 'femme_flora',
        fullName: 'Dr. Sarah Connor',
        email: 's.connor@biofemme.org',
        company: 'BioFemme Labs',
        formulationFormat: 'microencapsulated',
        trackingId: 'JIN-REQ-2026-PRESET99',
        submittedAt: DateTime.now(),
        status: 'new',
      );

      final trackingId = await endpoint.submitSampleRequest(session, request);
      expect(trackingId, equals('JIN-REQ-2026-PRESET99'));
    });

    test('submitSampleRequest throws FormatException on invalid email',
        () async {
      final request = B2bSampleRequest(
        strainId: 'gut_pro',
        fullName: 'Dr. Rajesh Sharma',
        email: 'invalid-email-no-at-sign',
        company: 'Acme Biotherapeutics',
        formulationFormat: 'lyophilized_powder',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'new',
      );

      expect(
        () => endpoint.submitSampleRequest(session, request),
        throwsA(isA<FormatException>()),
      );
    });

    test('submitSampleRequest throws FormatException on empty company',
        () async {
      final request = B2bSampleRequest(
        strainId: 'gut_pro',
        fullName: 'Dr. Rajesh Sharma',
        email: 'sharma@acme.com',
        company: '',
        formulationFormat: 'lyophilized_powder',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'new',
      );

      expect(
        () => endpoint.submitSampleRequest(session, request),
        throwsA(isA<FormatException>()),
      );
    });

    test('submitSampleRequest throws FormatException on empty fullName',
        () async {
      final request = B2bSampleRequest(
        strainId: 'gut_pro',
        fullName: '  ',
        email: 'sharma@acme.com',
        company: 'Acme Labs',
        formulationFormat: 'lyophilized_powder',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'new',
      );

      expect(
        () => endpoint.submitSampleRequest(session, request),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
