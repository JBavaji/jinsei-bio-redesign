import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';

/// Reusable B2B Sample Request CTA Button Component.
/// Encapsulates emerald theme styling and customizable label/dimensions.
class SampleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final double borderRadius;
  final double? width;
  final double? height;

  const SampleButton({
    super.key,
    this.onPressed,
    this.label = 'Request B2B Sample',
    this.padding,
    this.fontSize = 12,
    this.borderRadius = 6,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed ?? () => context.go('/'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.emeraldGreen,
        foregroundColor: AppColors.darkObsidianBg,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(label),
      ),
    );

    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: button,
      );
    }

    return button;
  }
}
