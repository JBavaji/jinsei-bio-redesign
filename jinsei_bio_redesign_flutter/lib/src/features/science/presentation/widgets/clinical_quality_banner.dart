import 'package:flutter/material.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import '../../../navigation/presentation/widgets/sample_button.dart';

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
            ? AppColors.darkSurface.withValues(alpha: 0.90)
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.emeraldAccent.withValues(alpha: 0.50),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.emeraldAccent.withValues(alpha: 0.15),
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

          final ctaButton = SampleButton(
            onPressed: () {},
            label: 'Request B2B Sample',
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            fontSize: 13,
            borderRadius: 8,
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
