import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/disclaimer_banner.dart';
import 'splash_footer_brand_block.dart';
import 'splash_footer_links_block.dart';

class SplashFooterBar extends StatelessWidget {
  const SplashFooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkObsidianBg.withValues(alpha: 0.9)
            : Colors.white.withValues(alpha: 0.9),
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : AppColors.lightBorder,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  return Row(
                    children: [
                      SplashFooterBrandBlock(isDark: isDark),
                      const Spacer(),
                      SplashFooterLinksBlock(isDark: isDark),
                    ],
                  );
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SplashFooterBrandBlock(isDark: isDark),
                    const SizedBox(height: 8),
                    SplashFooterLinksBlock(isDark: isDark),
                  ],
                );
              },
            ),
          ),

          // Unofficial Redesign Disclaimer Guardrail
          const DisclaimerBanner(),
        ],
      ),
    );
  }
}
