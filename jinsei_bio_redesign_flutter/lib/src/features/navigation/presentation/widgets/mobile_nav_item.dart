import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

import '../../../../core/theme/app_typography.dart';

class MobileNavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  final bool isDark;

  const MobileNavItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isActive
        ? AppColors.cyanInteractive
        : (isDark
            ? AppColors.darkTextPrimary
            : AppColors.lightTextPrimary);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primaryContainerTeal.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isActive
              ? Border.all(
                  color: AppColors.cyanInteractive.withValues(alpha: 0.3))
              : null,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppTypography.navItemMobile(
                color: textColor,
                isActive: isActive,
              ),
            ),
            const Spacer(),
            if (isActive)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.cyanInteractive,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyanInteractive,
                      blurRadius: 6,
                    ),
                  ],
                ),
              )
            else
              Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
          ],
        ),
      ),
    );
  }
}

