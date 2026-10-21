import 'package:equatable/equatable.dart';
import '../../domain/models/collaboration_content_model.dart';

enum CollaborationsStatus { idle, loading, loaded, success, failed }

class CollaborationsState extends Equatable {
  final CollaborationsStatus status;
  final CollaborationContentModel? content;
  final String name;
  final String email;
  final String organization;
  final String partnershipTrack;
  final String message;
  final String? trackingId;
  final String? errorMessage;

  const CollaborationsState({
    this.status = CollaborationsStatus.idle,
    this.content,
    this.name = '',
    this.email = '',
    this.organization = '',
    this.partnershipTrack = 'FMCG Product Integration',
    this.message = '',
    this.trackingId,
    this.errorMessage,
  });

  bool get isIdle => status == CollaborationsStatus.idle;
  bool get isLoading => status == CollaborationsStatus.loading;
  bool get isLoaded => status == CollaborationsStatus.loaded;
  bool get isSuccess => status == CollaborationsStatus.success;
  bool get isFailed => status == CollaborationsStatus.failed;

  bool get isNameValid => name.trim().length >= 2;
  bool get isEmailValid =>
      email.trim().isNotEmpty && email.contains('@') && email.contains('.');
  bool get isTrackValid => partnershipTrack.trim().isNotEmpty;
  bool get isMessageValid => message.trim().length >= 10;

  bool get isFormValid =>
      isNameValid && isEmailValid && isTrackValid && isMessageValid;

  CollaborationsState copyWith({
    CollaborationsStatus? status,
    CollaborationContentModel? content,
    String? name,
    String? email,
    String? organization,
    String? partnershipTrack,
    String? message,
    String? trackingId,
    bool clearTrackingId = false,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return CollaborationsState(
      status: status ?? this.status,
      content: content ?? this.content,
      name: name ?? this.name,
      email: email ?? this.email,
      organization: organization ?? this.organization,
      partnershipTrack: partnershipTrack ?? this.partnershipTrack,
      message: message ?? this.message,
      trackingId: clearTrackingId ? null : (trackingId ?? this.trackingId),
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        status,
        content,
        name,
        email,
        organization,
        partnershipTrack,
        message,
        trackingId,
        errorMessage,
      ];
}
