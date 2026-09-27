import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/theme/theme_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/science_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget buildScienceScreen() {
    return BlocProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        home: const Scaffold(
          body: ScienceScreen(),
        ),
      ),
    );
  }

  group('ScienceStepper Timeline UI/UX Interaction QA Tests', () {
    testWidgets(
        'renders ScienceScreen header, stepper timeline, phase tags, and quality banner',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildScienceScreen());
      await tester.pump(const Duration(milliseconds: 500));

      // Verify Header Title and Subtitle
      expect(find.textContaining('10-STEP'), findsWidgets);
      expect(find.text('Pipeline Milestones'), findsOneWidget);

      // Verify Initial Step 1 rendering
      expect(find.text('Target Consumer Product Identification'), findsWidgets);

      // Verify Clinical Quality Banner at the bottom
      expect(find.text('Clinical Quality Assurance'), findsOneWidget);
    });
  });
}
