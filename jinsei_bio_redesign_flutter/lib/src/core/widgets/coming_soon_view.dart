import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';
import '../../features/navigation/presentation/bloc/navigation_bloc.dart';
import '../../features/navigation/presentation/bloc/navigation_event.dart';

/// Reusable Glassmorphic "Coming Soon" Page Component
/// Used across future module routes (Science, Solutions, Leadership, Collaborations).
class ComingSoonView extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String categoryTag;

  const ComingSoonView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.categoryTag,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkSurfaceCard.withValues(alpha: 0.85)
                    : Colors.white.withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isDark
                      ? AppColors.primaryContainerTeal.withValues(alpha: 0.3)
                      : AppColors.lightBorder,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryContainerTeal.withValues(
                      alpha: isDark ? 0.15 : 0.08,
                    ),
                    blurRadius: 32,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon Avatar Halo
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primaryContainerTeal.withValues(alpha: 0.25),
                          AppColors.bioluminescentGreen.withValues(alpha: 0.05),
                        ],
                      ),
                      border: Border.all(
                        color: AppColors.cyanInteractive.withValues(alpha: 0.5),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: 36,
                      color: AppColors.cyanInteractive,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Category Chip Tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkObsidianBg
                          : AppColors.primaryContainerTeal.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.primaryContainerTeal.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    child: Text(
                      categoryTag.toUpperCase(),
                      style: AppTypography.labelCaps(
                        color: AppColors.primaryContainerTeal,
                        fontSize: 10,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Main Module Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTypography.displayMedium(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Subtitle & Module Context
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMedium(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Pulsing Status Dot & Release Tag
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.bioluminescentGreen,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.bioluminescentGreen,
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'MODULE CALIBRATION IN PROGRESS • COMING SOON',
                        style: AppTypography.labelCaps(
                          color: isDark
                              ? AppColors.bioluminescentGreen
                              : AppColors.primaryContainerTeal,
                          fontSize: 11,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Navigation Actions
                  ElevatedButton.icon(
                    onPressed: () {
                      context
                          .read<NavigationBloc>()
                          .add(const SelectNavItemEvent('/'));
                      context.go('/');
                    },
                    icon: const Icon(Icons.arrow_back_rounded, size: 18),
                    label: const Text('Back to Executive Overview'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryContainerTeal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: AppTypography.labelCaps(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
