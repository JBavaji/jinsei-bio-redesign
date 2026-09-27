import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/features/splash/presentation/widgets/splash_progress_tracker.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SplashProgressTracker Widget Tests', () {
    testWidgets(
        'renders progress bar, status text, and CircularProgressIndicator correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: const Scaffold(
            body: SplashProgressTracker(
              progress: 0.75,
              statusText: 'Initializing Serverpod RPC gateway...',
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      // Verify CircularProgressIndicator is present in SplashProgressTracker
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Verify status text is rendered correctly
      expect(
          find.text('Initializing Serverpod RPC gateway...'), findsOneWidget);

      // Verify percentage counter is rendered correctly
      expect(find.text('75%'), findsOneWidget);
    });
  });
}
