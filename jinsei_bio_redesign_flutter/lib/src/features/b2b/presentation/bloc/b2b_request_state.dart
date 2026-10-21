import 'package:equatable/equatable.dart';
import '../../domain/models/b2b_modal_content_model.dart';
import '../../domain/models/strain_vertical_option_model.dart';

enum B2bRequestStatus { idle, loading, loaded, success, failed }

class B2bRequestState extends Equatable {
  final B2bRequestStatus status;
  final B2bModalContentModel? content;
  final String selectedStrainId;
  final String selectedFormatId;
  final String fullName;
  final String email;
  final String company;
  final String clinicalScope;
  final String? trackingId;
  final String? errorMessage;

  const B2bRequestState({
    this.status = B2bRequestStatus.idle,
    this.content,
    this.selectedStrainId = '',
    this.selectedFormatId = '',
    this.fullName = '',
    this.email = '',
    this.company = '',
    this.clinicalScope = '',
    this.trackingId,
    this.errorMessage,
  });

  bool get isIdle => status == B2bRequestStatus.idle;
  bool get isLoading => status == B2bRequestStatus.loading;
  bool get isLoaded => status == B2bRequestStatus.loaded;
  bool get isSuccess => status == B2bRequestStatus.success;
  bool get isFailed => status == B2bRequestStatus.failed;

  bool get isFullNameValid => fullName.trim().length >= 2;
  bool get isEmailValid =>
      email.trim().isNotEmpty && email.contains('@') && email.contains('.');
  bool get isCompanyValid => company.trim().length >= 2;
  bool get isStrainValid => selectedStrainId.isNotEmpty;
  bool get isFormatValid => selectedFormatId.isNotEmpty;

  bool get isFormValid =>
      isFullNameValid &&
      isEmailValid &&
      isCompanyValid &&
      isStrainValid &&
      isFormatValid;

  StrainVerticalOptionModel? get selectedStrain {
    if (content == null || content!.strains.isEmpty) return null;
    try {
      return content!.strains.firstWhere((s) => s.strainId == selectedStrainId);
    } catch (_) {
      return content!.strains.first;
    }
  }

  B2bRequestState copyWith({
    B2bRequestStatus? status,
    B2bModalContentModel? content,
    String? selectedStrainId,
    String? selectedFormatId,
    String? fullName,
    String? email,
    String? company,
    String? clinicalScope,
    String? trackingId,
    bool clearTrackingId = false,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return B2bRequestState(
      status: status ?? this.status,
      content: content ?? this.content,
      selectedStrainId: selectedStrainId ?? this.selectedStrainId,
      selectedFormatId: selectedFormatId ?? this.selectedFormatId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      company: company ?? this.company,
      clinicalScope: clinicalScope ?? this.clinicalScope,
      trackingId: clearTrackingId ? null : (trackingId ?? this.trackingId),
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        status,
        content,
        selectedStrainId,
        selectedFormatId,
        fullName,
        email,
        company,
        clinicalScope,
        trackingId,
        errorMessage,
      ];
}
