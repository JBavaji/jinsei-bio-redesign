import 'package:equatable/equatable.dart';

class B2bSampleRequestModel extends Equatable {
  final String strainId;
  final String fullName;
  final String email;
  final String company;
  final String formulationFormat;
  final String? clinicalScope;
  final String trackingId;
  final DateTime? submittedAt;
  final String status;

  const B2bSampleRequestModel({
    required this.strainId,
    required this.fullName,
    required this.email,
    required this.company,
    required this.formulationFormat,
    this.clinicalScope,
    this.trackingId = '',
    this.submittedAt,
    this.status = 'pending',
  });

  factory B2bSampleRequestModel.fromJson(Map<String, dynamic> json) {
    return B2bSampleRequestModel(
      strainId: json['strainId'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      company: json['company'] as String? ?? '',
      formulationFormat: json['formulationFormat'] as String? ?? '',
      clinicalScope: json['clinicalScope'] as String?,
      trackingId: json['trackingId'] as String? ?? '',
      submittedAt: json['submittedAt'] != null
          ? DateTime.tryParse(json['submittedAt'] as String)
          : null,
      status: json['status'] as String? ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strainId': strainId,
      'fullName': fullName,
      'email': email,
      'company': company,
      'formulationFormat': formulationFormat,
      'clinicalScope': clinicalScope,
      'trackingId': trackingId,
      'submittedAt': submittedAt?.toIso8601String(),
      'status': status,
    };
  }

  B2bSampleRequestModel copyWith({
    String? strainId,
    String? fullName,
    String? email,
    String? company,
    String? formulationFormat,
    String? clinicalScope,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  }) {
    return B2bSampleRequestModel(
      strainId: strainId ?? this.strainId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      company: company ?? this.company,
      formulationFormat: formulationFormat ?? this.formulationFormat,
      clinicalScope: clinicalScope ?? this.clinicalScope,
      trackingId: trackingId ?? this.trackingId,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        strainId,
        fullName,
        email,
        company,
        formulationFormat,
        clinicalScope,
        trackingId,
        submittedAt,
        status,
      ];
}
