import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_footer_bar.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/link_button.dart';

void main() {
  Widget buildTestWidget({
    required Widget child,
    ThemeData? theme,
  }) {
    return MaterialApp(
      theme: theme ?? AppTheme.darkTheme,
      home: Scaffold(
        body: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }

  group('AppFooterBar Public Component & Encapsulation Tests', () {
    testWidgets(
        'AppFooterBar renders brand text, policy links, and dynamic copyright year',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBar(copyrightYear: 2026),
      ));

      expect(find.byType(AppFooterBar), findsOneWidget);

      // Verify Brand Block Content & Injected Year
      expect(find.text('JINSEI'), findsOneWidget);
      expect(find.text('BIOSCIENCE'), findsOneWidget);
      expect(find.textContaining('© 2026 All Rights Reserved'), findsOneWidget);

      // Verify Policy Link Buttons
      expect(find.byType(LinkButton), findsNWidgets(3));
      expect(find.text('Privacy Policy'), findsOneWidget);
      expect(find.text('Terms of Service'), findsOneWidget);
      expect(find.text('Scientific Disclosure'), findsOneWidget);
    });

    testWidgets(
        'AppFooterBar arranges content in a Row on Desktop viewport (>900px)',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBar(),
      ));

      expect(find.byType(Row), findsWidgets);
      expect(find.text('JINSEI'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
    });

    testWidgets(
        'AppFooterBar arranges content in a Column on Mobile viewport (<=900px)',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBar(),
      ));

      expect(find.byType(Column), findsWidgets);
      expect(find.text('JINSEI'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
    });

    testWidgets('AppFooterBar renders cleanly in Light Theme mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        theme: AppTheme.lightTheme,
        child: const AppFooterBar(copyrightYear: 2026),
      ));

      expect(find.byType(AppFooterBar), findsOneWidget);
      expect(find.text('JINSEI'), findsOneWidget);
      expect(find.text('BIOSCIENCE'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
    });

    testWidgets('AppFooterBar accepts custom padding overrides',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBar(
          padding: EdgeInsets.all(32),
          copyrightYear: 2026,
        ),
      ));

      expect(find.byType(AppFooterBar), findsOneWidget);
      expect(find.text('JINSEI'), findsOneWidget);
    });
  });
}
