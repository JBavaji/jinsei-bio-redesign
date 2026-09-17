import 'package:go_router/go_router.dart';
import '../widgets/app_shell.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';

bool hasInitialSplashCompleted = false;

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  redirect: (context, state) {
    if (!hasInitialSplashCompleted && state.matchedLocation != '/splash') {
      return '/splash';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    ),
  ],
);
