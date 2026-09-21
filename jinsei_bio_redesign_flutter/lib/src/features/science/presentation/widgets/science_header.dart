import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/hoverable_metric_card.dart';

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
                    children: _buildMetricCards(),
                  )
                : Column(
                    children: _buildMetricCards(),
                  );
          },
        ),
      ],
    );
  }

  List<Widget> _buildMetricCards() {
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
      return HoverableMetricCard(
        width: 220,
        icon: m.$1,
        value: m.$2,
        label: m.$3,
        accentColor: m.$4,
      );
    }).toList();
  }
}
