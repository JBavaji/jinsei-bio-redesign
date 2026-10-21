import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/b2b_modal_content_model.dart';
import '../bloc/b2b_request_bloc.dart';
import '../bloc/b2b_request_event.dart';
import '../bloc/b2b_request_state.dart';
import 'b2b_compliance_trust_bar.dart';
import 'b2b_form_inputs_section.dart';
import 'b2b_modal_actions_bar.dart';
import 'b2b_modal_header.dart';
import 'b2b_scope_input_field.dart';
import 'b2b_strain_vertical_selector.dart';

class B2bModalFormBody extends StatelessWidget {
  final B2bModalContentModel? content;
  final B2bRequestState state;

  const B2bModalFormBody({
    super.key,
    required this.content,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          B2bModalHeader(
            badgeText: content?.badgeText ?? 'COMMERCIAL FORMULATION',
            title: content?.title ?? 'Request B2B Formulation Sample',
            subtitle: content?.subtitle ?? '',
            onClose: () => Navigator.of(context).pop(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                if (content != null && content!.strains.isNotEmpty)
                  B2bStrainVerticalSelector(
                    strains: content!.strains,
                    selectedStrainId: state.selectedStrainId,
                    onSelectStrain: (id) => context
                        .read<B2bRequestBloc>()
                        .add(SelectStrainVerticalEvent(id)),
                  ),
                const SizedBox(height: 18),
                if (content != null)
                  B2bFormInputsSection(
                    fullName: state.fullName,
                    email: state.email,
                    company: state.company,
                    selectedFormatId: state.selectedFormatId,
                    isEmailValid: state.isEmailValid,
                    formats: content!.formulationFormats,
                    onFullNameChanged: (val) => context
                        .read<B2bRequestBloc>()
                        .add(FullNameChangedEvent(val)),
                    onEmailChanged: (val) => context
                        .read<B2bRequestBloc>()
                        .add(EmailChangedEvent(val)),
                    onCompanyChanged: (val) => context
                        .read<B2bRequestBloc>()
                        .add(CompanyChangedEvent(val)),
                    onFormatChanged: (val) => context
                        .read<B2bRequestBloc>()
                        .add(FormulationFormatChangedEvent(val)),
                  ),
                const SizedBox(height: 14),
                B2bScopeInputField(
                  clinicalScope: state.clinicalScope,
                  onScopeChanged: (val) => context
                      .read<B2bRequestBloc>()
                      .add(ClinicalScopeChangedEvent(val)),
                ),
                const SizedBox(height: 16),
                if (content != null)
                  B2bComplianceTrustBar(
                    complianceNote: content!.complianceNote,
                    certifications: content!.certifications,
                  ),
                const SizedBox(height: 18),
                B2bModalActionsBar(
                  dispatchNotice: content?.dispatchNotice ??
                      'Protected by scientific NDA. Formulation sample kits dispatched via cold-chain courier within 48 business hours.',
                  isLoading: state.isLoading,
                  isFormValid: state.isFormValid,
                  onCancel: () => Navigator.of(context).pop(),
                  onSubmit: () => context
                      .read<B2bRequestBloc>()
                      .add(const SubmitB2bSampleRequestEvent()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
