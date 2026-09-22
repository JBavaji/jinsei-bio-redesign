import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/hoverable_metric_card.dart';
import '../../data/models/executive_stat_model.dart';

class ExecutiveStatsBar extends StatelessWidget {
  final List<ExecutiveStatModel> stats;

  const ExecutiveStatsBar({
    super.key,
    this.stats = ExecutiveStatModel.defaultStats,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLarge = constraints.maxWidth > 750;

        if (isLarge) {
          return Row(
            children: stats
                .map(
                  (stat) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: HoverableMetricCard(
                        icon: stat.icon,
                        value: stat.title,
                        label: stat.subtitle,
                        accentColor: AppColors.emeraldGreen,
                      ),
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
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: HoverableMetricCard(
                    icon: stat.icon,
                    value: stat.title,
                    label: stat.subtitle,
                    accentColor: AppColors.emeraldGreen,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
