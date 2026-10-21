import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/formulation_format_option_model.dart';

class B2bFormatDropdown extends StatelessWidget {
  final String selectedFormatId;
  final List<FormulationFormatOptionModel> formats;
  final ValueChanged<String> onFormatChanged;

  const B2bFormatDropdown({
    super.key,
    required this.selectedFormatId,
    required this.formats,
    required this.onFormatChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final value = formats.any((f) => f.formatId == selectedFormatId)
        ? selectedFormatId
        : (formats.isNotEmpty ? formats.first.formatId : null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PREFERRED FORMULATION FORMAT *',
          style: TextStyle(
            color: Color(0xFFBDC8CA),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          dropdownColor:
              isDark ? const Color(0xFF101A26) : AppColors.lightSurface,
          style: TextStyle(
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontSize: 12,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDark
                ? const Color(0xFF0B141E).withValues(alpha: 0.85)
                : Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
          items: formats.map((f) {
            return DropdownMenuItem(
              value: f.formatId,
              child: Text(
                f.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) onFormatChanged(val);
          },
        ),
      ],
    );
  }
}
