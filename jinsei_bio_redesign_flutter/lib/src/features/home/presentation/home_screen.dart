import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/theme_cubit.dart';
import '../../../core/widgets/disclaimer_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.biotech_rounded,
              color: AppColors.bioluminescentGreen,
            ),
            const SizedBox(width: 8),
            Text(
              'Jinsei Bio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: isDark ? AppColors.bioluminescentGreen : AppColors.emeraldGreen,
            ),
            tooltip: 'Toggle Dark / Light Theme',
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Initial Welcome Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.bioluminescentGreen.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.bioluminescentGreen,
                                  ),
                                ),
                                child: const Text(
                                  'Initial App Setup',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.bioluminescentGreen,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Welcome to Jinsei Bio Redesign use-case',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 32,
                                  height: 1.2,
                                  color: isDark
                                      ? AppColors.darkTextPrimary
                                      : AppColors.lightTextPrimary,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Multi-platform Flutter & Serverpod monorepo architecture targeting Web, Android, and iOS.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Architectural Highlights Grid
                  Text(
                    'Architecture & Tech Stack',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: const [
                      _TechBadge(
                        title: 'Flutter Bloc',
                        subtitle: 'Reactive State Management (ADR-005)',
                        icon: Icons.account_tree_rounded,
                      ),
                      _TechBadge(
                        title: 'Serverpod Backend',
                        subtitle: 'Dart & PostgreSQL ORM (ADR-011)',
                        icon: Icons.dns_rounded,
                      ),
                      _TechBadge(
                        title: 'Firebase Hosting',
                        subtitle: 'Web Staging & Delivery (ADR-008)',
                        icon: Icons.cloud_done_rounded,
                      ),
                      _TechBadge(
                        title: 'Multi-Platform',
                        subtitle: 'Web + Android + iOS simultaneous (ADR-010)',
                        icon: Icons.devices_rounded,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const DisclaimerBanner(),
        ],
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _TechBadge({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceCard : AppColors.lightSurfaceCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: AppColors.bioluminescentGreen,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
