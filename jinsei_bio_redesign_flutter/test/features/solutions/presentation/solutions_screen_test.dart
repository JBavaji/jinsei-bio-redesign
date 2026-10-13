import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_quality_assurance_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/repositories/i_solutions_repository.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/bloc/solutions_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/bloc/solutions_event.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/solutions_screen.dart';

class MockTestSolutionsRepository implements ISolutionsRepository {
  final SolutionsContentModel mockContent = SolutionsContentModel(
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
        'solutionId': 'human-health',
        'categoryTag': 'PRECISION WELLNESS',
        'title': 'Human Health: Precision Wellness',
        'subtitle': 'Targeted Micro-Flora Therapeutics',
        'description':
            'Clinical-grade strain formulations targeting gut flora.',
        'iconKey': 'health_and_safety_rounded',
        'category': 'human-health',
        'formulationCount': '18 Formulations',
        'keyBenefit': 'Targeted Micro-Flora',
        'efficacyMetric': '88% Clinical Efficacy',
        'bulletPoints': ['Gastrointestinal Homeostasis'],
        'actionCtaText': 'Explore Human Health Range',
        'caseStudyUrl': '',
        'displayOrder': 1,
      }),
      SolutionCardModel.fromJson({
        'solutionId': 'food-tech',
        'categoryTag': 'CLEAN LABEL PROTECTION',
        'title': 'Food Tech & Clean Label Preservation',
        'subtitle': 'Bio-Protective Cultures',
        'description': 'Next-gen microbial bio-protective cultures.',
        'iconKey': 'restaurant_rounded',
        'category': 'food-tech',
        'formulationCount': '12 Formulations',
        'keyBenefit': 'Clean Label Shelf-Life',
        'efficacyMetric': '+45 Days Stability',
        'bulletPoints': ['Dairy & Fermentation Bioprotection'],
        'actionCtaText': 'Explore Food Tech Solutions',
        'caseStudyUrl': '',
        'displayOrder': 2,
      }),
    ],
    qualityAssurance: const SolutionsQualityAssuranceModel(
      title: 'Clinical & Commercial Quality Assurance',
      description: 'ISO 9001:2015 & GMP Certified Production Standards',
      badgeText: 'Pune NCL Innovation Park',
      complianceStandard: 'Bio-Prospecting Ethics Compliant',
    ),
  );

  @override
  Future<SolutionsContentModel> getSolutionsContent() async => mockContent;

  @override
  Future<List<SolutionCardModel>> getSolutions() async => mockContent.solutions;

  @override
  Future<List<SolutionCardModel>> getSolutionsByCategory(
      String category) async {
    if (category == 'all') return mockContent.solutions;
    return mockContent.solutions.where((s) => s.category == category).toList();
  }

  @override
  Future<List<SolutionMetricModel>> getSolutionMetrics() async =>
      mockContent.metrics;
}

void main() {
  Widget buildTestScreen({SolutionsBloc? bloc, ThemeData? theme}) {
    return MaterialApp(
      theme: theme ?? AppTheme.darkTheme,
      home: Scaffold(
        body: SolutionsScreen(bloc: bloc),
      ),
    );
  }

  group('SolutionsScreen Widget Integration Tests (JIN-18)', () {
    testWidgets('renders SolutionsScreen header, tabs, grid, and QA banner',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final bloc = SolutionsBloc(repository: MockTestSolutionsRepository())
        ..add(const LoadSolutionsEvent());

      await tester.pumpWidget(buildTestScreen(bloc: bloc));
      await tester.pumpAndSettle();

      // Header verification
      expect(find.text('Commercial Solutions & Formulation Matrix'),
          findsOneWidget);
      expect(
          find.text(
              'A WIDE SPECTRUM OF APPLICATIONS FOR LACTOBACILLUS BACTERIA'),
          findsOneWidget);

      // Tab selector verification
      expect(find.text('All Verticals (4)'), findsOneWidget);
      expect(find.text('Human Health'), findsOneWidget);
      expect(find.text('Food Tech'), findsOneWidget);
      expect(find.text('Dermo-Biotics'), findsOneWidget);
      expect(find.text('Agri-Tech'), findsOneWidget);

      // Solutions grid items verification
      expect(find.text('Human Health: Precision Wellness'), findsOneWidget);
      expect(find.text('Food Tech & Clean Label Preservation'), findsOneWidget);

      // Quality assurance banner verification
      expect(
          find.text('Clinical & Commercial Quality Assurance'), findsOneWidget);
      expect(find.text('Pune NCL Innovation Park'), findsOneWidget);

      bloc.close();
    });

    testWidgets('filtering by tab updates visible solutions in grid',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final bloc = SolutionsBloc(repository: MockTestSolutionsRepository())
        ..add(const LoadSolutionsEvent());

      await tester.pumpWidget(buildTestScreen(bloc: bloc));
      await tester.pumpAndSettle();

      // Tap "Food Tech" tab
      await tester.tap(find.text('Food Tech'));
      await tester.pumpAndSettle();

      // Food Tech should be visible
      expect(find.text('Food Tech & Clean Label Preservation'), findsOneWidget);
      // Human Health should be filtered out
      expect(find.text('Human Health: Precision Wellness'), findsNothing);

      bloc.close();
    });

    testWidgets('tapping explore button opens SolutionDetailDialog',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final bloc = SolutionsBloc(repository: MockTestSolutionsRepository())
        ..add(const LoadSolutionsEvent());

      await tester.pumpWidget(buildTestScreen(bloc: bloc));
      await tester.pumpAndSettle();

      // Tap "Explore Human Health Range" CTA button
      final exploreCta = find.text('Explore Human Health Range');
      expect(exploreCta, findsOneWidget);

      await tester.ensureVisible(exploreCta);
      await tester.pumpAndSettle();

      await tester.tap(exploreCta);
      await tester.pumpAndSettle();

      // Modal dialog should be displayed with details and Request Formulation Sample button
      expect(find.text('Request B2B Sample Formulation'), findsOneWidget);
      expect(find.textContaining('Efficacy Metric:'), findsOneWidget);

      // Dismiss dialog
      await tester.tap(find.byIcon(Icons.close_rounded));
      await tester.pumpAndSettle();

      expect(find.text('Request B2B Sample Formulation'), findsNothing);

      bloc.close();
    });
  });
}
