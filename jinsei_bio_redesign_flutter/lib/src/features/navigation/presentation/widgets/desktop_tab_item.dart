import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DesktopTabItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  final bool isDark;

  const DesktopTabItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                color: isActive
                    ? AppColors.cyanInteractive
                    : (isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary),
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 24,
                color: AppColors.cyanInteractive,
              ),
          ],
        ),
      ),
    );
  }
}
