import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Modular Step Number Circular Badge Component for Science Stepper Timeline.
/// Displays 2-digit step number with selection glow and active theme colors.
class StepNumberBadge extends StatelessWidget {
  final int stepNumber;
  final bool isSelected;

  const StepNumberBadge({
    super.key,
    required this.stepNumber,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.emeraldAccent : AppColors.darkObsidianBg,
        border: Border.all(
          color:
              isSelected ? AppColors.emeraldAccent : AppColors.cyanInteractive,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: (isSelected
                    ? AppColors.emeraldAccent
                    : AppColors.cyanInteractive)
                .withValues(alpha: 0.4),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          stepNumber.toString().padLeft(2, '0'),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
