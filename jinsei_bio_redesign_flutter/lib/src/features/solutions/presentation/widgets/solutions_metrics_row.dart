import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/hoverable_metric_card.dart';
import '../../domain/models/solution_metric_model.dart';

class SolutionsMetricsRow extends StatelessWidget {
  final List<SolutionMetricModel> metrics;

  const SolutionsMetricsRow({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    if (metrics.isEmpty) return const SizedBox.shrink();

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLarge = constraints.maxWidth > 750;

            if (isLarge) {
              return Row(
                children: metrics.map((m) {
                  final accentColor = _parseAccentColor(m.accentColorHex);
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: HoverableMetricCard(
                        label: m.label,
                        value: m.value,
                        icon: m.icon,
                        accentColor: accentColor,
                      ),
                    ),
                  );
                }).toList(),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: metrics.map((m) {
                final accentColor = _parseAccentColor(m.accentColorHex);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: HoverableMetricCard(
                    label: m.label,
                    value: m.value,
                    icon: m.icon,
                    accentColor: accentColor,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  Color _parseAccentColor(String hex) {
    if (hex == '#66DD8B') {
      return AppColors.emeraldAccent;
    } else if (hex == '#7BD4E2') {
      return AppColors.cyanInteractive;
    }
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return AppColors.cyanInteractive;
    }
  }
}
