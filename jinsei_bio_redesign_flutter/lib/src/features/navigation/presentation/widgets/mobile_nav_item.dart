import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class MobileNavItem extends StatelessWidget {
  final String title;
  final String iconKey;
  final bool isActive;
  final VoidCallback onTap;
  final bool isDark;

  const MobileNavItem({
    super.key,
    required this.title,
    required this.iconKey,
    required this.isActive,
    required this.onTap,
    required this.isDark,
  });

  IconData _getIconData(String key) {
    switch (key) {
      case 'grid_view_rounded':
        return Icons.grid_view_rounded;
      case 'biotech_rounded':
        return Icons.biotech_rounded;
      case 'hub_rounded':
        return Icons.hub_rounded;
      case 'people_rounded':
        return Icons.people_rounded;
      case 'handshake_rounded':
        return Icons.handshake_rounded;
      default:
        return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconData = _getIconData(iconKey);

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
            Icon(
              iconData,
              size: 20,
              color: isActive
                  ? AppColors.cyanInteractive
                  : (isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                color: isActive
                    ? AppColors.cyanInteractive
                    : (isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary),
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
