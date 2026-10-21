/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class B2bSampleRequest extends _i1.SerializableEntity {
  B2bSampleRequest._({
    this.id,
    required this.strainId,
    required this.fullName,
    required this.email,
    required this.company,
    required this.formulationFormat,
    this.clinicalScope,
    required this.trackingId,
    required this.submittedAt,
    required this.status,
  });

  factory B2bSampleRequest({
    int? id,
    required String strainId,
    required String fullName,
    required String email,
    required String company,
    required String formulationFormat,
    String? clinicalScope,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) = _B2bSampleRequestImpl;

  factory B2bSampleRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return B2bSampleRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      strainId: serializationManager
          .deserialize<String>(jsonSerialization['strainId']),
      fullName: serializationManager
          .deserialize<String>(jsonSerialization['fullName']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      company: serializationManager
          .deserialize<String>(jsonSerialization['company']),
      formulationFormat: serializationManager
          .deserialize<String>(jsonSerialization['formulationFormat']),
      clinicalScope: serializationManager
          .deserialize<String?>(jsonSerialization['clinicalScope']),
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

  String strainId;

  String fullName;

  String email;

  String company;

  String formulationFormat;

  String? clinicalScope;

  String trackingId;

  DateTime submittedAt;

  String status;

  B2bSampleRequest copyWith({
    int? id,
    String? strainId,
    String? fullName,
    String? email,
    String? company,
    String? formulationFormat,
    String? clinicalScope,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'strainId': strainId,
      'fullName': fullName,
      'email': email,
      'company': company,
      'formulationFormat': formulationFormat,
      if (clinicalScope != null) 'clinicalScope': clinicalScope,
      'trackingId': trackingId,
      'submittedAt': submittedAt.toJson(),
      'status': status,
    };
  }
}

class _Undefined {}

class _B2bSampleRequestImpl extends B2bSampleRequest {
  _B2bSampleRequestImpl({
    int? id,
    required String strainId,
    required String fullName,
    required String email,
    required String company,
    required String formulationFormat,
    String? clinicalScope,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) : super._(
          id: id,
          strainId: strainId,
          fullName: fullName,
          email: email,
          company: company,
          formulationFormat: formulationFormat,
          clinicalScope: clinicalScope,
          trackingId: trackingId,
          submittedAt: submittedAt,
          status: status,
        );

  @override
  B2bSampleRequest copyWith({
    Object? id = _Undefined,
    String? strainId,
    String? fullName,
    String? email,
    String? company,
    String? formulationFormat,
    Object? clinicalScope = _Undefined,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  }) {
    return B2bSampleRequest(
      id: id is int? ? id : this.id,
      strainId: strainId ?? this.strainId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      company: company ?? this.company,
      formulationFormat: formulationFormat ?? this.formulationFormat,
      clinicalScope:
          clinicalScope is String? ? clinicalScope : this.clinicalScope,
      trackingId: trackingId ?? this.trackingId,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
    );
  }
}
