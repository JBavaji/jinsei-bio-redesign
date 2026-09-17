import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

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
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'JINSEI ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
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
          '|   © ${DateTime.now().year} All Rights Reserved.',
          style: TextStyle(
            fontSize: 11,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}
