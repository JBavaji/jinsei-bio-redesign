import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DrawerInfoSection extends StatelessWidget {
  final bool isDark;

  const DrawerInfoSection({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LAB FACILITY & ACCREDITATION',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: 12),
        _DrawerInfoRow(
          icon: Icons.location_city_rounded,
          text: 'NCL Innovation Park, Pune',
          isDark: isDark,
        ),
        const SizedBox(height: 8),
        _DrawerInfoRow(
          icon: Icons.mail_rounded,
          text: 'info@jinseibio.com',
          isDark: isDark,
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.emeraldGreen.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.emeraldGreen.withValues(alpha: 0.3),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified_rounded,
                size: 14,
                color: AppColors.emeraldGreen,
              ),
              SizedBox(width: 6),
              Text(
                'ISO 9001 & GMP Certified',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.emeraldGreen,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DrawerInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isDark;

  const _DrawerInfoRow({
    required this.icon,
    required this.text,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.cyanInteractive,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
