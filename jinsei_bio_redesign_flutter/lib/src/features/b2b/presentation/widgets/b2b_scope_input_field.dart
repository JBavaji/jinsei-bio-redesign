import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class B2bScopeInputField extends StatelessWidget {
  final String clinicalScope;
  final ValueChanged<String> onScopeChanged;

  const B2bScopeInputField({
    super.key,
    required this.clinicalScope,
    required this.onScopeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'INTENDED COMMERCIAL APPLICATION / CLINICAL SCOPE (OPTIONAL)',
          style: TextStyle(
            color: Color(0xFFBDC8CA),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: clinicalScope,
          onChanged: onScopeChanged,
          maxLines: 2,
          style: TextStyle(
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontSize: 12,
          ),
          decoration: InputDecoration(
            hintText:
                'Briefly describe your intended dosage form, regulatory pathway, or testing timeline (e.g. In-vitro GI stability, Phase-1 trial pilot)...',
            hintStyle: const TextStyle(color: Color(0xFF64748B), fontSize: 11),
            filled: true,
            fillColor: isDark
                ? const Color(0xFF0B141E).withValues(alpha: 0.85)
                : Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
