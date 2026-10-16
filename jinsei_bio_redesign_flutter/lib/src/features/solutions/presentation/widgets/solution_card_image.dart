import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/solution_card_model.dart';

/// Modular Solution Card Image Component:
/// 1. Remote CDN / Cloud Storage URL via [Image.network] with loading indicator.
/// 2. Graceful biotech glowing fallback indicator with vertical icon.
class SolutionCardImage extends StatelessWidget {
  final SolutionCardModel solution;
  final bool isDark;

  const SolutionCardImage({
    super.key,
    required this.solution,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final targetUrl =
        isDark ? solution.effectiveDarkImage : solution.effectiveLightImage;

    return Container(
      height: 155,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0A1118) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (isDark ? AppColors.cyanInteractive : AppColors.primaryTeal)
              .withValues(alpha: 0.25),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(targetUrl),
            // Subtle bottom gradient vignette
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 60,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      (isDark ? Colors.black : Colors.white)
                          .withValues(alpha: 0.4),
                    ],
                  ),
                ),
              ),
            ),
            // Top-right vertical indicator badge
            Positioned(
              top: 10,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: (isDark ? Colors.black : Colors.white)
                      .withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppColors.cyanInteractive.withValues(alpha: 0.6),
                  ),
                ),
                child: Text(
                  'VERTICAL 0${solution.displayOrder}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: AppColors.cyanInteractive,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String targetUrl) {
    if (targetUrl.startsWith('http://') || targetUrl.startsWith('https://')) {
      return Image.network(
        targetUrl,
        semanticLabel: '${solution.title} illustration',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildFallbackBiotech(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingPlaceholder();
        },
      );
    }
    return _buildFallbackBiotech();
  }

  Widget _buildLoadingPlaceholder() {
    return Center(
      child: SizedBox(
        width: 28,
        height: 28,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            isDark ? AppColors.cyanInteractive : AppColors.primaryTeal,
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackBiotech() {
    return Semantics(
      label: '${solution.title} icon illustration',
      child: Container(
        color: isDark ? const Color(0xFF0C242E) : const Color(0xFFE2E8F0),
        child: Center(
          child: Icon(
            solution.icon,
            size: 48,
            color: (isDark ? AppColors.cyanInteractive : AppColors.primaryTeal)
                .withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
