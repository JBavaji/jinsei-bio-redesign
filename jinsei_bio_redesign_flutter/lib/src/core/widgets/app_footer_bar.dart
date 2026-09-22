import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';
import 'link_button.dart';

/// Reusable Global App Footer Bar Component
/// Renders brand logo copyright and official Google policy link buttons.
class AppFooterBar extends StatelessWidget {
  const AppFooterBar({super.key});

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              return Row(
                children: [
                  AppFooterBrandBlock(isDark: isDark),
                  const Spacer(),
                  AppFooterLinksBlock(isDark: isDark),
                ],
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppFooterBrandBlock(isDark: isDark),
                const SizedBox(height: 8),
                AppFooterLinksBlock(isDark: isDark),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Modular App Footer Brand Block Component
class AppFooterBrandBlock extends StatelessWidget {
  final bool isDark;

  const AppFooterBrandBlock({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final copyrightColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'JINSEI',
          style: AppTypography.brandLogoTitle(
            color: titleColor,
            fontSize: 11,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          'BIOSCIENCE',
          style: AppTypography.brandLogoSubtitle(
            color: AppColors.primaryContainerTeal,
            fontSize: 11,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '|   © ${DateTime.now().year} All Rights Reserved.',
          style: AppTypography.bodySmall(
            color: copyrightColor,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

/// Modular App Footer Links Block Component
class AppFooterLinksBlock extends StatelessWidget {
  final bool isDark;

  const AppFooterLinksBlock({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 6,
      children: [
        LinkButton(
          label: 'Privacy Policy',
          url: 'https://policies.google.com/privacy',
          isDark: isDark,
        ),
        LinkButton(
          label: 'Terms of Service',
          url: 'https://policies.google.com/terms',
          isDark: isDark,
        ),
        LinkButton(
          label: 'Scientific Disclosure',
          url: 'https://policies.google.com/technologies',
          isDark: isDark,
        ),
      ],
    );
  }
}
