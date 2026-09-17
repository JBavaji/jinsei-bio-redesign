import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/disclaimer_banner.dart';

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 640;

                final leftBrandBlock = Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'JINSEI ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                    const Text(
                      'BIOSCIENCE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: AppColors.primaryContainerTeal,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '|   © 2024 All Rights Reserved.',
                      style: TextStyle(
                        fontSize: 11,
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                );

                final rightLinksBlock = Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLink('Privacy Policy', isDark),
                    const SizedBox(width: 16),
                    _buildLink('Terms of Service', isDark),
                    const SizedBox(width: 16),
                    _buildLink('Scientific Disclosure', isDark),
                  ],
                );

                if (isWide) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftBrandBlock,
                      rightLinksBlock,
                    ],
                  );
                }

                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  runSpacing: 10,
                  children: [
                    leftBrandBlock,
                    rightLinksBlock,
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

  Widget _buildLink(String text, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 11,
        color:
            isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
      ),
    );
  }
}
