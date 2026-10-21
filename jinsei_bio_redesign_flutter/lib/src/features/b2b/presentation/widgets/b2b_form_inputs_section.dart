import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/formulation_format_option_model.dart';
import 'b2b_format_dropdown.dart';
import 'b2b_text_input_field.dart';

class B2bFormInputsSection extends StatelessWidget {
  final String fullName;
  final String email;
  final String company;
  final String selectedFormatId;
  final bool isEmailValid;
  final List<FormulationFormatOptionModel> formats;
  final ValueChanged<String> onFullNameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onCompanyChanged;
  final ValueChanged<String> onFormatChanged;

  const B2bFormInputsSection({
    super.key,
    required this.fullName,
    required this.email,
    required this.company,
    required this.selectedFormatId,
    required this.isEmailValid,
    required this.formats,
    required this.onFullNameChanged,
    required this.onEmailChanged,
    required this.onCompanyChanged,
    required this.onFormatChanged,
  });

  @override
  Widget build(BuildContext context) {
    final nameField = B2bTextInputField(
      label: 'FULL NAME & SCIENTIFIC TITLE *',
      initialValue: fullName,
      onChanged: onFullNameChanged,
      suffixIcon: const Icon(
        Icons.badge_outlined,
        size: 18,
        color: Color(0xFF64748B),
      ),
    );

    final emailField = B2bTextInputField(
      label: 'CORPORATE / INSTITUTIONAL WORK EMAIL *',
      initialValue: email,
      onChanged: onEmailChanged,
      keyboardType: TextInputType.emailAddress,
      suffixIcon: isEmailValid
          ? const Icon(
              Icons.check_circle_rounded,
              size: 18,
              color: AppColors.emeraldGreen,
            )
          : const Icon(
              Icons.email_outlined,
              size: 18,
              color: Color(0xFF64748B),
            ),
    );

    final companyField = B2bTextInputField(
      label: 'ORGANIZATION / PHARMACEUTICAL COMPANY *',
      initialValue: company,
      onChanged: onCompanyChanged,
      suffixIcon: const Icon(
        Icons.domain_outlined,
        size: 18,
        color: Color(0xFF64748B),
      ),
    );

    final formatWidget = B2bFormatDropdown(
      selectedFormatId: selectedFormatId,
      formats: formats,
      onFormatChanged: onFormatChanged,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 620;

        if (isCompact) {
          return Column(
            children: [
              nameField,
              const SizedBox(height: 12),
              emailField,
              const SizedBox(height: 12),
              companyField,
              const SizedBox(height: 12),
              formatWidget,
            ],
          );
        }

        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: nameField),
                const SizedBox(width: 14),
                Expanded(child: emailField),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: companyField),
                const SizedBox(width: 14),
                Expanded(child: formatWidget),
              ],
            ),
          ],
        );
      },
    );
  }
}
