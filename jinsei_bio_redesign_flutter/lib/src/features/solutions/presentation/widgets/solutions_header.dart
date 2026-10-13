import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SolutionsHeader extends StatelessWidget {
  const SolutionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          'A WIDE SPECTRUM OF APPLICATIONS FOR LACTOBACILLUS BACTERIA',
          textAlign: TextAlign.center,
          style: theme.textTheme.labelMedium?.copyWith(
            color: isDark ? AppColors.cyanInteractive : AppColors.primaryTeal,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.2,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Commercial Solutions & Formulation Matrix',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : AppColors.labCharcoal,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            'Targeted probiotic bio-formulations engineered from indigenous human micro-flora strains for global pharmaceutical and FMCG leaders.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              height: 1.6,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}
