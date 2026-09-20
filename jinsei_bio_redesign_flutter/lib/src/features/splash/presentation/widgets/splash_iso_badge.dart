import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// Responsive ISO Certification & Facility Badge for the header.
class SplashIsoBadge extends StatelessWidget {
  final bool isCompact;

  const SplashIsoBadge({
    super.key,
    required this.isCompact,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkObsidianBg
              : AppColors.primaryContainerTeal.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark
                ? AppColors.primaryContainerTeal.withValues(alpha: 0.3)
                : AppColors.primaryContainerTeal.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock_outline_rounded,
              size: 12,
              color: isDark
                  ? AppColors.bioluminescentGreen
                  : AppColors.primaryContainerTeal,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                isCompact
                    ? 'ISO 9001:2015'
                    : 'ISO 9001:2015 • NCL Innovation Park',
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodySmall(
                  color: AppColors.primaryContainerTeal,
                  fontSize: 10,
                ).copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

