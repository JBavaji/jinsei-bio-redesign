import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DiscoveryEmblemWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  const DiscoveryEmblemWidget({
    super.key,
    this.title = 'JINSEI BIOSCIENCE',
    this.subtitle = 'Translational Microbial Discovery Engine',
  });

  @override
  State<DiscoveryEmblemWidget> createState() => _DiscoveryEmblemWidgetState();
}

class _DiscoveryEmblemWidgetState extends State<DiscoveryEmblemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Semantics(
      label: '${widget.title} Emblem. ${widget.subtitle}',
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? (_isHovered
                          ? const Color(0xFF14202D)
                          : const Color(0xFF101A24))
                      : (_isHovered ? Colors.white : const Color(0xFFFAFCFD)),
                  border: Border.all(
                    color: _isHovered
                        ? AppColors.emeraldAccent
                        : (isDark
                            ? AppColors.cyanInteractive.withValues(alpha: 0.6)
                            : AppColors.primaryTeal.withValues(alpha: 0.35)),
                    width: _isHovered ? 2.5 : 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _isHovered
                          ? AppColors.emeraldAccent.withValues(alpha: 0.45)
                          : (isDark
                              ? AppColors.cyanInteractive
                                  .withValues(alpha: 0.35)
                              : AppColors.primaryTeal.withValues(alpha: 0.15)),
                      blurRadius: _isHovered ? 36 : 28,
                      spreadRadius: _isHovered ? 4 : 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Image.asset(
                  'assets/images/logo/official_brand_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.5,
                  color: isDark ? Colors.white : AppColors.labCharcoal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: Text(
                  widget.subtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.cyanInteractive
                        : AppColors.primaryTeal,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
