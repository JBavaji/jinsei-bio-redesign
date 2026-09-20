import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'splash_iso_badge.dart';
import 'splash_telemetry_status_dot.dart';

/// Clean top header telemetry container composing status dot and ISO badge.
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
                // Left Heartbeat Status Dot & Label
                SplashTelemetryStatusDot(isCompact: isCompact),
                const SizedBox(width: 8),

                // Right Responsive ISO Certification Badge
                SplashIsoBadge(isCompact: isCompact),
              ],
            );
          },
        ),
      ),
    );
  }
}
