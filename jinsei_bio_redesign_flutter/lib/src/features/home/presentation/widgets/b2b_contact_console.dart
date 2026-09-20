import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/b2b_form_bloc.dart';
import '../bloc/b2b_form_event.dart';
import '../bloc/b2b_form_state.dart';

class B2bContactConsole extends StatelessWidget {
  final GlobalKey? formKey;

  const B2bContactConsole({
    super.key,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 850;

    return Container(
      key: formKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceCard.withValues(alpha: 0.9)
                  : AppColors.lightSurfaceCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cyanInteractive.withValues(alpha: 0.08),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: isDesktop
                ? IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: _HeadquartersPanel(isDark: isDark)),
                        Container(
                          width: 1,
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                        ),
                        Expanded(child: _DiagnosticInquiryForm(isDark: isDark)),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      _HeadquartersPanel(isDark: isDark),
                      Divider(
                        height: 1,
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                      _DiagnosticInquiryForm(isDark: isDark),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _HeadquartersPanel extends StatelessWidget {
  final bool isDark;

  const _HeadquartersPanel({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Headquarters',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 24),
          _InfoRow(
            icon: Icons.location_on_rounded,
            title: 'NCL Innovation Park\nDr. Homi Bhabha Rd\nPune, Maharashtra 411008',
            isDark: isDark,
          ),
          const SizedBox(height: 20),
          _InfoRow(
            icon: Icons.mail_rounded,
            title: 'info@jinseibio.com',
            isDark: isDark,
          ),
          const SizedBox(height: 20),
          _InfoRow(
            icon: Icons.biotech_rounded,
            title: 'ISO 9001 & GMP Certified Lab Facility',
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDark;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColors.cyanInteractive,
          size: 20,
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _DiagnosticInquiryForm extends StatelessWidget {
  final bool isDark;

  const _DiagnosticInquiryForm({required this.isDark});

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
          padding: const EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Diagnostic Inquiry',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Direct clinical & research partnership channel',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: (val) => context
                    .read<B2bFormBloc>()
                    .add(FullNameChangedEvent(val)),
                decoration: _inputDecoration('Full Name', 'Dr. Jane Doe', isDark),
                style: _inputTextStyle(isDark),
              ),
              const SizedBox(height: 14),
              TextField(
                onChanged: (val) => context
                    .read<B2bFormBloc>()
                    .add(CompanyChangedEvent(val)),
                decoration: _inputDecoration(
                    'Company / Institution', 'BioTech Labs Global', isDark),
                style: _inputTextStyle(isDark),
              ),
              const SizedBox(height: 14),
              TextField(
                onChanged: (val) => context
                    .read<B2bFormBloc>()
                    .add(EmailChangedEvent(val)),
                decoration: _inputDecoration(
                    'Work Email', 'j.doe@biotechlabs.com', isDark),
                style: _inputTextStyle(isDark),
              ),
              const SizedBox(height: 14),
              DropdownButtonFormField<String>(
                isExpanded: true,
                initialValue: state.classification,
                dropdownColor: isDark
                    ? AppColors.darkSurfaceCard
                    : AppColors.lightSurfaceCard,
                decoration: _inputDecoration(
                    'Inquiry Classification', '', isDark),
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
              const SizedBox(height: 24),
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
                      : const Text(
                          'Submit Diagnostic Request',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
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

  InputDecoration _inputDecoration(
      String label, String hint, bool isDark) {
    return InputDecoration(
      labelText: label,
      hintText: hint.isNotEmpty ? hint : null,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: isDark
            ? AppColors.darkTextSecondary
            : AppColors.lightTextSecondary,
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
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    );
  }

  TextStyle _inputTextStyle(bool isDark) {
    return TextStyle(
      fontSize: 14,
      color: isDark
          ? AppColors.darkTextPrimary
          : AppColors.lightTextPrimary,
    );
  }
}
