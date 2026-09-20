import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

class SplashProtocolChips extends StatelessWidget {
  const SplashProtocolChips({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final chips = [
      _ChipData(
          dotColor: AppColors.bioluminescentGreen, label: 'WGS Metagenomics'),
      _ChipData(
          dotColor: AppColors.primaryContainerTeal,
          label: 'GMP Anaerobic Labs'),
      _ChipData(
          dotColor: AppColors.bioluminescentGreen, label: '3+ Global Patents'),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: chips.map((c) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkObsidianBg.withValues(alpha: 0.8)
                : Colors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : AppColors.lightBorder,
            ),
            boxShadow: isDark
                ? null
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '•',
                style: TextStyle(
                  color: c.dotColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                c.label,
                style: AppTypography.bodySmall(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextPrimary,
                  fontSize: 11,
                ).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _ChipData {
  final Color dotColor;
  final String label;

  _ChipData({required this.dotColor, required this.label});
}

