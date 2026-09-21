import 'package:flutter/material.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';

class ClinicalQualityBanner extends StatelessWidget {
  const ClinicalQualityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurface.withOpacity(0.90)
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.emeraldAccent.withOpacity(0.50),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.emeraldAccent.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 650;

          final textContent = Column(
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.verified_user_rounded,
                    color: AppColors.emeraldAccent,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Clinical Quality Assurance',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            isDark ? Colors.white : AppColors.lightTextPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Full genome tracking, axenic culture guarantee, and comprehensive assay reporting across all batch runs.',
                textAlign: isWide ? TextAlign.left : TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
            ],
          );

          final ctaButton = ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.emeraldAccent,
              foregroundColor: AppColors.darkObsidianBg,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
            ),
            icon: const Icon(Icons.send_rounded, size: 18),
            label: const Text(
              'Request B2B Sample',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          );

          if (isWide) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: textContent),
                const SizedBox(width: 24),
                ctaButton,
              ],
            );
          }

          return Column(
            children: [
              textContent,
              const SizedBox(height: 16),
              ctaButton,
            ],
          );
        },
      ),
    );
  }
}
