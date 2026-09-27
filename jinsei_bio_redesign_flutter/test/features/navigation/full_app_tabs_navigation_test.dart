import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/theme/theme_bloc.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_shell.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/collaborations_screen.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/leadership_screen.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/data/repositories/navigation_repository.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_event.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/science_screen.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/presentation/solutions_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget buildTestApp(GoRouter router) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(
            repository: const NavigationRepository(),
          )..add(const LoadNavigationItemsEvent()),
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }

  group('Automated Full-App Tabs Navigation & Route Integration Tests', () {
    testWidgets('Renders ScienceScreen route cleanly', (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final router = GoRouter(
        initialLocation: '/science',
        routes: [
          ShellRoute(
            builder: (context, state, child) => AppShell(child: child),
            routes: [
              GoRoute(
                  path: '/science',
                  builder: (context, state) => const ScienceScreen()),
            ],
          ),
        ],
      );

      await tester.pumpWidget(buildTestApp(router));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Pipeline Milestones'), findsOneWidget);
    });

    testWidgets('Renders SolutionsScreen coming soon route cleanly',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final router = GoRouter(
        initialLocation: '/solutions',
        routes: [
          ShellRoute(
            builder: (context, state, child) => AppShell(child: child),
            routes: [
              GoRoute(
                  path: '/solutions',
                  builder: (context, state) => const SolutionsScreen()),
            ],
          ),
        ],
      );

      await tester.pumpWidget(buildTestApp(router));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Commercial Solutions'), findsOneWidget);
    });

    testWidgets('Renders LeadershipScreen coming soon route cleanly',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final router = GoRouter(
        initialLocation: '/leadership',
        routes: [
          ShellRoute(
            builder: (context, state, child) => AppShell(child: child),
            routes: [
              GoRoute(
                  path: '/leadership',
                  builder: (context, state) => const LeadershipScreen()),
            ],
          ),
        ],
      );

      await tester.pumpWidget(buildTestApp(router));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Leadership & Advisory'), findsOneWidget);
    });

    testWidgets('Renders CollaborationsScreen coming soon route cleanly',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final router = GoRouter(
        initialLocation: '/collaborations',
        routes: [
          ShellRoute(
            builder: (context, state, child) => AppShell(child: child),
            routes: [
              GoRoute(
                  path: '/collaborations',
                  builder: (context, state) => const CollaborationsScreen()),
            ],
          ),
        ],
      );

      await tester.pumpWidget(buildTestApp(router));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Global Collaborations'), findsOneWidget);
    });
  });
}
