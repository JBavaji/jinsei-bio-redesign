/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ClinicalQualityAssurance extends _i1.SerializableEntity {
  ClinicalQualityAssurance._({
    required this.title,
    required this.description,
    required this.badgeText,
    required this.complianceStandard,
  });

  factory ClinicalQualityAssurance({
    required String title,
    required String description,
    required String badgeText,
    required String complianceStandard,
  }) = _ClinicalQualityAssuranceImpl;

  factory ClinicalQualityAssurance.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ClinicalQualityAssurance(
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      badgeText: serializationManager
          .deserialize<String>(jsonSerialization['badgeText']),
      complianceStandard: serializationManager
          .deserialize<String>(jsonSerialization['complianceStandard']),
    );
  }

  String title;

  String description;

  String badgeText;

  String complianceStandard;

  ClinicalQualityAssurance copyWith({
    String? title,
    String? description,
    String? badgeText,
    String? complianceStandard,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'badgeText': badgeText,
      'complianceStandard': complianceStandard,
    };
  }
}

class _ClinicalQualityAssuranceImpl extends ClinicalQualityAssurance {
  _ClinicalQualityAssuranceImpl({
    required String title,
    required String description,
    required String badgeText,
    required String complianceStandard,
  }) : super._(
          title: title,
          description: description,
          badgeText: badgeText,
          complianceStandard: complianceStandard,
        );

  @override
  ClinicalQualityAssurance copyWith({
    String? title,
    String? description,
    String? badgeText,
    String? complianceStandard,
  }) {
    return ClinicalQualityAssurance(
      title: title ?? this.title,
      description: description ?? this.description,
      badgeText: badgeText ?? this.badgeText,
      complianceStandard: complianceStandard ?? this.complianceStandard,
    );
  }
}
