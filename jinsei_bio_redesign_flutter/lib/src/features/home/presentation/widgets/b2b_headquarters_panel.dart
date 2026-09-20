import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

/// Modular B2B Headquarters Panel Component
class B2bHeadquartersPanel extends StatelessWidget {
  final bool isDark;
  final bool isMobile;

  const B2bHeadquartersPanel({
    super.key,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 20 : 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Headquarters Badge Tag (matching 01_executive_showcase_dark_mobile.html)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.cyanInteractive.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.cyanInteractive.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.corporate_fare_rounded,
                  size: 14,
                  color: AppColors.cyanInteractive,
                ),
                const SizedBox(width: 6),
                Text(
                  'Headquarters',
                  style: AppTypography.labelCaps(
                    color: AppColors.cyanInteractive,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Jinsei Bioscience',
            style: AppTypography.displayMedium(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
              fontSize: isMobile ? 22 : 26,
            ),
          ),
          const SizedBox(height: 20),
          _InfoRow(
            icon: Icons.location_on_rounded,
            title:
                'NCL Innovation Park, Dr. Homi Bhabha Rd\nPune, Maharashtra 411008',
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _InfoRow(
            icon: Icons.mail_rounded,
            title: 'info@jinseibio.com',
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _InfoRow(
            icon: Icons.verified_rounded,
            iconColor: AppColors.emeraldGreen,
            title: 'ISO 9001 & GMP Certified Lab Facility',
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final bool isDark;

  const _InfoRow({
    required this.icon,
    this.iconColor = AppColors.cyanInteractive,
    required this.title,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: AppTypography.bodySmall(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
