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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 10,
              children: [
                SplashFooterBrandBlock(isDark: isDark),
                SplashFooterLinksBlock(isDark: isDark),
              ],
            ),
          ),

          // Unofficial Redesign Disclaimer Guardrail
          const DisclaimerBanner(),
        ],
      ),
    );
  }
}
