import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_step_model.dart';

void main() {
  group('ScienceStepModel JSON Tests', () {
    test('fromJson & toJson serialization cycle', () {
      const step = ScienceStepModel(
        stepNumber: 1,
        title: 'Target Consumer Product Identification',
        subtitle: 'Metagenomic Biomarker Mapping',
        description: 'Test description',
        category: ScienceStepCategory.discovery,
        icon: Icons.search_rounded,
        iconKey: 'search_rounded',
        metricValue: '99.4%',
        metricLabel: 'Target Precision',
        imageUrl: 'assets/images/science/step_01.jpg',
      );
      final json = step.toJson();

      expect(json['stepNumber'], equals(1));
      expect(json['category'], equals('discovery'));
      expect(json['iconKey'], equals('search_rounded'));

      final restored = ScienceStepModel.fromJson(json);

      expect(restored.stepNumber, equals(step.stepNumber));
      expect(restored.title, equals(step.title));
      expect(restored.category, equals(step.category));
      expect(restored.icon.codePoint, equals(step.icon.codePoint));
      expect(restored.metricValue, equals(step.metricValue));
      expect(restored.imageUrl, equals(step.imageUrl));
    });

    test('fromJson handles fallback defaults gracefully', () {
      final emptyJson = <String, dynamic>{};
      final step = ScienceStepModel.fromJson(emptyJson);

      expect(step.stepNumber, equals(1));
      expect(step.category, equals(ScienceStepCategory.discovery));
      expect(step.icon, equals(Icons.biotech_rounded));
      expect(step.title, isEmpty);
    });

    test('loadFromAsset returns empty list on invalid asset path', () async {
      final steps =
          await ScienceStepModel.loadFromAsset(path: 'invalid/path.json');
      expect(steps, isEmpty);
    });
  });
}
