import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';

class SplashEmblemCrucible extends StatefulWidget {
  final double size;

  const SplashEmblemCrucible({
    super.key,
    this.size = 120,
  });

  @override
  State<SplashEmblemCrucible> createState() => _SplashEmblemCrucibleState();
}

class _SplashEmblemCrucibleState extends State<SplashEmblemCrucible>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Ambient Bioluminescent Radial Glow Halo
            Container(
              width: widget.size + 48,
              height: widget.size + 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: isDark
                      ? [
                          const Color(0x660F7D8A), // Teal ambient glow
                          const Color(0x4D10B981), // Emerald ambient glow
                          Colors.transparent,
                        ]
                      : [
                          const Color(0x380F7D8A), // Light teal glow
                          const Color(0x2010B981), // Light emerald glow
                          Colors.transparent,
                        ],
                ),
              ),
            ),

            // Orbiting Dashed Particle Ring
            AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationController.value * 2 * math.pi,
                  child: Container(
                    width: widget.size + 24,
                    height: widget.size + 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryContainerTeal
                            .withValues(alpha: 0.35),
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                );
              },
            ),

            // Official Emblem Image (Preserving Native Transparency)
            Image.asset(
              'assets/images/logo/official_brand_logo.png',
              width: widget.size,
              height: widget.size,
              fit: BoxFit.contain,
            )
                .animate()
                .scale(duration: 800.ms, curve: Curves.easeOutBack)
                .fadeIn(duration: 600.ms),
          ],
        ),
        const SizedBox(height: 24),

        // Brand Typography Lockup
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'JINSEI ',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: widget.size > 110 ? 32 : 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3.0,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
            ),
            Text(
              'BIOSCIENCE',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: widget.size > 110 ? 32 : 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3.0,
                    color: AppColors.primaryContainerTeal,
                  ),
            ),
          ],
        )
            .animate()
            .fadeIn(delay: 300.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
      ],
    );
  }
}
