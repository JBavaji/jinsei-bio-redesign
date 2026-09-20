import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/models/pillar_item_model.dart';

/// Modular Pillar Card Component with Mobile-Optimized Row Layout
/// Matches 01_executive_showcase_dark_mobile.html flex items-start design.
class PillarCard extends StatelessWidget {
  final PillarItemModel pillar;
  final bool isDark;
  final bool isMobile;

  const PillarCard({
    super.key,
    required this.pillar,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 14 : 16),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceCard.withValues(alpha: 0.8)
            : AppColors.lightSurfaceCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: isMobile
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _IconBadge(pillar: pillar),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        pillar.title,
                        style: AppTypography.headlineSmall(
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pillar.description,
                        style: AppTypography.bodySmall(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _IconBadge(pillar: pillar),
                const SizedBox(height: 12),
                Text(
                  pillar.title,
                  style: AppTypography.headlineSmall(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    pillar.description,
                    style: AppTypography.bodySmall(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                      fontSize: 12,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final PillarItemModel pillar;

  const _IconBadge({required this.pillar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.cyanInteractive.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.cyanInteractive.withValues(alpha: 0.3),
        ),
      ),
      child: Icon(
        pillar.icon,
        color: AppColors.cyanInteractive,
        size: 20,
      ),
    );
  }
}
