import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/generated/protocol.dart';

void main() {
  group('Science Protocol Models Tests (JIN-58)', () {
    test('ScienceHeaderMetric instantiates correctly with required fields', () {
      final metric = ScienceHeaderMetric(
        iconKey: 'science_rounded',
        value: '10',
        label: 'Pipeline Milestones',
        accentColorHex: '#7BD4E2',
        displayOrder: 1,
      );

      expect(metric.iconKey, equals('science_rounded'));
      expect(metric.value, equals('10'));
      expect(metric.label, equals('Pipeline Milestones'));
      expect(metric.accentColorHex, equals('#7BD4E2'));
      expect(metric.displayOrder, equals(1));
    });

    test('ScienceStep instantiates correctly with all 10-step attributes', () {
      final step = ScienceStep(
        stepNumber: 1,
        title: 'Target Consumer Product Identification',
        subtitle: 'Metagenomic Biomarker Mapping',
        description:
            'We begin by working with you to clearly define the target consumer product.',
        category: 'discovery',
        iconKey: 'search_rounded',
        metricValue: '99.4%',
        metricLabel: 'Target Precision',
        imageUrl:
            'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_01.webp',
        displayOrder: 1,
      );

      expect(step.stepNumber, equals(1));
      expect(step.title, equals('Target Consumer Product Identification'));
      expect(step.category, equals('discovery'));
      expect(step.metricValue, equals('99.4%'));
      expect(
          step.imageUrl,
          equals(
              'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_01.webp'));
    });

    test('ClinicalQualityAssurance instantiates with compliance standards', () {
      final qa = ClinicalQualityAssurance(
        title: 'Clinical Quality & Regulatory Assurance',
        description: 'Certified ISO 9001 and cGMP compliant pipeline.',
        badgeText: 'cGMP Certified',
        complianceStandard: 'ISO 9001:2015',
      );

      expect(qa.title, equals('Clinical Quality & Regulatory Assurance'));
      expect(qa.badgeText, equals('cGMP Certified'));
      expect(qa.complianceStandard, equals('ISO 9001:2015'));
    });

    test(
        'ScienceContent aggregates headerMetrics, pipelineSteps, and clinicalQa',
        () {
      final content = ScienceContent(
        headerMetrics: [
          ScienceHeaderMetric(
            iconKey: 'biotech_rounded',
            value: '100%',
            label: 'Sequence Coverage',
            accentColorHex: '#66DD8B',
            displayOrder: 1,
          ),
        ],
        pipelineSteps: [
          ScienceStep(
            stepNumber: 1,
            title: 'Strain Discovery',
            subtitle: 'Sub',
            description: 'Desc',
            category: 'discovery',
            iconKey: 'search',
            metricValue: '500+',
            metricLabel: 'Strains',
            imageUrl: 'step_1.jpg',
            displayOrder: 1,
          ),
        ],
        clinicalQa: ClinicalQualityAssurance(
          title: 'QA',
          description: 'Desc',
          badgeText: 'cGMP',
          complianceStandard: 'FDA',
        ),
      );

      expect(content.headerMetrics.length, equals(1));
      expect(content.pipelineSteps.length, equals(1));
      expect(content.clinicalQa?.badgeText, equals('cGMP'));
    });
  });
}
