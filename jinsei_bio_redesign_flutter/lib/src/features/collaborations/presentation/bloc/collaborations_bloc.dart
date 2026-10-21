import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/collaboration_inquiry_model.dart';
import '../../domain/repositories/i_collaborations_repository.dart';
import 'collaborations_event.dart';
import 'collaborations_state.dart';

class CollaborationsBloc
    extends Bloc<CollaborationsEvent, CollaborationsState> {
  final ICollaborationsRepository _repository;

  CollaborationsBloc({required ICollaborationsRepository repository})
      : _repository = repository,
        super(const CollaborationsState()) {
    on<LoadCollaborationsContentEvent>(_onLoadContent);
    on<NameChangedEvent>(_onNameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<OrganizationChangedEvent>(_onOrganizationChanged);
    on<PartnershipTrackChangedEvent>(_onTrackChanged);
    on<MessageChangedEvent>(_onMessageChanged);
    on<SubmitCollaborationInquiryEvent>(_onSubmitInquiry);
    on<ResetCollaborationInquiryEvent>(_onResetInquiry);
  }

  Future<void> _onLoadContent(
    LoadCollaborationsContentEvent event,
    Emitter<CollaborationsState> emit,
  ) async {
    emit(state.copyWith(status: CollaborationsStatus.loading));
    try {
      final content = await _repository.getCollaborationsContent();
      emit(state.copyWith(
        status: CollaborationsStatus.loaded,
        content: content,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CollaborationsStatus.failed,
        errorMessage: 'Failed to load collaborations content: $e',
      ));
    }
  }

  void _onNameChanged(
    NameChangedEvent event,
    Emitter<CollaborationsState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  void _onEmailChanged(
    EmailChangedEvent event,
    Emitter<CollaborationsState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onOrganizationChanged(
    OrganizationChangedEvent event,
    Emitter<CollaborationsState> emit,
  ) {
    emit(state.copyWith(organization: event.organization));
  }

  void _onTrackChanged(
    PartnershipTrackChangedEvent event,
    Emitter<CollaborationsState> emit,
  ) {
    emit(state.copyWith(partnershipTrack: event.partnershipTrack));
  }

  void _onMessageChanged(
    MessageChangedEvent event,
    Emitter<CollaborationsState> emit,
  ) {
    emit(state.copyWith(message: event.message));
  }

  Future<void> _onSubmitInquiry(
    SubmitCollaborationInquiryEvent event,
    Emitter<CollaborationsState> emit,
  ) async {
    if (!state.isFormValid) {
      emit(state.copyWith(
        status: CollaborationsStatus.failed,
        errorMessage:
            'Please fill all required fields: valid name, institutional email, and collaboration message.',
      ));
      return;
    }

    emit(state.copyWith(status: CollaborationsStatus.loading));

    final inquiry = CollaborationInquiryModel(
      name: state.name.trim(),
      email: state.email.trim(),
      organization: state.organization.trim().isNotEmpty
          ? state.organization.trim()
          : null,
      partnershipTrack: state.partnershipTrack,
      message: state.message.trim(),
      submittedAt: DateTime.now(),
      status: 'pending_review',
    );

    try {
      final trackingId = await _repository.submitCollaborationInquiry(inquiry);
      emit(state.copyWith(
        status: CollaborationsStatus.success,
        trackingId: trackingId,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CollaborationsStatus.failed,
        errorMessage: 'Collaboration inquiry transmission failed: $e',
      ));
    }
  }

  void _onResetInquiry(
    ResetCollaborationInquiryEvent event,
    Emitter<CollaborationsState> emit,
  ) {
    emit(state.copyWith(
      status: CollaborationsStatus.loaded,
      name: '',
      email: '',
      organization: '',
      message: '',
      clearErrorMessage: true,
      clearTrackingId: true,
    ));
  }
}
