import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/solution_card_model.dart';

class SolutionCardMetadataRow extends StatelessWidget {
  final SolutionCardModel solution;
  final bool isDark;

  const SolutionCardMetadataRow({
    super.key,
    required this.solution,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.emeraldAccent.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: AppColors.emeraldAccent.withValues(alpha: 0.4)),
          ),
          child: Text(
            solution.categoryTag,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.emeraldAccent),
          ),
        ),
        Row(
          children: [
            const Icon(Icons.verified_rounded,
                size: 14, color: AppColors.emeraldAccent),
            const SizedBox(width: 4),
            Text(
              solution.formulationCount,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.emeraldAccent : AppColors.primaryTeal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
