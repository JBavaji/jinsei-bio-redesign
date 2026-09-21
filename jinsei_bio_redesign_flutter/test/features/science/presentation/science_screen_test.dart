import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/science_screen.dart';

void main() {
  group('ScienceScreen Widget Tests', () {
    testWidgets('renders ScienceScreen header and step cards', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ScienceScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('PROPRIETARY 10-STEP R&D PIPELINE'), findsOneWidget);
      expect(find.text('Pipeline Milestones'), findsOneWidget);
      expect(
          find.text('Target Consumer Product Identification'), findsOneWidget);
      expect(
        find.text(
            'Application-Specific Strain Identification & Characterization'),
        findsOneWidget,
      );
    });
  });
}
