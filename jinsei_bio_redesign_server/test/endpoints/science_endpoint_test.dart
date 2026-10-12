import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/science_endpoint.dart';
import 'package:jinsei_bio_redesign_server/src/generated/protocol.dart';

import '../helpers/mock_session.dart';

void main() {
  group('ScienceEndpoint Unit Tests (JIN-59)', () {
    late ScienceEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = ScienceEndpoint();
      session = MockSession();
    });

    test('getClinicalQa returns non-null clinical QA specifications', () async {
      final qa = await endpoint.getClinicalQa(session);
      expect(qa.title, equals('Clinical Validation & Standards'));
      expect(qa.badgeText, equals('ISO 22000 & GMP Certified'));
      expect(qa.complianceStandard, contains('DCGI & US-FDA'));
      expect(qa.description, isNotEmpty);
    });

    test(
        'getScienceContent falls back to default 10 steps, 3 metrics, and clinical QA when DB is unavailable',
        () async {
      final content = await endpoint.getScienceContent(session);

      expect(content.headerMetrics.length, equals(3));
      expect(content.pipelineSteps.length, equals(10));
      expect(content.clinicalQa, isNotNull);

      // Verify header metrics
      expect(content.headerMetrics[0].label, equals('Pipeline Milestones'));
      expect(content.headerMetrics[0].value, equals('10'));
      expect(content.headerMetrics[0].accentColorHex, equals('#7BD4E2'));
      expect(content.headerMetrics[0].displayOrder, equals(1));

      expect(content.headerMetrics[1].label, equals('Sequence Coverage'));
      expect(content.headerMetrics[1].value, equals('100%'));
      expect(content.headerMetrics[1].accentColorHex, equals('#66DD8B'));
      expect(content.headerMetrics[1].displayOrder, equals(2));

      expect(content.headerMetrics[2].label, equals('Global Patents Filed'));
      expect(content.headerMetrics[2].value, equals('3'));
      expect(content.headerMetrics[2].accentColorHex, equals('#7BD4E2'));
      expect(content.headerMetrics[2].displayOrder, equals(3));

      // Verify step order and details
      expect(content.pipelineSteps[0].stepNumber, equals(1));
      expect(content.pipelineSteps[0].title,
          equals('Target Consumer Product Identification'));
      expect(content.pipelineSteps[0].category, equals('discovery'));

      expect(content.pipelineSteps[9].stepNumber, equals(10));
      expect(content.pipelineSteps[9].title,
          equals('Continuous Improvement of Strains & Process'));
      expect(content.pipelineSteps[9].category, equals('commercial'));
    });

    test('getScienceSteps returns 10 pipeline steps under fallback mode',
        () async {
      final steps = await endpoint.getScienceSteps(session);

      expect(steps.length, equals(10));
      for (var i = 0; i < 10; i++) {
        expect(steps[i].stepNumber, equals(i + 1));
        expect(steps[i].displayOrder, equals(i + 1));
        expect(steps[i].title, isNotEmpty);
        expect(steps[i].subtitle, isNotEmpty);
        expect(steps[i].description, isNotEmpty);
        expect(steps[i].category, isNotEmpty);
        expect(steps[i].metricValue, isNotEmpty);
        expect(steps[i].metricLabel, isNotEmpty);
        expect(steps[i].imageUrl, contains('assets/images/science/step_'));
      }
    });

    test('getHeaderMetrics returns 3 metrics under fallback mode', () async {
      final metrics = await endpoint.getHeaderMetrics(session);

      expect(metrics.length, equals(3));
      expect(metrics.map((m) => m.label).toList(), [
        'Pipeline Milestones',
        'Sequence Coverage',
        'Global Patents Filed',
      ]);
    });

    test('ScienceStep CRUD operations throw on unconfigured database session',
        () async {
      final testStep = ScienceStep(
        stepNumber: 99,
        title: 'Test Step',
        subtitle: 'Test Subtitle',
        description: 'Test Description',
        category: 'testing',
        iconKey: 'test_icon',
        metricValue: '100%',
        metricLabel: 'Test Metric',
        imageUrl: 'test.jpg',
        displayOrder: 99,
      );

      expect(
        () => endpoint.createScienceStep(session, testStep),
        throwsA(anything),
      );
      expect(
        () => endpoint.updateScienceStep(session, testStep),
        throwsA(anything),
      );
      expect(
        () => endpoint.deleteScienceStep(session, 1),
        throwsA(anything),
      );
    });

    test(
        'ScienceHeaderMetric CRUD operations throw on unconfigured database session',
        () async {
      final testMetric = ScienceHeaderMetric(
        iconKey: 'test_icon',
        value: '99',
        label: 'Test Label',
        accentColorHex: '#FFFFFF',
        displayOrder: 99,
      );

      expect(
        () => endpoint.createHeaderMetric(session, testMetric),
        throwsA(anything),
      );
      expect(
        () => endpoint.updateHeaderMetric(session, testMetric),
        throwsA(anything),
      );
      expect(
        () => endpoint.deleteHeaderMetric(session, 1),
        throwsA(anything),
      );
    });
  });
}
