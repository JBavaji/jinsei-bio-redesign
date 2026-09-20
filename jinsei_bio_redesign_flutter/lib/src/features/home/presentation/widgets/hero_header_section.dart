import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import 'executive_stats_bar.dart';

class HeroHeaderSection extends StatelessWidget {
  const HeroHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isDesktop ? 64 : (isMobile ? 32 : 44),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // Main Title with Cyan Glow Accent
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTypography.displayLarge(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                    fontSize: isDesktop ? 52 : (isMobile ? 28 : 38),
                  ),
                  children: [
                    const TextSpan(text: 'The Indigenous \n'),
                    TextSpan(
                      text: 'Microbe Revolution',
                      style: TextStyle(
                        color: AppColors.cyanInteractive,
                        shadows: isDark
                            ? [
                                Shadow(
                                  color: AppColors.cyanInteractive
                                      .withValues(alpha: 0.5),
                                  blurRadius: 16,
                                ),
                              ]
                            : null,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Subtitle
              Text(
                'Harnessing native Lactobacillus strains through clinical R&D for global health.',
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontSize: isDesktop ? 18 : (isMobile ? 14 : 16),
                ),
              ),

              SizedBox(height: isMobile ? 32 : 48),

              // Executive Stats Bar Component
              const ExecutiveStatsBar(),
            ],
          ),
        ),
      ),
    );
  }
}
