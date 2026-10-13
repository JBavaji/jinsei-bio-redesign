import 'package:flutter/material.dart';
import '../../../../core/widgets/hoverable_metric_card.dart';
import '../../domain/models/solution_metric_model.dart';

class SolutionsMetricsRow extends StatelessWidget {
  final List<SolutionMetricModel> metrics;

  const SolutionsMetricsRow({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    if (metrics.isEmpty) return const SizedBox.shrink();

    return Center(
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: metrics.map((m) {
          final accentColor = Color(
            int.parse(m.accentColorHex.replaceFirst('#', '0xFF')),
          );
          return HoverableMetricCard(
            label: m.label,
            value: m.value,
            icon: m.icon,
            accentColor: accentColor,
          );
        }).toList(),
      ),
    );
  }
}
