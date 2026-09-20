import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

class DrawerHeaderBlock extends StatelessWidget {
  final bool isDark;
  final VoidCallback onClose;

  const DrawerHeaderBlock({
    super.key,
    required this.isDark,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo/official_brand_logo.png',
            height: 32,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.biotech_rounded,
              color: AppColors.bioluminescentGreen,
              size: 28,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'JINSEI',
                style: AppTypography.brandLogoTitle(
                  color: titleColor,
                  fontSize: 14,
                ),
              ),
              Text(
                'BIOSCIENCE',
                style: AppTypography.brandLogoSubtitle(
                  color: AppColors.cyanInteractive,
                  fontSize: 9,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
