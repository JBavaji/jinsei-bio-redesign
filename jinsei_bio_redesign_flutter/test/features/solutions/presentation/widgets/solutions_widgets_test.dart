import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_quality_assurance_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/widgets/solution_detail_dialog.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/widgets/solutions_header.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/widgets/solutions_metrics_row.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/widgets/solutions_qa_banner.dart';

void main() {
  group('Solutions Sub-Component Widgets Tests (JIN-18)', () {
    testWidgets('SolutionsHeader renders title and subtitle correctly',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: const Scaffold(
            body: SolutionsHeader(),
          ),
        ),
      );

      expect(find.text('Commercial Solutions & Formulation Matrix'),
          findsOneWidget);
      expect(
          find.text(
              'A WIDE SPECTRUM OF APPLICATIONS FOR LACTOBACILLUS BACTERIA'),
          findsOneWidget);
    });

    testWidgets('SolutionsMetricsRow renders metric cards', (tester) async {
      final metrics = [
        SolutionMetricModel.fromJson({
          'iconKey': 'hub_rounded',
          'value': '4',
          'label': 'Commercial Verticals',
          'accentColorHex': '#7BD4E2',
          'displayOrder': 1,
        }),
        SolutionMetricModel.fromJson({
          'iconKey': 'biotech_rounded',
          'value': '54+',
          'label': 'Bio-Formulations',
          'accentColorHex': '#66DD8B',
          'displayOrder': 2,
        }),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: Scaffold(
            body: SolutionsMetricsRow(metrics: metrics),
          ),
        ),
      );

      expect(find.text('4'), findsOneWidget);
      expect(find.text('Commercial Verticals'), findsOneWidget);
      expect(find.text('54+'), findsOneWidget);
      expect(find.text('Bio-Formulations'), findsOneWidget);
    });

    testWidgets('SolutionsQaBanner renders standards, badge, and title',
        (tester) async {
      const qa = SolutionsQualityAssuranceModel(
        title: 'Clinical & Commercial Quality Assurance',
        description: 'ISO 9001:2015 & GMP Certified Production Standards',
        badgeText: 'Pune NCL Innovation Park',
        complianceStandard: 'Bio-Prospecting Ethics Compliant',
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: const Scaffold(
            body: SolutionsQaBanner(qa: qa),
          ),
        ),
      );

      expect(
          find.text('Clinical & Commercial Quality Assurance'), findsOneWidget);
      expect(find.text('Pune NCL Innovation Park'), findsOneWidget);
      expect(find.text('Bio-Prospecting Ethics Compliant'), findsOneWidget);
    });

    testWidgets(
        'SolutionDetailDialog renders full formulation details and triggers callback',
        (tester) async {
      final solution = SolutionCardModel.fromJson({
        'solutionId': 'sol_test_diag',
        'categoryTag': 'DERMO-BIOTICS',
        'title': 'Dermo-Biotics & Topical Therapeutics',
        'subtitle': 'Live Probiotic Cosmeceuticals',
        'description': 'Targeted topical skin microbiome therapeutics.',
        'iconKey': 'face_3_rounded',
        'category': 'dermo-biotics',
        'formulationCount': '9 Formulations',
        'keyBenefit': 'Epidermal barrier',
        'efficacyMetric': '>80% C. acnes Inhibition',
        'bulletPoints': ['Epidermal Microbiome Restoration'],
        'actionCtaText': 'Explore',
        'caseStudyUrl': '',
        'displayOrder': 1,
      });

      var sampleRequested = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  SolutionDetailDialog.show(
                    context,
                    solution: solution,
                    onRequestSample: () {
                      sampleRequested = true;
                    },
                  );
                },
                child: const Text('Open Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Dermo-Biotics & Topical Therapeutics'), findsOneWidget);
      expect(find.text('DERMO-BIOTICS'), findsOneWidget);
      expect(find.textContaining('80% C. acnes Inhibition'), findsOneWidget);
      expect(find.text('Request B2B Sample Formulation'), findsOneWidget);

      await tester.tap(find.text('Request B2B Sample Formulation'));
      await tester.pumpAndSettle();

      expect(sampleRequested, isTrue);
    });
  });
}
