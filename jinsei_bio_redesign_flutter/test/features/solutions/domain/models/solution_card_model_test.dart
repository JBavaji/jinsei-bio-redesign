import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_quality_assurance_model.dart';

void main() {
  group('Solutions Domain Models Tests', () {
    test('SolutionCategoryExtension provides correct id and label', () {
      expect(SolutionCategory.all.id, equals('all'));
      expect(SolutionCategory.all.label, equals('All Verticals (4)'));

      expect(SolutionCategory.humanHealth.id, equals('human-health'));
      expect(SolutionCategory.humanHealth.label, equals('Human Health'));

      expect(SolutionCategory.foodTech.id, equals('food-tech'));
      expect(SolutionCategory.foodTech.label, equals('Food Tech'));

      expect(SolutionCategory.dermoBiotics.id, equals('dermo-biotics'));
      expect(SolutionCategory.dermoBiotics.label, equals('Dermo-Biotics'));

      expect(SolutionCategory.agriTech.id, equals('agri-tech'));
      expect(SolutionCategory.agriTech.label, equals('Agri-Tech'));
    });

    test('SolutionCardModel fromJson and toJson serializes correctly', () {
      final json = {
        'solutionId': 'sol_human_health',
        'categoryTag': 'PHARMACEUTICAL GRADE',
        'title': 'Human Health & Clinical Nutrition',
        'subtitle': 'Therapeutic L. Bacteria',
        'description': 'Targeted therapeutic probiotic formulations.',
        'iconKey': 'health_and_safety_rounded',
        'category': 'human-health',
        'formulationCount': '18 Formulations',
        'keyBenefit': 'High survival rate',
        'efficacyMetric': '>94% Viability',
        'bulletPoints': ['Gut-microbiome', 'Immuno-modulation'],
        'actionCtaText': 'Explore Human Health',
        'caseStudyUrl': '/cases/human-health',
        'displayOrder': 1,
      };

      final model = SolutionCardModel.fromJson(json);

      expect(model.solutionId, equals('sol_human_health'));
      expect(model.categoryTag, equals('PHARMACEUTICAL GRADE'));
      expect(model.title, equals('Human Health & Clinical Nutrition'));
      expect(model.icon, equals(Icons.health_and_safety_rounded));
      expect(model.category, equals('human-health'));
      expect(model.formulationCount, equals('18 Formulations'));
      expect(model.bulletPoints.length, equals(2));
      expect(model.bulletPoints.first, equals('Gut-microbiome'));
      expect(model.displayOrder, equals(1));

      final serialized = model.toJson();
      expect(serialized['solutionId'], equals('sol_human_health'));
      expect(serialized['title'], equals('Human Health & Clinical Nutrition'));
      expect(serialized['bulletPoints'],
          equals(['Gut-microbiome', 'Immuno-modulation']));
    });

    test('SolutionMetricModel fromJson and toJson serializes correctly', () {
      final json = {
        'iconKey': 'hub_rounded',
        'value': '4',
        'label': 'Commercial Verticals',
        'accentColorHex': '#7BD4E2',
        'displayOrder': 1,
      };

      final metric = SolutionMetricModel.fromJson(json);
      expect(metric.iconKey, equals('hub_rounded'));
      expect(metric.label, equals('Commercial Verticals'));
      expect(metric.value, equals('4'));
      expect(metric.accentColorHex, equals('#7BD4E2'));
      expect(metric.displayOrder, equals(1));

      final serialized = metric.toJson();
      expect(serialized['iconKey'], equals('hub_rounded'));
      expect(serialized['value'], equals('4'));
    });

    test(
        'SolutionsQualityAssuranceModel fromJson and toJson serializes correctly',
        () {
      final json = {
        'title': 'Clinical & Commercial Quality Assurance',
        'description': 'ISO 9001:2015 & GMP Certified Production Standards',
        'badgeText': 'Pune NCL Innovation Park',
        'complianceStandard': 'Bio-Prospecting Ethics Compliant',
      };

      final qa = SolutionsQualityAssuranceModel.fromJson(json);
      expect(qa.title, equals('Clinical & Commercial Quality Assurance'));
      expect(qa.badgeText, equals('Pune NCL Innovation Park'));

      final serialized = qa.toJson();
      expect(serialized['complianceStandard'],
          equals('Bio-Prospecting Ethics Compliant'));
    });

    test('SolutionsContentModel fromJson and toJson serializes full model tree',
        () {
      final json = {
        'metrics': [
          {
            'iconKey': 'biotech_rounded',
            'label': 'Bio-Formulations',
            'value': '54+',
            'accentColorHex': '#66DD8B',
            'displayOrder': 1,
          }
        ],
        'solutions': [
          {
            'solutionId': 'sol_01',
            'categoryTag': 'AGRI',
            'title': 'Agri-Tech',
            'subtitle': 'Soil Nutrition',
            'description': 'Probiotic bio-fertilizers',
            'iconKey': 'eco_rounded',
            'category': 'agri-tech',
            'formulationCount': '15 Formulations',
            'keyBenefit': 'Soil health',
            'efficacyMetric': '>80% root growth',
            'bulletPoints': ['Yield +22%'],
            'actionCtaText': 'Explore Agri-Tech',
            'caseStudyUrl': '',
            'displayOrder': 1,
          }
        ],
        'qualityAssurance': {
          'title': 'QA Test Title',
          'description': 'QA Test Desc',
          'badgeText': 'NCL',
          'complianceStandard': 'Ethics',
        },
      };

      final content = SolutionsContentModel.fromJson(json);
      expect(content.metrics.length, equals(1));
      expect(content.metrics.first.value, equals('54+'));
      expect(content.solutions.length, equals(1));
      expect(content.solutions.first.categoryTag, equals('AGRI'));
      expect(content.qualityAssurance?.title, equals('QA Test Title'));

      final serialized = content.toJson();
      expect(serialized['metrics'], isNotEmpty);
      expect(serialized['solutions'], isNotEmpty);
      expect(serialized['quality_assurance']['title'], equals('QA Test Title'));
    });
  });
}
