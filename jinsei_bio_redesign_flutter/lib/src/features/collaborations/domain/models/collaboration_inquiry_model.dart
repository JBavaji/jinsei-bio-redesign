import 'package:equatable/equatable.dart';

class CollaborationInquiryModel extends Equatable {
  final String name;
  final String email;
  final String? organization;
  final String partnershipTrack;
  final String message;
  final String trackingId;
  final DateTime? submittedAt;
  final String status;

  const CollaborationInquiryModel({
    required this.name,
    required this.email,
    this.organization,
    required this.partnershipTrack,
    required this.message,
    this.trackingId = '',
    this.submittedAt,
    this.status = 'pending_review',
  });

  factory CollaborationInquiryModel.fromJson(Map<String, dynamic> json) {
    return CollaborationInquiryModel(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      organization: json['organization'] as String?,
      partnershipTrack: json['partnershipTrack'] as String? ?? '',
      message: json['message'] as String? ?? '',
      trackingId: json['trackingId'] as String? ?? '',
      submittedAt: json['submittedAt'] != null
          ? DateTime.tryParse(json['submittedAt'].toString())
          : null,
      status: json['status'] as String? ?? 'pending_review',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'organization': organization,
      'partnershipTrack': partnershipTrack,
      'message': message,
      'trackingId': trackingId,
      'submittedAt': submittedAt?.toIso8601String(),
      'status': status,
    };
  }

  CollaborationInquiryModel copyWith({
    String? name,
    String? email,
    String? organization,
    String? partnershipTrack,
    String? message,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  }) {
    return CollaborationInquiryModel(
      name: name ?? this.name,
      email: email ?? this.email,
      organization: organization ?? this.organization,
      partnershipTrack: partnershipTrack ?? this.partnershipTrack,
      message: message ?? this.message,
      trackingId: trackingId ?? this.trackingId,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        organization,
        partnershipTrack,
        message,
        trackingId,
        submittedAt,
        status,
      ];
}
