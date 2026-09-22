import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_step_model.dart';

void main() {
  group('ScienceStepModel JSON Tests', () {
    test('fromJson & toJson serialization cycle', () {
      final step = ScienceStepModel.defaultSteps.first;
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

    test('loadFromAsset falls back to defaultSteps when bundle is empty or invalid', () async {
      final steps = await ScienceStepModel.loadFromAsset();
      expect(steps.length, equals(10));
    });
  });
}
