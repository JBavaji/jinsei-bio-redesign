import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/collaborations_endpoint.dart';
import 'package:jinsei_bio_redesign_server/src/generated/protocol.dart';

import '../helpers/mock_session.dart';

void main() {
  group(
      'CollaborationsEndpoint Unit Tests - Inquiry Submission (JIN-68 / JIN-69)',
      () {
    late CollaborationsEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = CollaborationsEndpoint();
      session = MockSession();
    });

    test(
        'submitCollaborationInquiry succeeds with valid payload and generates tracking ID',
        () async {
      final inquiry = CollaborationInquiry(
        name: 'Dr. Vikram Seth, Head of R&D',
        email: 'v.seth@nutracare.com',
        organization: 'NutraCare Biotics Ltd.',
        partnershipTrack: 'FMCG Product Integration',
        message:
            'Interested in evaluating L. plantarum JN-04 for synbiotic kefir functional beverage.',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'pending_review',
      );

      final trackingId =
          await endpoint.submitCollaborationInquiry(session, inquiry);

      expect(trackingId, startsWith('JIN-COL-2026-'));
      expect(trackingId.length, greaterThan(15));
    });

    test('submitCollaborationInquiry preserves client trackingId if provided',
        () async {
      final inquiry = CollaborationInquiry(
        name: 'Dr. Anita Roy',
        email: 'anita.roy@iitb.ac.in',
        organization: 'IIT Bombay Bioengineering',
        partnershipTrack: 'Academic Joint R&D',
        message:
            'Collaborative grant proposal on lactic acid bacteria genomics.',
        trackingId: 'JIN-COL-2026-PRESET77',
        submittedAt: DateTime.now(),
        status: 'pending_review',
      );

      final trackingId =
          await endpoint.submitCollaborationInquiry(session, inquiry);
      expect(trackingId, equals('JIN-COL-2026-PRESET77'));
    });

    test('submitCollaborationInquiry throws FormatException on empty name',
        () async {
      final inquiry = CollaborationInquiry(
        name: '  ',
        email: 'v.seth@nutracare.com',
        organization: 'NutraCare',
        partnershipTrack: 'FMCG Product Integration',
        message: 'Scope message here',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'pending_review',
      );

      expect(
        () => endpoint.submitCollaborationInquiry(session, inquiry),
        throwsA(isA<FormatException>()),
      );
    });

    test('submitCollaborationInquiry throws FormatException on invalid email',
        () async {
      final inquiry = CollaborationInquiry(
        name: 'Dr. Vikram Seth',
        email: 'not-an-email-address',
        organization: 'NutraCare',
        partnershipTrack: 'FMCG Product Integration',
        message: 'Scope message here',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'pending_review',
      );

      expect(
        () => endpoint.submitCollaborationInquiry(session, inquiry),
        throwsA(isA<FormatException>()),
      );
    });

    test(
        'submitCollaborationInquiry throws FormatException on empty partnership track',
        () async {
      final inquiry = CollaborationInquiry(
        name: 'Dr. Vikram Seth',
        email: 'v.seth@nutracare.com',
        organization: 'NutraCare',
        partnershipTrack: '   ',
        message: 'Scope message here',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'pending_review',
      );

      expect(
        () => endpoint.submitCollaborationInquiry(session, inquiry),
        throwsA(isA<FormatException>()),
      );
    });

    test('submitCollaborationInquiry throws FormatException on empty message',
        () async {
      final inquiry = CollaborationInquiry(
        name: 'Dr. Vikram Seth',
        email: 'v.seth@nutracare.com',
        organization: 'NutraCare',
        partnershipTrack: 'FMCG Product Integration',
        message: '',
        trackingId: '',
        submittedAt: DateTime.now(),
        status: 'pending_review',
      );

      expect(
        () => endpoint.submitCollaborationInquiry(session, inquiry),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
