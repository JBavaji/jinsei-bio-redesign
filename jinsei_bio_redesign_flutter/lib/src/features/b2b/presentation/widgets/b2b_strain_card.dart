import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/strain_vertical_option_model.dart';

class B2bStrainCard extends StatelessWidget {
  final StrainVerticalOptionModel strain;
  final bool isSelected;
  final VoidCallback onTap;

  const B2bStrainCard({
    super.key,
    required this.strain,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF0F7D8A).withValues(alpha: 0.20)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.04)
                  : Colors.black.withValues(alpha: 0.03)),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.emeraldGreen
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
            width: isSelected ? 1.5 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.emeraldGreen.withValues(alpha: 0.20),
                    blurRadius: 16,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    strain.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.emeraldGreen
                          : AppColors.cyanInteractive,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Icon(
                  isSelected
                      ? Icons.check_circle_rounded
                      : Icons.radio_button_unchecked_rounded,
                  size: 16,
                  color: isSelected
                      ? AppColors.emeraldGreen
                      : const Color(0xFF64748B),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              strain.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              strain.strainCode,
              style: const TextStyle(
                color: AppColors.cyanInteractive,
                fontFamily: 'monospace',
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              strain.highlight,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
