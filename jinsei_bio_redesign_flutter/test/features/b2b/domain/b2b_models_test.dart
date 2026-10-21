import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_modal_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_sample_request_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/formulation_format_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/strain_vertical_option_model.dart';

void main() {
  group('B2B Domain Models Tests (JIN-22)', () {
    test('StrainVerticalOptionModel serializes and deserializes correctly', () {
      const model = StrainVerticalOptionModel(
        strainId: 'gut_pro',
        category: 'HUMAN HEALTH',
        name: 'Jinsei-Gut Pro',
        strainCode: 'L. plantarum JN-04',
        highlight: 'Epithelial adhesion >94%',
        defaultFormat: 'lyophilized_powder',
        displayOrder: 1,
      );

      final json = model.toJson();
      final fromJson = StrainVerticalOptionModel.fromJson(json);

      expect(fromJson, equals(model));
      expect(fromJson.strainId, equals('gut_pro'));
      expect(fromJson.name, equals('Jinsei-Gut Pro'));
    });

    test('FormulationFormatOptionModel serializes and deserializes correctly',
        () {
      const model = FormulationFormatOptionModel(
        formatId: 'lyophilized_powder',
        label: 'Lyophilized Bulk Powder',
        displayOrder: 1,
      );

      final json = model.toJson();
      final fromJson = FormulationFormatOptionModel.fromJson(json);

      expect(fromJson, equals(model));
      expect(fromJson.formatId, equals('lyophilized_powder'));
    });

    test('B2bModalContentModel serializes and deserializes full hierarchy', () {
      const model = B2bModalContentModel(
        badgeText: 'SAMPLING',
        title: 'Request Sample',
        subtitle: 'Research grade isolates',
        strains: [
          StrainVerticalOptionModel(
            strainId: 'femme_flora',
            category: "WOMEN'S FLORA",
            name: 'FemmeFlora',
            strainCode: 'FF-02',
            highlight: 'pH regulation',
            defaultFormat: 'lyophilized_powder',
            displayOrder: 1,
          ),
        ],
        formulationFormats: [
          FormulationFormatOptionModel(
            formatId: 'powder',
            label: 'Powder',
            displayOrder: 1,
          ),
        ],
        complianceNote: 'CoA Included',
        certifications: ['GMP', 'ISO'],
        dispatchNotice: 'Dispatched within 48h',
      );

      final json = model.toJson();
      final fromJson = B2bModalContentModel.fromJson(json);

      expect(fromJson, equals(model));
      expect(fromJson.strains.length, equals(1));
      expect(fromJson.formulationFormats.length, equals(1));
      expect(fromJson.certifications, contains('GMP'));
    });

    test('B2bSampleRequestModel copyWith and JSON roundtrip', () {
      final now = DateTime.now();
      final request = B2bSampleRequestModel(
        strainId: 'metabolimet',
        fullName: 'Dr. Jane Foster',
        email: 'j.foster@labs.io',
        company: 'Foster Labs',
        formulationFormat: 'lyophilized_powder',
        clinicalScope: 'Pilot study',
        trackingId: 'JIN-REQ-2026-TEST01',
        submittedAt: now,
        status: 'pending',
      );

      final json = request.toJson();
      final fromJson = B2bSampleRequestModel.fromJson(json);

      expect(fromJson.strainId, equals('metabolimet'));
      expect(fromJson.fullName, equals('Dr. Jane Foster'));
      expect(fromJson.trackingId, equals('JIN-REQ-2026-TEST01'));

      final modified = request.copyWith(status: 'dispatched');
      expect(modified.status, equals('dispatched'));
      expect(modified.fullName, equals('Dr. Jane Foster'));
    });
  });
}
