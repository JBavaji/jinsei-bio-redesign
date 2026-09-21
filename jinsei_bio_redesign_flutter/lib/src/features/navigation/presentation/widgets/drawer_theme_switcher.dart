import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_bloc.dart';

class DrawerThemeSwitcher extends StatelessWidget {
  final bool isDark;

  const DrawerThemeSwitcher({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF101A24).withValues(alpha: 0.9)
            : AppColors.lightSurfaceCard,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.wb_sunny_rounded,
            size: 18,
            color: AppColors.cyanInteractive,
          ),
          const SizedBox(width: 8),
          Text(
            'Theme Mode',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkObsidianBg : AppColors.lightBorder,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                _ThemeSegmentButton(
                  label: 'Light',
                  isSelected: !isDark,
                  onTap: () {
                    if (isDark) {
                      context.read<ThemeBloc>().add(const ToggleThemeEvent());
                    }
                  },
                ),
                _ThemeSegmentButton(
                  label: 'Dark',
                  isSelected: isDark,
                  onTap: () {
                    if (!isDark) {
                      context.read<ThemeBloc>().add(const ToggleThemeEvent());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeSegmentButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeSegmentButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color:
              isSelected ? AppColors.primaryContainerTeal : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.darkTextSecondary,
          ),
        ),
      ),
    );
  }
}
