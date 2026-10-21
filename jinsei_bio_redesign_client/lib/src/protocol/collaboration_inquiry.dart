/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class CollaborationInquiry extends _i1.SerializableEntity {
  CollaborationInquiry._({
    this.id,
    required this.name,
    required this.email,
    this.organization,
    required this.partnershipTrack,
    required this.message,
    required this.trackingId,
    required this.submittedAt,
    required this.status,
  });

  factory CollaborationInquiry({
    int? id,
    required String name,
    required String email,
    String? organization,
    required String partnershipTrack,
    required String message,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) = _CollaborationInquiryImpl;

  factory CollaborationInquiry.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CollaborationInquiry(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      organization: serializationManager
          .deserialize<String?>(jsonSerialization['organization']),
      partnershipTrack: serializationManager
          .deserialize<String>(jsonSerialization['partnershipTrack']),
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      trackingId: serializationManager
          .deserialize<String>(jsonSerialization['trackingId']),
      submittedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['submittedAt']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String email;

  String? organization;

  String partnershipTrack;

  String message;

  String trackingId;

  DateTime submittedAt;

  String status;

  CollaborationInquiry copyWith({
    int? id,
    String? name,
    String? email,
    String? organization,
    String? partnershipTrack,
    String? message,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      if (organization != null) 'organization': organization,
      'partnershipTrack': partnershipTrack,
      'message': message,
      'trackingId': trackingId,
      'submittedAt': submittedAt.toJson(),
      'status': status,
    };
  }
}

class _Undefined {}

class _CollaborationInquiryImpl extends CollaborationInquiry {
  _CollaborationInquiryImpl({
    int? id,
    required String name,
    required String email,
    String? organization,
    required String partnershipTrack,
    required String message,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) : super._(
          id: id,
          name: name,
          email: email,
          organization: organization,
          partnershipTrack: partnershipTrack,
          message: message,
          trackingId: trackingId,
          submittedAt: submittedAt,
          status: status,
        );

  @override
  CollaborationInquiry copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    Object? organization = _Undefined,
    String? partnershipTrack,
    String? message,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  }) {
    return CollaborationInquiry(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      organization: organization is String? ? organization : this.organization,
      partnershipTrack: partnershipTrack ?? this.partnershipTrack,
      message: message ?? this.message,
      trackingId: trackingId ?? this.trackingId,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
    );
  }
}
