import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

class B2bRequestSuccessView extends StatelessWidget {
  final String trackingId;
  final VoidCallback onClose;

  const B2bRequestSuccessView({
    super.key,
    required this.trackingId,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.emeraldGreen.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.emeraldGreen.withValues(alpha: 0.4),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.check_rounded,
              color: AppColors.emeraldGreen,
              size: 36,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Sample Request Dispatched Successfully',
            textAlign: TextAlign.center,
            style: AppTypography.headlineMedium(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ).copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your institutional formulation sample order has been registered in our clinical sandbox pipeline.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF0F7D8A).withValues(alpha: 0.15)
                  : AppColors.lightSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF06B6D4).withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.confirmation_number_outlined,
                    size: 16, color: AppColors.cyanInteractive),
                const SizedBox(width: 8),
                Text(
                  'Tracking ID: $trackingId',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cyanInteractive,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.emeraldGreen,
              foregroundColor: const Color(0xFF003919),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: onClose,
            child: const Text('Done',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
