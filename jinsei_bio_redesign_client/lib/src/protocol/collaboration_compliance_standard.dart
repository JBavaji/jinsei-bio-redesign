/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class CollaborationComplianceStandard extends _i1.SerializableEntity {
  CollaborationComplianceStandard._({
    required this.title,
    required this.description,
    required this.badge,
  });

  factory CollaborationComplianceStandard({
    required String title,
    required String description,
    required String badge,
  }) = _CollaborationComplianceStandardImpl;

  factory CollaborationComplianceStandard.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CollaborationComplianceStandard(
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      badge:
          serializationManager.deserialize<String>(jsonSerialization['badge']),
    );
  }

  String title;

  String description;

  String badge;

  CollaborationComplianceStandard copyWith({
    String? title,
    String? description,
    String? badge,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'badge': badge,
    };
  }
}

class _CollaborationComplianceStandardImpl
    extends CollaborationComplianceStandard {
  _CollaborationComplianceStandardImpl({
    required String title,
    required String description,
    required String badge,
  }) : super._(
          title: title,
          description: description,
          badge: badge,
        );

  @override
  CollaborationComplianceStandard copyWith({
    String? title,
    String? description,
    String? badge,
  }) {
    return CollaborationComplianceStandard(
      title: title ?? this.title,
      description: description ?? this.description,
      badge: badge ?? this.badge,
    );
  }
}
