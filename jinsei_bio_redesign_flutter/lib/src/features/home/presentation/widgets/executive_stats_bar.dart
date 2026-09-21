import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/executive_stat_model.dart';

class ExecutiveStatsBar extends StatelessWidget {
  final List<ExecutiveStatModel> stats;

  const ExecutiveStatsBar({
    super.key,
    this.stats = ExecutiveStatModel.defaultStats,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isLarge = constraints.maxWidth > 750;

        if (isLarge) {
          return Row(
            children: stats
                .map(
                  (stat) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _StatCard(stat: stat, isDark: isDark),
                    ),
                  ),
                )
                .toList(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: stats
              .map(
                (stat) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _StatCard(stat: stat, isDark: isDark),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final ExecutiveStatModel stat;
  final bool isDark;

  const _StatCard({
    required this.stat,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceCard.withValues(alpha: 0.8)
            : AppColors.lightSurfaceCard.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            stat.icon,
            size: 36,
            color: AppColors.emeraldGreen,
          ),
          const SizedBox(height: 12),
          Text(
            stat.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            stat.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
