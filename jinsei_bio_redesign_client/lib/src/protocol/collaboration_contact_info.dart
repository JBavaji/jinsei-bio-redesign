/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class CollaborationContactInfo extends _i1.SerializableEntity {
  CollaborationContactInfo._({
    required this.supportEmail,
    required this.supportNotice,
    required this.facilityName,
    required this.facilityAddress,
    required this.facilityCoordinates,
    required this.visitingTimings,
    required this.visitingStatus,
    required this.standards,
  });

  factory CollaborationContactInfo({
    required String supportEmail,
    required String supportNotice,
    required String facilityName,
    required String facilityAddress,
    required String facilityCoordinates,
    required String visitingTimings,
    required String visitingStatus,
    required List<_i2.CollaborationComplianceStandard> standards,
  }) = _CollaborationContactInfoImpl;

  factory CollaborationContactInfo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CollaborationContactInfo(
      supportEmail: serializationManager
          .deserialize<String>(jsonSerialization['supportEmail']),
      supportNotice: serializationManager
          .deserialize<String>(jsonSerialization['supportNotice']),
      facilityName: serializationManager
          .deserialize<String>(jsonSerialization['facilityName']),
      facilityAddress: serializationManager
          .deserialize<String>(jsonSerialization['facilityAddress']),
      facilityCoordinates: serializationManager
          .deserialize<String>(jsonSerialization['facilityCoordinates']),
      visitingTimings: serializationManager
          .deserialize<String>(jsonSerialization['visitingTimings']),
      visitingStatus: serializationManager
          .deserialize<String>(jsonSerialization['visitingStatus']),
      standards: serializationManager
          .deserialize<List<_i2.CollaborationComplianceStandard>>(
              jsonSerialization['standards']),
    );
  }

  String supportEmail;

  String supportNotice;

  String facilityName;

  String facilityAddress;

  String facilityCoordinates;

  String visitingTimings;

  String visitingStatus;

  List<_i2.CollaborationComplianceStandard> standards;

  CollaborationContactInfo copyWith({
    String? supportEmail,
    String? supportNotice,
    String? facilityName,
    String? facilityAddress,
    String? facilityCoordinates,
    String? visitingTimings,
    String? visitingStatus,
    List<_i2.CollaborationComplianceStandard>? standards,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'supportEmail': supportEmail,
      'supportNotice': supportNotice,
      'facilityName': facilityName,
      'facilityAddress': facilityAddress,
      'facilityCoordinates': facilityCoordinates,
      'visitingTimings': visitingTimings,
      'visitingStatus': visitingStatus,
      'standards': standards.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}

class _CollaborationContactInfoImpl extends CollaborationContactInfo {
  _CollaborationContactInfoImpl({
    required String supportEmail,
    required String supportNotice,
    required String facilityName,
    required String facilityAddress,
    required String facilityCoordinates,
    required String visitingTimings,
    required String visitingStatus,
    required List<_i2.CollaborationComplianceStandard> standards,
  }) : super._(
          supportEmail: supportEmail,
          supportNotice: supportNotice,
          facilityName: facilityName,
          facilityAddress: facilityAddress,
          facilityCoordinates: facilityCoordinates,
          visitingTimings: visitingTimings,
          visitingStatus: visitingStatus,
          standards: standards,
        );

  @override
  CollaborationContactInfo copyWith({
    String? supportEmail,
    String? supportNotice,
    String? facilityName,
    String? facilityAddress,
    String? facilityCoordinates,
    String? visitingTimings,
    String? visitingStatus,
    List<_i2.CollaborationComplianceStandard>? standards,
  }) {
    return CollaborationContactInfo(
      supportEmail: supportEmail ?? this.supportEmail,
      supportNotice: supportNotice ?? this.supportNotice,
      facilityName: facilityName ?? this.facilityName,
      facilityAddress: facilityAddress ?? this.facilityAddress,
      facilityCoordinates: facilityCoordinates ?? this.facilityCoordinates,
      visitingTimings: visitingTimings ?? this.visitingTimings,
      visitingStatus: visitingStatus ?? this.visitingStatus,
      standards: standards ?? this.standards.clone(),
    );
  }
}
