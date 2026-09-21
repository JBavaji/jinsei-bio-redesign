import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/theme/theme_bloc.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_shell.dart';

void main() {
  Widget buildTestWidget({
    required Widget child,
  }) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => AppShell(child: child),
        ),
      ],
    );

    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: MaterialApp.router(
        theme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }

  testWidgets(
      'AppShell renders top AppHeaderBar and DisclaimerBanner on Desktop',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildTestWidget(
      child: const Text('Body Content'),
    ));

    await tester.pumpAndSettle();

    expect(find.text('JINSEI'), findsOneWidget);
    expect(find.text('BIOSCIENCE'), findsOneWidget);
    expect(find.text('SCIENCE & TECH'), findsOneWidget);
    expect(find.text('SOLUTIONS'), findsOneWidget);
    expect(find.text('LEADERSHIP'), findsOneWidget);
    expect(find.text('Body Content'), findsOneWidget);
    expect(find.textContaining('Disclaimer'), findsOneWidget);
  });

  testWidgets(
      'AppShell mobile viewport displays compact header and drawer icon',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildTestWidget(
      child: const Text('Mobile Content'),
    ));

    await tester.pumpAndSettle();

    expect(find.text('Request B2B Sample'), findsOneWidget);
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
  });
}
