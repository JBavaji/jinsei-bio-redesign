import 'package:flutter_bloc/flutter_bloc.dart';
import 'b2b_form_event.dart';
import 'b2b_form_state.dart';

class B2bFormBloc extends Bloc<B2bFormEvent, B2bFormState> {
  B2bFormBloc() : super(const B2bFormState()) {
    on<FullNameChangedEvent>(_onFullNameChanged);
    on<CompanyChangedEvent>(_onCompanyChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<InquiryClassificationChangedEvent>(_onClassificationChanged);
    on<SubmitB2bFormEvent>(_onSubmit);
    on<ResetB2bFormEvent>(_onReset);
  }

  void _onFullNameChanged(
    FullNameChangedEvent event,
    Emitter<B2bFormState> emit,
  ) {
    emit(state.copyWith(
      fullName: event.fullName,
      status: B2bFormStatus.initial,
    ));
  }

  void _onCompanyChanged(
    CompanyChangedEvent event,
    Emitter<B2bFormState> emit,
  ) {
    emit(state.copyWith(
      company: event.company,
      status: B2bFormStatus.initial,
    ));
  }

  void _onEmailChanged(
    EmailChangedEvent event,
    Emitter<B2bFormState> emit,
  ) {
    emit(state.copyWith(
      email: event.email,
      status: B2bFormStatus.initial,
    ));
  }

  void _onClassificationChanged(
    InquiryClassificationChangedEvent event,
    Emitter<B2bFormState> emit,
  ) {
    emit(state.copyWith(
      classification: event.classification,
      status: B2bFormStatus.initial,
    ));
  }

  Future<void> _onSubmit(
    SubmitB2bFormEvent event,
    Emitter<B2bFormState> emit,
  ) async {
    if (!state.isValid) {
      emit(state.copyWith(
        status: B2bFormStatus.failure,
        errorMessage:
            'Please fill in all required fields with a valid email address.',
      ));
      return;
    }

    emit(state.copyWith(status: B2bFormStatus.submitting));

    // Simulated network delay for sandbox submission
    await Future.delayed(const Duration(milliseconds: 1200));

    emit(state.copyWith(status: B2bFormStatus.success));
  }

  void _onReset(
    ResetB2bFormEvent event,
    Emitter<B2bFormState> emit,
  ) {
    emit(const B2bFormState());
  }
}
