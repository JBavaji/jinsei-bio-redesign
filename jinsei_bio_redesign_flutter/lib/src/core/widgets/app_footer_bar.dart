import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';
import 'link_button.dart';

/// Reusable Global App Footer Bar Component.
/// Encapsulates brand emblem copyright block and official Google policy links.
class AppFooterBar extends StatelessWidget {
  final int? copyrightYear;
  final EdgeInsetsGeometry? padding;

  const AppFooterBar({
    super.key,
    this.copyrightYear,
    this.padding,
  });

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
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final brandBlock = _AppFooterBrandBlock(
              isDark: isDark,
              copyrightYear: copyrightYear,
            );
            final linksBlock = _AppFooterLinksBlock(isDark: isDark);

            if (constraints.maxWidth > 900) {
              return Row(
                children: [
                  brandBlock,
                  const Spacer(),
                  linksBlock,
                ],
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                brandBlock,
                const SizedBox(height: 8),
                linksBlock,
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Encapsulated Brand Emblem & Copyright Block Sub-Widget
class _AppFooterBrandBlock extends StatelessWidget {
  final bool isDark;
  final int? copyrightYear;

  const _AppFooterBrandBlock({
    required this.isDark,
    this.copyrightYear,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final copyrightColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final year = copyrightYear ?? DateTime.now().year;

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
          '|   © $year All Rights Reserved.',
          style: AppTypography.bodySmall(
            color: copyrightColor,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

/// Encapsulated Policy Links Block Sub-Widget
class _AppFooterLinksBlock extends StatelessWidget {
  final bool isDark;

  const _AppFooterLinksBlock({
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
