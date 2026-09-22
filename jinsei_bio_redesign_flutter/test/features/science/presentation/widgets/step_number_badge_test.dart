import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/widgets/step_number_badge.dart';

void main() {
  Widget buildTestWidget({
    required Widget child,
  }) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }

  group('StepNumberBadge Widget Tests', () {
    testWidgets('StepNumberBadge formats 1-digit number as 2 digits with zero padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const StepNumberBadge(
          stepNumber: 1,
          isSelected: false,
        ),
      ));

      expect(find.byType(StepNumberBadge), findsOneWidget);
      expect(find.text('01'), findsOneWidget);
    });

    testWidgets('StepNumberBadge displays 2-digit number correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const StepNumberBadge(
          stepNumber: 10,
          isSelected: true,
        ),
      ));

      expect(find.byType(StepNumberBadge), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });
  });
}
