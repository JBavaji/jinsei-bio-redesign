import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/collaborations_endpoint.dart';

import '../helpers/mock_session.dart';

void main() {
  group('CollaborationsEndpoint Unit Tests - Content (JIN-68 / JIN-69)', () {
    late CollaborationsEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = CollaborationsEndpoint();
      session = MockSession();
    });

    test('getCollaborationsContent returns complete dynamic collaboration data',
        () async {
      final content = await endpoint.getCollaborationsContent(session);

      // Verify Hero & Header
      expect(
          content.headlineBadge, equals('STRATEGIC ALLIANCES & CRO SERVICES'));
      expect(content.heroTitle, equals('LOOKING TO COLLABORATE WITH US?'));
      expect(content.heroSubtitle, contains('indigenous strain formulations'));

      // Verify 3 Partnership Tracks
      expect(content.tracks.length, equals(3));

      expect(content.tracks[0].trackId, equals('fmcg_integration'));
      expect(content.tracks[0].title, equals('1. FMCG Integration'));
      expect(content.tracks[0].badge, equals('Pillar 1'));
      expect(content.tracks[0].iconKey, equals('sanitizer'));
      expect(content.tracks[0].deliverables,
          contains('Fermentation optimization'));

      expect(content.tracks[1].trackId, equals('lab_cro'));
      expect(content.tracks[1].title, equals('2. LAB CRO Services'));
      expect(content.tracks[1].badge, equals('Pillar 2'));
      expect(content.tracks[1].iconKey, equals('science'));
      expect(content.tracks[1].deliverables, contains('Yield enhancement'));

      expect(content.tracks[2].trackId, equals('co_development'));
      expect(content.tracks[2].title, equals('3. Co-Development'));
      expect(content.tracks[2].badge, equals('Pillar 3'));
      expect(content.tracks[2].iconKey, equals('biotech'));
      expect(content.tracks[2].deliverables, contains('Joint IP development'));

      // Verify Contact & Campus Info
      expect(content.contactInfo.supportEmail, equals('info@jinseibio.com'));
      expect(
          content.contactInfo.facilityAddress, contains('NCL Innovation Park'));
      expect(content.contactInfo.facilityCoordinates,
          equals('18.5362° N, 73.8152° E'));
      expect(content.contactInfo.visitingTimings,
          contains('Monday - Saturday: By Appointment'));
      expect(content.contactInfo.visitingStatus, equals('By Appointment'));

      // Verify Compliance Standards
      expect(content.contactInfo.standards.length, equals(4));
      expect(content.contactInfo.standards[0].title, equals('ISO 9001:2015'));
      expect(content.contactInfo.standards[1].title, equals('GMP Certified'));
      expect(content.contactInfo.standards[2].title, equals('FSSAI Compliant'));
      expect(content.contactInfo.standards[3].title,
          equals('Bio-Prospecting Ethics'));

      // Verify Governance
      expect(content.governanceTitle,
          equals('Scientific Governance & Ethics Assurance'));
      expect(content.governanceDescription,
          contains('ISO 9001:2015 & GMP Certified R&D Standards'));
    });
  });
}
