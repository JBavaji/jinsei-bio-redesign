import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

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
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1.5,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const Text(
                'BIOSCIENCE',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 9,
                  letterSpacing: 2.0,
                  color: AppColors.cyanInteractive,
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
