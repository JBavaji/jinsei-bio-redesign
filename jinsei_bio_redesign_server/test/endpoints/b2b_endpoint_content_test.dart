import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/b2b_endpoint.dart';

import '../helpers/mock_session.dart';

void main() {
  group('B2bEndpoint Unit Tests - Modal Content (JIN-22)', () {
    late B2bEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = B2bEndpoint();
      session = MockSession();
    });

    test('getModalContent returns complete dynamic modal specification',
        () async {
      final content = await endpoint.getModalContent(session);

      expect(content.badgeText,
          equals('COMMERCIAL FORMULATION & ISOLATE SAMPLING'));
      expect(content.title, equals('Request B2B Formulation Sample'));
      expect(content.subtitle, contains('Lactobacillus isolates'));

      // Verify 4 Strains
      expect(content.strains.length, equals(4));
      expect(content.strains[0].strainId, equals('gut_pro'));
      expect(content.strains[0].name, equals('Jinsei-Gut Pro'));
      expect(content.strains[0].strainCode, equals('L. plantarum JN-04'));
      expect(content.strains[0].category, equals('HUMAN HEALTH'));
      expect(content.strains[0].highlight, equals('Epithelial adhesion >94%'));

      expect(content.strains[1].strainId, equals('femme_flora'));
      expect(content.strains[1].name, equals('FemmeFlora Bio-Shield'));
      expect(content.strains[1].strainCode, equals('L. crispatus FF-02'));

      expect(content.strains[2].strainId, equals('metabolimet'));
      expect(content.strains[2].name, equals('MetaboliMet Probiotic'));
      expect(content.strains[2].strainCode, equals('L. gasseri JN-08'));

      expect(content.strains[3].strainId, equals('custom_cro'));
      expect(content.strains[3].name, equals('Custom LAB Isolate'));
      expect(content.strains[3].strainCode, equals('CRO Co-Development'));

      // Verify 4 Formulation Formats
      expect(content.formulationFormats.length, equals(4));
      expect(
          content.formulationFormats[0].formatId, equals('lyophilized_powder'));
      expect(content.formulationFormats[0].label,
          contains('Lyophilized Bulk Powder'));
      expect(
          content.formulationFormats[1].formatId, equals('microencapsulated'));
      expect(
          content.formulationFormats[2].formatId, equals('slurry_concentrate'));
      expect(content.formulationFormats[3].formatId, equals('oral_sachet'));

      // Verify Compliance & Disclaimers
      expect(content.complianceNote, contains('Certificate of Analysis (CoA)'));
      expect(content.certifications, contains('ISO 9001:2015'));
      expect(content.certifications, contains('GMP Certified'));
      expect(content.dispatchNotice, contains('Pune NCL Innovation Park'));
    });
  });
}
