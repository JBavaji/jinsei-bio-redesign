import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// Modular Splash Footer Brand Block Component
/// Renders Jinsei Bioscience brand logo text and dynamic copyright year.
class SplashFooterBrandBlock extends StatelessWidget {
  final bool isDark;

  const SplashFooterBrandBlock({
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
