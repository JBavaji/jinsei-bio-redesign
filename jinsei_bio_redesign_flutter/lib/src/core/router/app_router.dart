import 'package:go_router/go_router.dart';
import '../widgets/app_shell.dart';
import '../../features/collaborations/presentation/collaborations_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/leadership/presentation/leadership_screen.dart';
import '../../features/science/presentation/science_screen.dart';
import '../../features/solutions/presentation/solutions_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
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
        GoRoute(
          path: '/science',
          builder: (context, state) => const ScienceScreen(),
        ),
        GoRoute(
          path: '/solutions',
          builder: (context, state) => const SolutionsScreen(),
        ),
        GoRoute(
          path: '/leadership',
          builder: (context, state) => const LeadershipScreen(),
        ),
        GoRoute(
          path: '/collaborations',
          builder: (context, state) => const CollaborationsScreen(),
        ),
      ],
    ),
  ],
);
