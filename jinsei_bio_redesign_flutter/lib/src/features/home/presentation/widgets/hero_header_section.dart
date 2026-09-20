import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'executive_stats_bar.dart';

class HeroHeaderSection extends StatelessWidget {
  const HeroHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isDesktop ? 64 : 40,
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
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: isDesktop ? 52 : 36,
                    height: 1.15,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
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

              const SizedBox(height: 20),

              // Subtitle
              Text(
                'Harnessing native Lactobacillus strains through clinical R&D for global health.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 18 : 15,
                  height: 1.5,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),

              const SizedBox(height: 48),

              // Executive Stats Bar Component
              const ExecutiveStatsBar(),
            ],
          ),
        ),
      ),
    );
  }
}
