import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class B2bTextInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const B2bTextInputField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFBDC8CA),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: TextStyle(
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDark
                ? const Color(0xFF0B141E).withValues(alpha: 0.85)
                : Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: isDark
                    ? const Color(0xFF1492A1).withValues(alpha: 0.25)
                    : AppColors.lightBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.cyanInteractive,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
