import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Modular Step Image Card Component for Science Stepper Timeline.
/// Supports 3-Tier Resilient Image Rendering:
/// 1. Remote CDN / Cloud Storage URLs via [Image.network] with loading progress.
/// 2. Automatic fallback to local bundled WebP asset on network failure.
/// 3. Graceful biotech glowing indicator card on complete asset absence.
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
            ? AppColors.darkSurface.withValues(alpha: 0.85)
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? accentColor
              : (isDark
                  ? AppColors.cyanInteractive.withValues(alpha: 0.25)
                  : AppColors.lightBorder),
          width: isSelected ? 2 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: isSelected ? 0.20 : 0.05),
            blurRadius: 16,
            spreadRadius: isSelected ? 1 : 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: _buildImage(context, accentColor, isDark),
      ),
    );
  }

  Widget _buildImage(BuildContext context, Color accentColor, bool isDark) {
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            color:
                isDark ? AppColors.darkSurfaceCard : AppColors.lightSurfaceCard,
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                ),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          final fallback = _resolveFallbackAsset(imageUrl);
          if (fallback != null) {
            return Image.asset(
              fallback,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  _buildPlaceholder(context, accentColor, isDark),
            );
          }
          return _buildPlaceholder(context, accentColor, isDark);
        },
      );
    } else if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            _buildPlaceholder(context, accentColor, isDark),
      );
    }
    return _buildPlaceholder(context, accentColor, isDark);
  }

  String? _resolveFallbackAsset(String url) {
    final match = RegExp(r'step_(\d{2})').firstMatch(url);
    if (match != null) {
      return 'assets/images/science/step_${match.group(1)}.webp';
    }
    return null;
  }

  Widget _buildPlaceholder(
      BuildContext context, Color accentColor, bool isDark) {
    final theme = Theme.of(context);
    return Container(
      color: isDark ? AppColors.darkSurfaceCard : AppColors.lightSurfaceCard,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.biotech_rounded,
              size: 44,
              color: accentColor.withValues(alpha: 0.7),
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
  }
}
