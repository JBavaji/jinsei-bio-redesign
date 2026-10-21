import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

class CollaborationHeaderSection extends StatelessWidget {
  final String badge;
  final String title;
  final String subtitle;

  const CollaborationHeaderSection({
    super.key,
    required this.badge,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 820),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.cyanInteractive.withValues(alpha: 0.12)
                    : AppColors.primaryContainerTeal.withValues(alpha: 0.08),
                border: Border.all(
                  color: isDark
                      ? AppColors.cyanInteractive.withValues(alpha: 0.35)
                      : AppColors.primaryContainerTeal.withValues(alpha: 0.25),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badge,
                style: AppTypography.labelCaps(
                  color: isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryContainerTeal,
                ).copyWith(
                  fontSize: 12,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTypography.displayMedium(
                color: isDark ? Colors.white : AppColors.lightTextPrimary,
              ).copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style: AppTypography.bodyMedium(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ).copyWith(
                fontSize: 15,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
