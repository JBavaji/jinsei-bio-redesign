import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

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
    final textColor = isActive
        ? AppColors.cyanInteractive
        : (isDark
            ? AppColors.darkTextSecondary
            : AppColors.lightTextSecondary);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTypography.navTabDesktop(
                  color: textColor,
                  isActive: isActive,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 2,
                color:
                    isActive ? AppColors.cyanInteractive : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

