import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SplashProgressTracker extends StatefulWidget {
  final double progress;
  final String statusText;

  const SplashProgressTracker({
    super.key,
    this.progress = 0.78,
    this.statusText = 'Calibrating metagenomic consortia...',
  });

  @override
  State<SplashProgressTracker> createState() => _SplashProgressTrackerState();
}

class _SplashProgressTrackerState extends State<SplashProgressTracker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 340),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress Bar Track
          AnimatedBuilder(
            animation: _animController,
            builder: (context, child) {
              final currentProgress = widget.progress * _animController.value;
              return Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkObsidianBg
                      : const Color(0xFFE2E8F0),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        AppColors.primaryContainerTeal.withValues(alpha: 0.25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: currentProgress.clamp(0.05, 1.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryContainerTeal,
                              AppColors.bioluminescentGreen,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),

          // Real-time Status Text & Progress Counter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 13,
                      height: 13,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isDark
                              ? AppColors.bioluminescentGreen
                              : AppColors.primaryContainerTeal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.statusText,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'monospace',
                          color: isDark
                              ? AppColors.bioluminescentGreen
                              : AppColors.primaryContainerTeal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: _animController,
                builder: (context, child) {
                  final pct =
                      (widget.progress * _animController.value * 100).toInt();
                  return Text(
                    '$pct%',
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryContainerTeal,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
