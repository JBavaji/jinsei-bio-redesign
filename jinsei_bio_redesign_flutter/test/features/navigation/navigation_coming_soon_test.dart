import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/router/app_router.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/theme/theme_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/data/repositories/navigation_repository.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_event.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget buildTestApp({String initialLocation = '/'}) {
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
        routerConfig: appRouter,
      ),
    );
  }

  testWidgets('Navigating to /science displays Science & Technology Coming Soon page',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildTestApp(initialLocation: '/science'));
    appRouter.go('/science');
    await tester.pumpAndSettle();

    expect(find.text('Science & Technology'), findsOneWidget);
    expect(find.textContaining('COMING SOON'), findsOneWidget);
    expect(find.byIcon(Icons.biotech_rounded), findsWidgets);
  });

  testWidgets('Navigating to /solutions displays Commercial Solutions Coming Soon page',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildTestApp());
    appRouter.go('/solutions');
    await tester.pumpAndSettle();

    expect(find.text('Commercial Solutions'), findsOneWidget);
    expect(find.textContaining('COMING SOON'), findsOneWidget);
    expect(find.byIcon(Icons.hub_rounded), findsWidgets);
  });

  testWidgets('Navigating to /leadership displays Leadership & Advisory Coming Soon page',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildTestApp());
    appRouter.go('/leadership');
    await tester.pumpAndSettle();

    expect(find.text('Leadership & Advisory'), findsOneWidget);
    expect(find.textContaining('COMING SOON'), findsOneWidget);
    expect(find.byIcon(Icons.people_rounded), findsWidgets);
  });

  testWidgets('Navigating to /collaborations displays Global Collaborations Coming Soon page',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildTestApp());
    appRouter.go('/collaborations');
    await tester.pumpAndSettle();

    expect(find.text('Global Collaborations'), findsOneWidget);
    expect(find.textContaining('COMING SOON'), findsOneWidget);
    expect(find.byIcon(Icons.handshake_rounded), findsWidgets);
  });
}
