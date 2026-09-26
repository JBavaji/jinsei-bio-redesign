import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/theme/theme_bloc.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_shell.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders all Executive Showcase sections cleanly',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AppShell(child: HomeScreen()),
        ),
      ],
    );

    await tester.pumpWidget(
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: MaterialApp.router(
          theme: AppTheme.darkTheme,
          routerConfig: router,
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 500));

    // Verify Brand Logo & Navbar Text
    expect(find.text('JINSEI'), findsWidgets);
    expect(find.text('BIOSCIENCE'), findsWidgets);

    // Verify Main Hero Headline
    expect(
      find.byWidgetPredicate((widget) =>
          widget is RichText &&
          widget.text.toPlainText().contains('Microbe Revolution')),
      findsOneWidget,
    );

    // Verify Executive Stats Bar Cards
    expect(find.text('3+ Global Patents Filed'), findsOneWidget);
    expect(find.text('10-Step Proprietary Platform'), findsOneWidget);
    expect(find.text('8+ PhD Academic Advisors'), findsOneWidget);

    // Verify Pillar Section
    expect(find.textContaining('Pillar Approach'), findsOneWidget);
    expect(find.text('Indigenous Focus'), findsOneWidget);

    // Verify Commercial Verticals Section
    expect(find.text('Commercial Product Verticals'), findsOneWidget);
    expect(find.text('Jinsei-Gut Pro'), findsOneWidget);

    // Verify Headquarters / Form Section
    expect(find.text('Headquarters'), findsOneWidget);
    expect(find.text('Diagnostic Inquiry'), findsOneWidget);
  });
}
