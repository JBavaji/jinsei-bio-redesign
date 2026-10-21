import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/b2b_sample_request_model.dart';
import '../../domain/repositories/i_b2b_repository.dart';
import 'b2b_request_event.dart';
import 'b2b_request_state.dart';

class B2bRequestBloc extends Bloc<B2bRequestEvent, B2bRequestState> {
  final IB2bRepository _repository;

  B2bRequestBloc({required IB2bRepository repository})
      : _repository = repository,
        super(const B2bRequestState()) {
    on<LoadB2bModalContentEvent>(_onLoadContent);
    on<SelectStrainVerticalEvent>(_onSelectStrain);
    on<FullNameChangedEvent>(_onFullNameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<CompanyChangedEvent>(_onCompanyChanged);
    on<FormulationFormatChangedEvent>(_onFormatChanged);
    on<ClinicalScopeChangedEvent>(_onScopeChanged);
    on<SubmitB2bSampleRequestEvent>(_onSubmitRequest);
    on<ResetB2bRequestFormEvent>(_onResetForm);
  }

  Future<void> _onLoadContent(
    LoadB2bModalContentEvent event,
    Emitter<B2bRequestState> emit,
  ) async {
    emit(state.copyWith(status: B2bRequestStatus.loading));
    try {
      final content = await _repository.getModalContent();
      String initialStrain = event.initialStrainId ?? '';
      if (initialStrain.isEmpty && content.strains.isNotEmpty) {
        initialStrain = content.strains.first.strainId;
      }

      String initialFormat = '';
      if (initialStrain.isNotEmpty) {
        final matchedStrain = content.strains.firstWhere(
          (s) => s.strainId == initialStrain,
          orElse: () => content.strains.first,
        );
        initialFormat = matchedStrain.defaultFormat;
      } else if (content.formulationFormats.isNotEmpty) {
        initialFormat = content.formulationFormats.first.formatId;
      }

      emit(state.copyWith(
        status: B2bRequestStatus.loaded,
        content: content,
        selectedStrainId: initialStrain,
        selectedFormatId: initialFormat,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: B2bRequestStatus.failed,
        errorMessage: 'Failed to load formulation specifications: $e',
      ));
    }
  }

  void _onSelectStrain(
    SelectStrainVerticalEvent event,
    Emitter<B2bRequestState> emit,
  ) {
    String formatId = state.selectedFormatId;
    if (state.content != null) {
      try {
        final matchedStrain = state.content!.strains
            .firstWhere((s) => s.strainId == event.strainId);
        formatId = matchedStrain.defaultFormat;
      } catch (_) {}
    }

    emit(state.copyWith(
      selectedStrainId: event.strainId,
      selectedFormatId: formatId,
    ));
  }

  void _onFullNameChanged(
    FullNameChangedEvent event,
    Emitter<B2bRequestState> emit,
  ) {
    emit(state.copyWith(fullName: event.fullName));
  }

  void _onEmailChanged(
    EmailChangedEvent event,
    Emitter<B2bRequestState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onCompanyChanged(
    CompanyChangedEvent event,
    Emitter<B2bRequestState> emit,
  ) {
    emit(state.copyWith(company: event.company));
  }

  void _onFormatChanged(
    FormulationFormatChangedEvent event,
    Emitter<B2bRequestState> emit,
  ) {
    emit(state.copyWith(selectedFormatId: event.formatId));
  }

  void _onScopeChanged(
    ClinicalScopeChangedEvent event,
    Emitter<B2bRequestState> emit,
  ) {
    emit(state.copyWith(clinicalScope: event.scope));
  }

  Future<void> _onSubmitRequest(
    SubmitB2bSampleRequestEvent event,
    Emitter<B2bRequestState> emit,
  ) async {
    if (!state.isFormValid) {
      emit(state.copyWith(
        status: B2bRequestStatus.failed,
        errorMessage:
            'Please fill all required scientific title, institutional email, and organization details.',
      ));
      return;
    }

    emit(state.copyWith(status: B2bRequestStatus.loading));

    final request = B2bSampleRequestModel(
      strainId: state.selectedStrainId,
      fullName: state.fullName.trim(),
      email: state.email.trim(),
      company: state.company.trim(),
      formulationFormat: state.selectedFormatId,
      clinicalScope: state.clinicalScope.trim().isNotEmpty
          ? state.clinicalScope.trim()
          : null,
      submittedAt: DateTime.now(),
      status: 'submitted',
    );

    try {
      final trackingId = await _repository.submitSampleRequest(request);
      emit(state.copyWith(
        status: B2bRequestStatus.success,
        trackingId: trackingId,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: B2bRequestStatus.failed,
        errorMessage: 'Sample request transmission failed: $e',
      ));
    }
  }

  void _onResetForm(
    ResetB2bRequestFormEvent event,
    Emitter<B2bRequestState> emit,
  ) {
    emit(state.copyWith(
      status: B2bRequestStatus.loaded,
      fullName: '',
      email: '',
      company: '',
      clinicalScope: '',
      clearErrorMessage: true,
      clearTrackingId: true,
    ));
  }
}
