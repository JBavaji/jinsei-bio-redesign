import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/theme/theme_bloc.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_shell.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/data/repositories/navigation_repository.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_event.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget buildMobileApp(GoRouter router) {
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

  group('Mobile Navigation Drawer UI/UX Responsiveness QA Tests', () {
    testWidgets('renders mobile hamburger icon and opens NavDrawer on tap',
        (WidgetTester tester) async {
      // Set mobile viewport (iPhone 14 / Android: 390 x 844)
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final router = GoRouter(
        initialLocation: '/',
        routes: [
          ShellRoute(
            builder: (context, state, child) => AppShell(child: child),
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const Scaffold(
                  body: Text('Mobile Test Screen'),
                ),
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(buildMobileApp(router));
      await tester.pump(const Duration(milliseconds: 300));

      // Verify hamburger icon is present on mobile viewport
      final menuButtonFinder = find.byIcon(Icons.menu_rounded);
      expect(menuButtonFinder, findsOneWidget);

      // Tap hamburger menu icon to open NavDrawer
      await tester.tap(menuButtonFinder);
      await tester.pump(const Duration(milliseconds: 500));

      // Verify drawer opened with brand emblem and navigation items
      expect(find.byType(Drawer), findsOneWidget);
    });
  });
}
