import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/widgets/solution_card_widget.dart';

void main() {
  final testSolution = SolutionCardModel.fromJson({
    'solutionId': 'sol_test_01',
    'categoryTag': 'PRECISION WELLNESS',
    'title': 'Human Health: Precision Wellness',
    'subtitle': 'Targeted Micro-Flora Therapeutics',
    'description': 'Clinical-grade strain formulations targeting gut flora.',
    'iconKey': 'health_and_safety_rounded',
    'category': 'human-health',
    'formulationCount': '18 Formulations',
    'keyBenefit': 'Targeted Micro-Flora',
    'efficacyMetric': '88% Clinical Efficacy',
    'bulletPoints': [
      'Gastrointestinal Homeostasis: Targeted IBS restore.',
      'Urogenital Health: L. crispatus consortia.',
      'Metabolic Signalling: Precision bile salt hydrolase.',
    ],
    'actionCtaText': 'Explore Human Health Range',
    'caseStudyUrl': '',
    'displayOrder': 1,
  });

  Widget buildTestWidget({
    required Widget child,
    ThemeData? theme,
  }) {
    return MaterialApp(
      theme: theme ?? AppTheme.darkTheme,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 500,
            height: 650,
            child: child,
          ),
        ),
      ),
    );
  }

  group('SolutionCardWidget Tests (JIN-18)', () {
    testWidgets('renders all solution card details correctly in Dark Mode',
        (tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: SolutionCardWidget(
          solution: testSolution,
          isSelected: false,
          onTap: () {},
          onExplore: () {},
        ),
      ));

      expect(find.text('Human Health: Precision Wellness'), findsOneWidget);
      expect(find.text('Targeted Micro-Flora Therapeutics'), findsOneWidget);
      expect(find.text('PRECISION WELLNESS'), findsOneWidget);
      expect(find.text('18 Formulations'), findsOneWidget);
      expect(find.text('Explore Human Health Range'), findsOneWidget);
      expect(
          find.textContaining('Gastrointestinal Homeostasis'), findsOneWidget);
    });

    testWidgets('renders all solution card details correctly in Light Mode',
        (tester) async {
      await tester.pumpWidget(buildTestWidget(
        theme: AppTheme.lightTheme,
        child: SolutionCardWidget(
          solution: testSolution,
          isSelected: true,
          onTap: () {},
          onExplore: () {},
        ),
      ));

      expect(find.text('Human Health: Precision Wellness'), findsOneWidget);
      expect(find.text('18 Formulations'), findsOneWidget);
    });

    testWidgets('calls onTap when user taps anywhere on the card',
        (tester) async {
      var tapCalled = false;

      await tester.pumpWidget(buildTestWidget(
        child: SolutionCardWidget(
          solution: testSolution,
          isSelected: false,
          onTap: () {
            tapCalled = true;
          },
          onExplore: () {},
        ),
      ));

      await tester.tap(find.text('Human Health: Precision Wellness'));
      await tester.pumpAndSettle();

      expect(tapCalled, isTrue);
    });

    testWidgets('calls onExplore when user taps the action CTA button',
        (tester) async {
      var exploreCalled = false;

      await tester.pumpWidget(buildTestWidget(
        child: SolutionCardWidget(
          solution: testSolution,
          isSelected: false,
          onTap: () {},
          onExplore: () {
            exploreCalled = true;
          },
        ),
      ));

      await tester.tap(find.text('Explore Human Health Range'));
      await tester.pumpAndSettle();

      expect(exploreCalled, isTrue);
    });
  });
}
