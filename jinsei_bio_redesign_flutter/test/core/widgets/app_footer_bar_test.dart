import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_footer_bar.dart';

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

  group('AppFooterBar SRP & Widget Tests', () {
    testWidgets(
        'AppFooterBar renders AppFooterBrandBlock and AppFooterLinksBlock modularly',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBar(),
      ));

      expect(find.byType(AppFooterBar), findsOneWidget);
      expect(find.byType(AppFooterBrandBlock), findsOneWidget);
      expect(find.byType(AppFooterLinksBlock), findsOneWidget);

      // Verify Brand Block Content
      expect(find.text('JINSEI'), findsOneWidget);
      expect(find.text('BIOSCIENCE'), findsOneWidget);
      expect(find.textContaining('All Rights Reserved'), findsOneWidget);

      // Verify Links Block Content
      expect(find.text('Privacy Policy'), findsOneWidget);
      expect(find.text('Terms of Service'), findsOneWidget);
      expect(find.text('Scientific Disclosure'), findsOneWidget);
    });

    testWidgets(
        'AppFooterBar arranges sub-blocks in a Row on Desktop viewport',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBar(),
      ));

      expect(find.byType(Row), findsWidgets);
      expect(find.byType(AppFooterBrandBlock), findsOneWidget);
      expect(find.byType(AppFooterLinksBlock), findsOneWidget);
    });

    testWidgets(
        'AppFooterBar arranges sub-blocks in a Column on Mobile viewport',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBar(),
      ));

      expect(find.byType(Column), findsWidgets);
      expect(find.byType(AppFooterBrandBlock), findsOneWidget);
      expect(find.byType(AppFooterLinksBlock), findsOneWidget);
    });

    testWidgets('AppFooterBar renders cleanly in Light Theme mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        theme: AppTheme.lightTheme,
        child: const AppFooterBar(),
      ));

      expect(find.byType(AppFooterBar), findsOneWidget);
      expect(find.text('JINSEI'), findsOneWidget);
      expect(find.text('BIOSCIENCE'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
    });

    testWidgets('AppFooterBrandBlock can be tested as an isolated component',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterBrandBlock(isDark: true),
      ));

      expect(find.byType(AppFooterBrandBlock), findsOneWidget);
      expect(find.text('JINSEI'), findsOneWidget);
      expect(find.text('BIOSCIENCE'), findsOneWidget);
      expect(find.textContaining('©'), findsOneWidget);
    });

    testWidgets('AppFooterLinksBlock can be tested as an isolated component',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestWidget(
        child: const AppFooterLinksBlock(isDark: true),
      ));

      expect(find.byType(AppFooterLinksBlock), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
      expect(find.text('Terms of Service'), findsOneWidget);
      expect(find.text('Scientific Disclosure'), findsOneWidget);
    });
  });
}
