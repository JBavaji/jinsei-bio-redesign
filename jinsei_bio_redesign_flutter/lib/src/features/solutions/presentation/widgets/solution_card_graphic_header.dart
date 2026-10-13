import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/solution_card_model.dart';

class SolutionCardGraphicHeader extends StatelessWidget {
  final SolutionCardModel solution;
  final bool isDark;

  const SolutionCardGraphicHeader({
    super.key,
    required this.solution,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: isDark
              ? [
                  const Color(0xFF0C242E),
                  const Color(0xFF091B24),
                  const Color(0xFF051117)
                ]
              : [const Color(0xFFD6EFF2), const Color(0xFFC3E7EB)],
        ),
        border: Border.all(
          color: (isDark ? AppColors.cyanInteractive : AppColors.primaryTeal)
              .withValues(alpha: 0.3),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 8,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.cyanInteractive.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: AppColors.cyanInteractive.withValues(alpha: 0.4)),
              ),
              child: Text(
                'VERTICAL 0${solution.displayOrder}',
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cyanInteractive),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(solution.icon,
                  size: 36,
                  color: isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryTeal),
              const SizedBox(height: 4),
              Text(
                solution.subtitle,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                  color: (isDark
                          ? AppColors.cyanInteractive
                          : AppColors.primaryTeal)
                      .withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
