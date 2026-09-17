import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SplashHeaderTelemetry extends StatelessWidget {
  const SplashHeaderTelemetry({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkObsidianBg.withValues(alpha: 0.8)
            : Colors.white.withValues(alpha: 0.85),
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? AppColors.primaryContainerTeal.withValues(alpha: 0.25)
                : AppColors.lightBorder,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Status Dot + Telemetry Text
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.bioluminescentGreen,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.bioluminescentGreen,
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'DIAGNOSTIC GATEWAY',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              ],
            ),

            // Right ISO Certification Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkObsidianBg
                    : AppColors.primaryContainerTeal.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark
                      ? AppColors.primaryContainerTeal.withValues(alpha: 0.3)
                      : AppColors.primaryContainerTeal.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    size: 13,
                    color: isDark
                        ? AppColors.bioluminescentGreen
                        : AppColors.primaryContainerTeal,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'ISO 9001:2015 • NCL Innovation Park',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'monospace',
                      color: AppColors.primaryContainerTeal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
