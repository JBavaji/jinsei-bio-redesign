import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/solutions_quality_assurance_model.dart';

class SolutionsQaBanner extends StatelessWidget {
  final SolutionsQualityAssuranceModel? qa;

  const SolutionsQaBanner({super.key, this.qa});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final title = qa?.title ?? 'Clinical & Commercial Quality Assurance';
    final desc = qa?.description ??
        'ISO 9001:2015 & GMP Certified Production Standards • Custom Strains & Blends';
    final badge = qa?.badgeText ?? 'Pune NCL Innovation Park';
    final compliance =
        qa?.complianceStandard ?? 'Bio-Prospecting Ethics Compliant';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF101A24).withValues(alpha: 0.85)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? AppColors.emeraldAccent.withValues(alpha: 0.45)
              : AppColors.primaryTeal.withValues(alpha: 0.60),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 650;

          final content = Row(
            children: [
              Icon(
                Icons.verified_rounded,
                size: 32,
                color: isDark ? AppColors.emeraldAccent : AppColors.primaryTeal,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppColors.labCharcoal,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );

          final badgeBlock = Column(
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                badge,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryTeal,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                compliance,
                style: TextStyle(
                  fontSize: 10,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
            ],
          );

          if (isWide) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: content),
                const SizedBox(width: 20),
                badgeBlock,
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              content,
              const SizedBox(height: 12),
              badgeBlock,
            ],
          );
        },
      ),
    );
  }
}
