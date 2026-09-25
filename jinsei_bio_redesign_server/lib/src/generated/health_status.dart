/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class HealthStatusResponse extends _i1.SerializableEntity {
  HealthStatusResponse._({
    required this.status,
    required this.service,
    required this.version,
    required this.database,
    required this.appMode,
    required this.timestamp,
  });

  factory HealthStatusResponse({
    required String status,
    required String service,
    required String version,
    required String database,
    required String appMode,
    required DateTime timestamp,
  }) = _HealthStatusResponseImpl;

  factory HealthStatusResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return HealthStatusResponse(
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      service: serializationManager
          .deserialize<String>(jsonSerialization['service']),
      version: serializationManager
          .deserialize<String>(jsonSerialization['version']),
      database: serializationManager
          .deserialize<String>(jsonSerialization['database']),
      appMode: serializationManager
          .deserialize<String>(jsonSerialization['appMode']),
      timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['timestamp']),
    );
  }

  String status;

  String service;

  String version;

  String database;

  String appMode;

  DateTime timestamp;

  HealthStatusResponse copyWith({
    String? status,
    String? service,
    String? version,
    String? database,
    String? appMode,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'service': service,
      'version': version,
      'database': database,
      'appMode': appMode,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'status': status,
      'service': service,
      'version': version,
      'database': database,
      'appMode': appMode,
      'timestamp': timestamp.toJson(),
    };
  }
}

class _HealthStatusResponseImpl extends HealthStatusResponse {
  _HealthStatusResponseImpl({
    required String status,
    required String service,
    required String version,
    required String database,
    required String appMode,
    required DateTime timestamp,
  }) : super._(
          status: status,
          service: service,
          version: version,
          database: database,
          appMode: appMode,
          timestamp: timestamp,
        );

  @override
  HealthStatusResponse copyWith({
    String? status,
    String? service,
    String? version,
    String? database,
    String? appMode,
    DateTime? timestamp,
  }) {
    return HealthStatusResponse(
      status: status ?? this.status,
      service: service ?? this.service,
      version: version ?? this.version,
      database: database ?? this.database,
      appMode: appMode ?? this.appMode,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
