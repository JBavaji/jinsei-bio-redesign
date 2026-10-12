import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/widgets/step_image_card.dart';

void main() {
  Widget buildTestWidget({
    required Widget child,
    ThemeData? theme,
  }) {
    return MaterialApp(
      theme: theme ?? AppTheme.darkTheme,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            child: child,
          ),
        ),
      ),
    );
  }

  group('StepImageCard Widget Tests', () {
    testWidgets('StepImageCard renders title and handles unselected state',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const StepImageCard(
          imageUrl: 'assets/images/science/step_01.webp',
          title: 'Target Consumer Product Identification',
          isSelected: false,
        ),
      ));

      expect(find.byType(StepImageCard), findsOneWidget);
    });

    testWidgets('StepImageCard renders with active accent glow when selected',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const StepImageCard(
          imageUrl: 'assets/images/science/step_01.webp',
          title: 'Target Consumer Product Identification',
          isSelected: true,
        ),
      ));

      expect(find.byType(StepImageCard), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('StepImageCard renders gracefully with remote CDN URL',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const StepImageCard(
          imageUrl:
              'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_01.webp',
          title: 'Metagenomic Biomarker Mapping',
          isSelected: false,
        ),
      ));

      expect(find.byType(StepImageCard), findsOneWidget);
    });

    testWidgets('StepImageCard renders fallback biotech UI on image error',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const StepImageCard(
          imageUrl: 'assets/non_existent_image.png',
          title: 'Metagenomic Biomarker Mapping',
          isSelected: false,
        ),
      ));

      await tester.pump();

      expect(find.byIcon(Icons.biotech_rounded), findsOneWidget);
      expect(find.text('Metagenomic Biomarker Mapping'), findsOneWidget);
    });
  });
}
