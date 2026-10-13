import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/solutions_endpoint.dart';

import '../helpers/mock_session.dart';

void main() {
  group('SolutionsEndpoint Unit Tests (JIN-18)', () {
    late SolutionsEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = SolutionsEndpoint();
      session = MockSession();
    });

    test('getSolutionsContent returns 3 metrics, 4 solutions, and QA spec',
        () async {
      final content = await endpoint.getSolutionsContent(session);

      expect(content.metrics.length, equals(3));
      expect(content.solutions.length, equals(4));
      expect(content.qualityAssurance, isNotNull);

      // Verify metrics
      expect(content.metrics[0].label, equals('Commercial Verticals'));
      expect(content.metrics[0].value, equals('4'));
      expect(content.metrics[1].label, equals('Bio-Formulations'));
      expect(content.metrics[1].value, equals('54+'));
      expect(content.metrics[2].label, equals('Non-GMO Indigenous'));
      expect(content.metrics[2].value, equals('100%'));

      // Verify 4 solutions
      expect(content.solutions[0].solutionId, equals('human-health'));
      expect(content.solutions[0].title,
          equals('Human Health: Precision Wellness'));
      expect(content.solutions[0].formulationCount, equals('18 Formulations'));
      expect(content.solutions[0].bulletPoints.length, equals(3));

      expect(content.solutions[1].solutionId, equals('food-tech'));
      expect(content.solutions[1].title,
          equals('Food Tech & Clean Label Preservation'));
      expect(content.solutions[1].formulationCount, equals('12 Formulations'));

      expect(content.solutions[2].solutionId, equals('dermo-biotics'));
      expect(content.solutions[2].title, equals('Dermo-Biotics & Bio-Hygiene'));
      expect(content.solutions[2].formulationCount, equals('9 Formulations'));

      expect(content.solutions[3].solutionId, equals('agri-tech'));
      expect(content.solutions[3].title,
          equals('Agri-Tech & Environmental Security'));
      expect(content.solutions[3].formulationCount, equals('15 Formulations'));
    });

    test('getSolutions returns 4 commercial solutions in order', () async {
      final solutions = await endpoint.getSolutions(session);
      expect(solutions.length, equals(4));
      expect(solutions[0].displayOrder, equals(1));
      expect(solutions[1].displayOrder, equals(2));
      expect(solutions[2].displayOrder, equals(3));
      expect(solutions[3].displayOrder, equals(4));
    });

    test('getSolutionsByCategory filters correctly by category', () async {
      final humanHealth =
          await endpoint.getSolutionsByCategory(session, 'human-health');
      expect(humanHealth.length, equals(1));
      expect(humanHealth[0].title, equals('Human Health: Precision Wellness'));

      final agriTech =
          await endpoint.getSolutionsByCategory(session, 'agri-tech');
      expect(agriTech.length, equals(1));
      expect(agriTech[0].categoryTag, equals('REGENERATIVE AGRI'));

      final invalid =
          await endpoint.getSolutionsByCategory(session, 'non-existent');
      expect(invalid, isEmpty);
    });

    test('getSolutionMetrics returns 3 summary KPI items', () async {
      final metrics = await endpoint.getSolutionMetrics(session);
      expect(metrics.length, equals(3));
      expect(metrics[0].value, equals('4'));
      expect(metrics[1].value, equals('54+'));
      expect(metrics[2].value, equals('100%'));
    });
  });
}
