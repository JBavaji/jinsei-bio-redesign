import 'package:equatable/equatable.dart';

class CollaborationComplianceStandardModel extends Equatable {
  final String title;
  final String description;
  final String badge;

  const CollaborationComplianceStandardModel({
    required this.title,
    required this.description,
    required this.badge,
  });

  factory CollaborationComplianceStandardModel.fromJson(
      Map<String, dynamic> json) {
    return CollaborationComplianceStandardModel(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      badge: json['badge'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'badge': badge,
    };
  }

  @override
  List<Object?> get props => [title, description, badge];
}

class CollaborationContactInfoModel extends Equatable {
  final String supportEmail;
  final String supportNotice;
  final String facilityName;
  final String facilityAddress;
  final String facilityCoordinates;
  final String visitingTimings;
  final String visitingStatus;
  final List<CollaborationComplianceStandardModel> standards;

  const CollaborationContactInfoModel({
    required this.supportEmail,
    required this.supportNotice,
    required this.facilityName,
    required this.facilityAddress,
    required this.facilityCoordinates,
    required this.visitingTimings,
    required this.visitingStatus,
    required this.standards,
  });

  factory CollaborationContactInfoModel.fromJson(Map<String, dynamic> json) {
    return CollaborationContactInfoModel(
      supportEmail: json['supportEmail'] as String? ?? '',
      supportNotice: json['supportNotice'] as String? ?? '',
      facilityName: json['facilityName'] as String? ?? '',
      facilityAddress: json['facilityAddress'] as String? ?? '',
      facilityCoordinates: json['facilityCoordinates'] as String? ?? '',
      visitingTimings: json['visitingTimings'] as String? ?? '',
      visitingStatus: json['visitingStatus'] as String? ?? '',
      standards: (json['standards'] is List
          ? (json['standards'] as List<dynamic>)
              .map((e) => CollaborationComplianceStandardModel.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          : const <CollaborationComplianceStandardModel>[]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'supportEmail': supportEmail,
      'supportNotice': supportNotice,
      'facilityName': facilityName,
      'facilityAddress': facilityAddress,
      'facilityCoordinates': facilityCoordinates,
      'visitingTimings': visitingTimings,
      'visitingStatus': visitingStatus,
      'standards': standards.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        supportEmail,
        supportNotice,
        facilityName,
        facilityAddress,
        facilityCoordinates,
        visitingTimings,
        visitingStatus,
        standards,
      ];
}
