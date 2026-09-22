import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Modular Step Image Card Component for Science Stepper Timeline.
/// Renders step illustration image with border glow and fallback indicator.
class StepImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;

  const StepImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accentColor =
        isSelected ? AppColors.emeraldAccent : AppColors.cyanInteractive;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 190,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurface.withOpacity(0.85)
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? accentColor
              : (isDark
                  ? AppColors.cyanInteractive.withOpacity(0.25)
                  : AppColors.lightBorder),
          width: isSelected ? 2 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(isSelected ? 0.20 : 0.05),
            blurRadius: 16,
            spreadRadius: isSelected ? 1 : 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: isDark
                  ? AppColors.darkSurfaceCard
                  : AppColors.lightSurfaceCard,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.biotech_rounded,
                      size: 44,
                      color: accentColor.withOpacity(0.7),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
