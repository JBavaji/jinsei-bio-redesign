import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SplashHeaderTelemetry extends StatelessWidget {
  const SplashHeaderTelemetry({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 480;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Status Dot + Telemetry Text
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 9,
                      height: 9,
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
                    const SizedBox(width: 6),
                    Text(
                      'DIAGNOSTIC GATEWAY',
                      style: TextStyle(
                        fontSize: isCompact ? 10 : 11,
                        letterSpacing: isCompact ? 1.0 : 1.5,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),

                // Right ISO Certification Badge (Flexible & Responsive)
                Flexible(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkObsidianBg
                          : AppColors.primaryContainerTeal
                              .withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDark
                            ? AppColors.primaryContainerTeal
                                .withValues(alpha: 0.3)
                            : AppColors.primaryContainerTeal
                                .withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          size: 12,
                          color: isDark
                              ? AppColors.bioluminescentGreen
                              : AppColors.primaryContainerTeal,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            isCompact
                                ? 'ISO 9001:2015'
                                : 'ISO 9001:2015 • NCL Innovation Park',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'monospace',
                              color: AppColors.primaryContainerTeal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
