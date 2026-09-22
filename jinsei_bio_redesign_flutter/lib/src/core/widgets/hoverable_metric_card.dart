import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Reusable metric card with smooth micro-animation and glow on hover,
/// matching Stitch HTML design specifications (`card-shadow`, `glow-hover`).
class HoverableMetricCard extends StatefulWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color accentColor;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const HoverableMetricCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.accentColor = AppColors.cyanInteractive,
    this.width,
    this.margin,
    this.padding,
    this.onTap,
  });

  @override
  State<HoverableMetricCard> createState() => _HoverableMetricCardState();
}

class _HoverableMetricCardState extends State<HoverableMetricCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final borderColor = _isHovered
        ? AppColors.emeraldAccent.withValues(alpha: 0.60)
        : (isDark
            ? AppColors.cyanInteractive.withValues(alpha: 0.25)
            : AppColors.lightBorder);

    final shadowColor = _isHovered
        ? widget.accentColor.withValues(alpha: 0.20)
        : widget.accentColor.withValues(alpha: 0.06);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          width: widget.width,
          margin: widget.margin ?? const EdgeInsets.all(8),
          padding: widget.padding ?? const EdgeInsets.all(20),
          transform: _isHovered
              ? Matrix4.translationValues(0.0, -4.0, 0.0)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkSurface.withValues(alpha: 0.90)
                : AppColors.lightSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: _isHovered ? 20 : 12,
                spreadRadius: _isHovered ? 2 : 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: widget.accentColor,
                size: 32,
              ),
              const SizedBox(height: 10),
              Text(
                widget.value,
                textAlign: TextAlign.center,
                style: (widget.value.length <= 5
                        ? theme.textTheme.headlineMedium
                        : theme.textTheme.titleMedium)
                    ?.copyWith(
                  fontFamily: 'Montserrat',
                  fontSize: widget.value.length <= 5 ? 28 : 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.lightTextPrimary,
                  letterSpacing: widget.value.length <= 5 ? -0.5 : 0.0,
                  height: widget.value.length <= 5 ? 1.1 : 1.25,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
