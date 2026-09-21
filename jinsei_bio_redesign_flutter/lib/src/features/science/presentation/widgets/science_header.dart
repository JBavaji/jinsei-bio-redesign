import 'package:flutter/material.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';

class ScienceHeader extends StatelessWidget {
  const ScienceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: theme.textTheme.labelLarge?.copyWith(
              color: AppColors.cyanInteractive,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
              fontSize: 13,
            ),
            children: const [
              TextSpan(text: 'PROPRIETARY '),
              TextSpan(
                text: '10-STEP ',
                style: TextStyle(color: AppColors.emeraldAccent),
              ),
              TextSpan(text: 'R&D PIPELINE'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            'A clinical biological discovery engine transforming indigenous microbial isolates into validated therapeutic consortia.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              height: 1.6,
              letterSpacing: 0.3,
            ),
          ),
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            return isWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildMetricCards(theme, isDark),
                  )
                : Column(
                    children: _buildMetricCards(theme, isDark),
                  );
          },
        ),
      ],
    );
  }

  List<Widget> _buildMetricCards(ThemeData theme, bool isDark) {
    final metrics = [
      (
        Icons.science_rounded,
        '10',
        'Pipeline Milestones',
        AppColors.cyanInteractive
      ),
      (
        Icons.biotech_rounded,
        '100%',
        'Sequence Coverage',
        AppColors.emeraldAccent
      ),
      (
        Icons.verified_rounded,
        '3',
        'Global Patents Filed',
        AppColors.cyanInteractive
      ),
    ];

    return metrics.map((m) {
      return Container(
        width: 220,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurface.withOpacity(0.85)
              : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: m.$4.withOpacity(0.12),
              blurRadius: 16,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(m.$1, color: m.$4, size: 28),
            const SizedBox(height: 8),
            Text(
              m.$2,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.lightTextPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              m.$3,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
