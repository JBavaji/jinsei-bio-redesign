import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../bloc/b2b_form_bloc.dart';
import '../bloc/b2b_form_event.dart';
import '../bloc/b2b_form_state.dart';

/// Modular B2B Diagnostic Form Component
class B2bDiagnosticForm extends StatelessWidget {
  final bool isDark;
  final bool isMobile;

  const B2bDiagnosticForm({
    super.key,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B2bFormBloc, B2bFormState>(
      listener: (context, state) {
        if (state.status == B2bFormStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.emeraldGreen,
              content: Text(
                'Diagnostic request submitted successfully! Sandbox endpoint notified.',
              ),
            ),
          );
        } else if (state.status == B2bFormStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(state.errorMessage ?? 'Submission failed.'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(isMobile ? 20 : 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Diagnostic Inquiry',
                style: AppTypography.displayMedium(
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                  fontSize: isMobile ? 20 : 22,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Direct clinical & research partnership channel',
                style: AppTypography.bodySmall(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (val) => context
                    .read<B2bFormBloc>()
                    .add(FullNameChangedEvent(val)),
                decoration:
                    _inputDecoration('FULL NAME', 'Dr. Jane Doe', isDark),
                style: _inputTextStyle(isDark),
              ),
              const SizedBox(height: 12),
              TextField(
                onChanged: (val) => context
                    .read<B2bFormBloc>()
                    .add(CompanyChangedEvent(val)),
                decoration: _inputDecoration(
                  'COMPANY / INSTITUTION',
                  'BioTech Labs Global',
                  isDark,
                ),
                style: _inputTextStyle(isDark),
              ),
              const SizedBox(height: 12),
              TextField(
                onChanged: (val) =>
                    context.read<B2bFormBloc>().add(EmailChangedEvent(val)),
                decoration: _inputDecoration(
                  'WORK EMAIL',
                  'j.doe@biotechlabs.com',
                  isDark,
                ),
                style: _inputTextStyle(isDark),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                isExpanded: true,
                initialValue: state.classification,
                dropdownColor: isDark
                    ? AppColors.darkSurfaceCard
                    : AppColors.lightSurfaceCard,
                decoration:
                    _inputDecoration('INQUIRY CLASSIFICATION', '', isDark),
                style: _inputTextStyle(isDark),
                items: const [
                  DropdownMenuItem(
                    value: 'Clinical Research Collaboration',
                    child: Text('Clinical Research Collaboration'),
                  ),
                  DropdownMenuItem(
                    value: 'B2B Sample Request',
                    child: Text('B2B Sample Request'),
                  ),
                  DropdownMenuItem(
                    value: 'Investment & Partnerships',
                    child: Text('Investment & Partnerships'),
                  ),
                  DropdownMenuItem(
                    value: 'Academic Inquiry',
                    child: Text('Academic Inquiry'),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) {
                    context
                        .read<B2bFormBloc>()
                        .add(InquiryClassificationChangedEvent(val));
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: state.status == B2bFormStatus.submitting
                      ? null
                      : () {
                          context
                              .read<B2bFormBloc>()
                              .add(const SubmitB2bFormEvent());
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.emeraldGreen,
                    foregroundColor: AppColors.darkObsidianBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: state.status == B2bFormStatus.submitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.darkObsidianBg,
                          ),
                        )
                      : Text(
                          'SUBMIT DIAGNOSTIC REQUEST',
                          style: AppTypography.labelCaps(
                            color: AppColors.darkObsidianBg,
                            fontSize: 12,
                            letterSpacing: 0.8,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration(String label, String hint, bool isDark) {
    return InputDecoration(
      labelText: label,
      hintText: hint.isNotEmpty ? hint : null,
      labelStyle: AppTypography.labelCaps(
        color: isDark
            ? AppColors.darkTextSecondary
            : AppColors.lightTextSecondary,
        fontSize: 11,
      ),
      filled: true,
      fillColor: isDark
          ? const Color(0xFF0A1118).withValues(alpha: 0.6)
          : AppColors.lightBg,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: AppColors.cyanInteractive,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    );
  }

  TextStyle _inputTextStyle(bool isDark) {
    return AppTypography.bodySmall(
      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
      fontSize: 14,
    );
  }
}
