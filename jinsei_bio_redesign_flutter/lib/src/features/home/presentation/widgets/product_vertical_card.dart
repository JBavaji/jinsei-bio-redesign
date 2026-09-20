import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/models/product_vertical_model.dart';

/// Modular Product Vertical Card Component
class ProductVerticalCard extends StatelessWidget {
  final ProductVerticalModel vertical;
  final bool isDark;
  final bool isMobile;
  final VoidCallback onRequestDossier;

  const ProductVerticalCard({
    super.key,
    required this.vertical,
    required this.isDark,
    required this.isMobile,
    required this.onRequestDossier,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurfaceCard.withValues(alpha: 0.8)
              : AppColors.lightSurfaceCard,
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cyan Accent Strip on Left
              Container(
                width: 4,
                color: AppColors.cyanInteractive,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 16 : 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vertical.title,
                        style: AppTypography.headlineSmall(
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                          fontSize: isMobile ? 16 : 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              AppColors.cyanInteractive.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.cyanInteractive
                                .withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          vertical.strainId,
                          style: AppTypography.bodySmall(
                            color: AppColors.cyanInteractive,
                            fontSize: 11,
                          ).copyWith(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        vertical.description,
                        style: AppTypography.bodySmall(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: onRequestDossier,
                        borderRadius: BorderRadius.circular(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                'REQUEST FORMULATION DOSSIER',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.labelCaps(
                                  color: AppColors.cyanInteractive,
                                  fontSize: 11,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 14,
                              color: AppColors.cyanInteractive,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
