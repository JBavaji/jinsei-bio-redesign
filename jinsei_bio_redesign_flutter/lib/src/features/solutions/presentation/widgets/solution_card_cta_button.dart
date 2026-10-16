import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/solution_card_model.dart';

class SolutionCardCtaButton extends StatelessWidget {
  final SolutionCardModel solution;
  final bool isDark;
  final bool isHovered;
  final bool isSelected;
  final VoidCallback onExplore;

  const SolutionCardCtaButton({
    super.key,
    required this.solution,
    required this.isDark,
    required this.isHovered,
    required this.isSelected,
    required this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Semantics(
        button: true,
        label: '${solution.actionCtaText} for ${solution.title}',
        child: OutlinedButton(
          onPressed: onExplore,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: isDark ? AppColors.cyanInteractive : AppColors.primaryTeal,
              width: 1.5,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
            backgroundColor: isHovered || isSelected
                ? (isDark
                    ? AppColors.cyanInteractive.withValues(alpha: 0.15)
                    : AppColors.primaryTeal.withValues(alpha: 0.1))
                : Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                solution.actionCtaText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryTeal,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_rounded,
                  size: 16,
                  color: isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryTeal),
            ],
          ),
        ),
      ),
    );
  }
}
