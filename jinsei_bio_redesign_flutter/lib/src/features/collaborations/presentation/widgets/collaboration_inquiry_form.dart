import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../bloc/collaborations_bloc.dart';
import '../bloc/collaborations_event.dart';
import '../bloc/collaborations_state.dart';

class CollaborationInquiryForm extends StatelessWidget {
  const CollaborationInquiryForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<CollaborationsBloc, CollaborationsState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color:
                isDark ? const Color(0xFF101A24) : AppColors.lightSurfaceCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark ? const Color(0x3F1492A1) : AppColors.lightBorder,
            ),
          ),
          child: state.isSuccess
              ? _SuccessCard(trackingId: state.trackingId ?? '')
              : _FormContent(state: state, isDark: isDark),
        );
      },
    );
  }
}

class _SuccessCard extends StatelessWidget {
  final String trackingId;
  const _SuccessCard({required this.trackingId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle_outline,
            color: AppColors.emeraldAccent, size: 56),
        const SizedBox(height: 16),
        Text(
          'Inquiry Received Successfully',
          style: AppTypography.displayMedium(color: AppColors.emeraldAccent)
              .copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Tracking ID: $trackingId\nOur Scientific Secretariat will respond within 24 business hours.',
          style: AppTypography.bodyMedium(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary)
              .copyWith(fontSize: 13, height: 1.5),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          key: const Key('submit_another_inquiry_button'),
          onPressed: () => context
              .read<CollaborationsBloc>()
              .add(const ResetCollaborationInquiryEvent()),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryContainerTeal,
            foregroundColor: Colors.white,
          ),
          child: const Text('Submit Another Inquiry'),
        ),
      ],
    );
  }
}

class _FormContent extends StatelessWidget {
  final CollaborationsState state;
  final bool isDark;

  const _FormContent({required this.state, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CollaborationsBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Submit Collaboration Inquiry',
          style: AppTypography.displayMedium(
            color: isDark ? Colors.white : AppColors.lightTextPrimary,
          ).copyWith(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          'Fill out the form below to connect directly with our Scientific Partnership Committee.',
          style: AppTypography.bodySmall(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ).copyWith(fontSize: 12),
        ),
        if (state.errorMessage != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.withOpacity(0.3)),
            ),
            child: Text(
              state.errorMessage!,
              style: const TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
          ),
        ],
        const SizedBox(height: 20),
        _buildTextField(
          key: const Key('collab_name_input'),
          label: 'Name*',
          hint: 'Dr. / Mr. / Ms. Full Name',
          onChanged: (v) => bloc.add(NameChangedEvent(v)),
        ),
        const SizedBox(height: 14),
        _buildTextField(
          key: const Key('collab_email_input'),
          label: 'Email*',
          hint: 'name@company.com',
          keyboardType: TextInputType.emailAddress,
          onChanged: (v) => bloc.add(EmailChangedEvent(v)),
        ),
        const SizedBox(height: 14),
        _buildTextField(
          key: const Key('collab_org_input'),
          label: 'Organization / Institution',
          hint: 'Company or University Name',
          onChanged: (v) => bloc.add(OrganizationChangedEvent(v)),
        ),
        const SizedBox(height: 14),
        _buildTrackDropdown(bloc),
        const SizedBox(height: 14),
        _buildTextField(
          key: const Key('collab_message_input'),
          label: 'Message*',
          hint:
              'Describe your product requirements, strain application goals, or R&D scope...',
          maxLines: 4,
          onChanged: (v) => bloc.add(MessageChangedEvent(v)),
        ),
        const SizedBox(height: 20),
        _buildSubmitButton(bloc),
      ],
    );
  }

  Widget _buildTextField({
    required Key key,
    required String label,
    required String hint,
    required ValueChanged<String> onChanged,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelCaps(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ).copyWith(fontSize: 11, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        TextField(
          key: key,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: TextStyle(
            color: isDark ? Colors.white : AppColors.lightTextPrimary,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: isDark ? Colors.white30 : Colors.black26,
              fontSize: 13,
            ),
            filled: true,
            fillColor: isDark
                ? const Color(0xFF0A1118).withOpacity(0.8)
                : Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? const Color(0xFF334155) : AppColors.lightBorder,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? const Color(0xFF334155) : AppColors.lightBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.emeraldAccent),
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildTrackDropdown(CollaborationsBloc bloc) {
    const tracks = [
      'FMCG Product Integration',
      'Lactic Acid Bacteria CRO',
      'Academic Joint R&D',
      'Custom Microbe Application',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Partnership Track',
          style: AppTypography.labelCaps(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ).copyWith(fontSize: 11, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          key: const Key('collab_track_dropdown'),
          value: state.partnershipTrack,
          dropdownColor:
              isDark ? const Color(0xFF0A1118) : AppColors.lightSurfaceCard,
          style: TextStyle(
            color: isDark ? Colors.white : AppColors.lightTextPrimary,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isDark
                ? const Color(0xFF0A1118).withOpacity(0.8)
                : Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? const Color(0xFF334155) : AppColors.lightBorder,
              ),
            ),
          ),
          items: tracks.map((track) {
            return DropdownMenuItem(value: track, child: Text(track));
          }).toList(),
          onChanged: (val) {
            if (val != null) bloc.add(PartnershipTrackChangedEvent(val));
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton(CollaborationsBloc bloc) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        key: const Key('collab_submit_button'),
        onPressed: state.isLoading
            ? null
            : () => bloc.add(const SubmitCollaborationInquiryEvent()),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.emeraldAccent,
          foregroundColor: const Color(0xFF0A1118),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: state.isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xFF0A1118),
                ),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SEND INQUIRY',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
      ),
    );
  }
}
