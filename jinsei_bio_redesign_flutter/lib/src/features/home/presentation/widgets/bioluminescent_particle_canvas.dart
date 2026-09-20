import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class BioluminescentParticleCanvas extends StatefulWidget {
  final Widget child;

  const BioluminescentParticleCanvas({
    super.key,
    required this.child,
  });

  @override
  State<BioluminescentParticleCanvas> createState() =>
      _BioluminescentParticleCanvasState();
}

class _BioluminescentParticleCanvasState
    extends State<BioluminescentParticleCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    for (int i = 0; i < 25; i++) {
      _particles.add(_Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        radius: _random.nextDouble() * 3 + 1.5,
        speed: _random.nextDouble() * 0.05 + 0.02,
        alpha: _random.nextDouble() * 0.5 + 0.2,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
            isDark: isDark,
          ),
          child: widget.child,
        );
      },
    );
  }
}

class _Particle {
  double x;
  double y;
  final double radius;
  final double speed;
  final double alpha;

  _Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.alpha,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final bool isDark;

  _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!isDark) return;

    // Draw ambient central radial glow
    final centerGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.cyanInteractive.withValues(alpha: 0.12),
          AppColors.bioluminescentGreen.withValues(alpha: 0.05),
          Colors.transparent,
        ],
        stops: const [0.0, 0.4, 1.0],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.3),
        radius: size.width * 0.45,
      ));

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.3),
      size.width * 0.45,
      centerGlow,
    );

    // Draw floating bioluminescent microbe particles
    for (var p in particles) {
      final currentY = (p.y - progress * p.speed) % 1.0;
      final offset = Offset(p.x * size.width, currentY * size.height);

      final paint = Paint()
        ..color = AppColors.cyanInteractive.withValues(alpha: p.alpha)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0);

      canvas.drawCircle(offset, p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
