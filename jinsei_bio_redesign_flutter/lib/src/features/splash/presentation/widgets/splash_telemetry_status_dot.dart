import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// Left Status Dot with continuous heartbeat pulse animation & telemetry text.
class SplashTelemetryStatusDot extends StatefulWidget {
  final bool isCompact;

  const SplashTelemetryStatusDot({
    super.key,
    required this.isCompact,
  });

  @override
  State<SplashTelemetryStatusDot> createState() =>
      _SplashTelemetryStatusDotState();
}

class _SplashTelemetryStatusDotState extends State<SplashTelemetryStatusDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _heartbeatController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _heartbeatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _heartbeatController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.25).animate(
      CurvedAnimation(
        parent: _heartbeatController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _heartbeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _heartbeatController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
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
              ),
            );
          },
        ),
        const SizedBox(width: 8),
        Text(
          'DIAGNOSTIC GATEWAY',
          style: TextStyle(
            fontSize: widget.isCompact ? 10 : 11,
            letterSpacing: widget.isCompact ? 1.0 : 1.5,
            fontWeight: FontWeight.w600,
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}
