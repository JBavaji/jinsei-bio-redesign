import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/failures/solutions_failure.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_quality_assurance_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/repositories/i_solutions_repository.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/bloc/solutions_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/bloc/solutions_event.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/bloc/solutions_state.dart';

class MockSolutionsRepository implements ISolutionsRepository {
  final bool shouldFail;
  final SolutionsContentModel mockContent;

  MockSolutionsRepository({
    this.shouldFail = false,
    SolutionsContentModel? content,
  }) : mockContent = content ??
            SolutionsContentModel(
              metrics: [
                SolutionMetricModel.fromJson({
                  'iconKey': 'hub_rounded',
                  'value': '4',
                  'label': 'Commercial Verticals',
                  'accentColorHex': '#7BD4E2',
                  'displayOrder': 1,
                }),
              ],
              solutions: [
                SolutionCardModel.fromJson({
                  'solutionId': 'sol_human_health',
                  'categoryTag': 'PRECISION WELLNESS',
                  'title': 'Human Health: Precision Wellness',
                  'subtitle': 'Therapeutic L. Bacteria',
                  'description': 'Targeted therapeutics',
                  'iconKey': 'health_and_safety_rounded',
                  'category': 'human-health',
                  'formulationCount': '18 Formulations',
                  'keyBenefit': 'High survival rate',
                  'efficacyMetric': '>94% Viability',
                  'bulletPoints': ['Gut-microbiome'],
                  'actionCtaText': 'Explore',
                  'caseStudyUrl': '',
                  'displayOrder': 1,
                }),
                SolutionCardModel.fromJson({
                  'solutionId': 'sol_food_tech',
                  'categoryTag': 'CLEAN LABEL',
                  'title': 'Food Tech',
                  'subtitle': 'Bio-Protective Cultures',
                  'description': 'Preservative replacement',
                  'iconKey': 'restaurant_rounded',
                  'category': 'food-tech',
                  'formulationCount': '12 Formulations',
                  'keyBenefit': 'Extended shelf-life',
                  'efficacyMetric': '+45 Days',
                  'bulletPoints': ['Shelf-life'],
                  'actionCtaText': 'Explore',
                  'caseStudyUrl': '',
                  'displayOrder': 2,
                }),
              ],
              qualityAssurance: const SolutionsQualityAssuranceModel(
                title: 'Quality Assurance',
                description: 'ISO & GMP standards',
                badgeText: 'Pune NCL',
                complianceStandard: 'Ethics',
              ),
            );

  @override
  Future<SolutionsContentModel> getSolutionsContent() async {
    if (shouldFail) {
      throw const SolutionsNetworkFailure('Simulated server error');
    }
    return mockContent;
  }

  @override
  Future<List<SolutionCardModel>> getSolutions() async {
    return mockContent.solutions;
  }

  @override
  Future<List<SolutionCardModel>> getSolutionsByCategory(
      String category) async {
    if (category == 'all') return mockContent.solutions;
    return mockContent.solutions.where((s) => s.category == category).toList();
  }

  @override
  Future<List<SolutionMetricModel>> getSolutionMetrics() async {
    return mockContent.metrics;
  }
}

void main() {
  group('SolutionsBloc State Lifecycle Tests (JIN-18)', () {
    late SolutionsBloc bloc;
    late MockSolutionsRepository repository;

    setUp(() {
      repository = MockSolutionsRepository();
      bloc = SolutionsBloc(repository: repository);
    });

    tearDown(() {
      bloc.close();
    });

    test('Initial state is idle with correct defaults', () {
      expect(bloc.state.isIdle, isTrue);
      expect(bloc.state.isLoading, isFalse);
      expect(bloc.state.isLoaded, isFalse);
      expect(bloc.state.isSuccess, isFalse);
      expect(bloc.state.isFailed, isFalse);
      expect(bloc.state.metrics, isEmpty);
      expect(bloc.state.solutions, isEmpty);
      expect(bloc.state.selectedCategory, equals(SolutionCategory.all));
      expect(bloc.state.selectedCardIndex, equals(0));
      expect(bloc.state.selectedCard, isNull);
    });

    test('LoadSolutionsEvent emits loading, loaded, and success states',
        () async {
      bloc.add(const LoadSolutionsEvent());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<SolutionsState>()
              .having((s) => s.isLoading, 'isLoading', isTrue)
              .having((s) => s.status, 'status', SolutionsStatus.loading),
          isA<SolutionsState>()
              .having((s) => s.isLoaded, 'isLoaded', isTrue)
              .having((s) => s.metrics.length, 'metrics count', 1)
              .having((s) => s.solutions.length, 'solutions count', 2)
              .having((s) => s.qualityAssurance?.badgeText, 'badgeText',
                  equals('Pune NCL')),
          isA<SolutionsState>()
              .having((s) => s.isSuccess, 'isSuccess', isTrue)
              .having((s) => s.selectedCard?.title, 'selected card title',
                  equals('Human Health: Precision Wellness')),
        ]),
      );
    });

    test('FilterSolutionsCategoryEvent filters cards accurately', () async {
      bloc.add(const LoadSolutionsEvent());
      await bloc.stream.firstWhere((s) => s.isSuccess);

      expect(bloc.state.filteredSolutions.length, equals(2));

      bloc.add(const FilterSolutionsCategoryEvent(SolutionCategory.foodTech));

      await expectLater(
        bloc.stream,
        emits(
          isA<SolutionsState>()
              .having((s) => s.selectedCategory, 'category',
                  equals(SolutionCategory.foodTech))
              .having((s) => s.filteredSolutions.length,
                  'filteredSolutions count', equals(1))
              .having((s) => s.filteredSolutions.first.category,
                  'filtered item', equals('food-tech')),
        ),
      );
    });

    test('SelectSolutionCardEvent updates selectedCardIndex within bounds',
        () async {
      bloc.add(const LoadSolutionsEvent());
      await bloc.stream.firstWhere((s) => s.isSuccess);

      bloc.add(const SelectSolutionCardEvent(1));

      await expectLater(
        bloc.stream,
        emits(
          isA<SolutionsState>()
              .having(
                  (s) => s.selectedCardIndex, 'selectedCardIndex', equals(1))
              .having((s) => s.selectedCard?.solutionId, 'selectedCardId',
                  equals('sol_food_tech')),
        ),
      );
    });

    test('LoadSolutionsEvent handles failures and emits isFailed true',
        () async {
      final failingRepo = MockSolutionsRepository(shouldFail: true);
      final failingBloc = SolutionsBloc(repository: failingRepo);

      failingBloc.add(const LoadSolutionsEvent());

      await expectLater(
        failingBloc.stream,
        emitsInOrder([
          isA<SolutionsState>().having((s) => s.isLoading, 'isLoading', isTrue),
          isA<SolutionsState>()
              .having((s) => s.isFailed, 'isFailed', isTrue)
              .having((s) => s.errorMessage, 'errorMessage', isNotNull),
        ]),
      );

      failingBloc.close();
    });
  });
}
