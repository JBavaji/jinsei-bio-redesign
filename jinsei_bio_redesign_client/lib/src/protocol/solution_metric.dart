/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SolutionMetric extends _i1.SerializableEntity {
  SolutionMetric._({
    this.id,
    required this.iconKey,
    required this.value,
    required this.label,
    required this.accentColorHex,
    required this.displayOrder,
  });

  factory SolutionMetric({
    int? id,
    required String iconKey,
    required String value,
    required String label,
    required String accentColorHex,
    required int displayOrder,
  }) = _SolutionMetricImpl;

  factory SolutionMetric.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SolutionMetric(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      value:
          serializationManager.deserialize<String>(jsonSerialization['value']),
      label:
          serializationManager.deserialize<String>(jsonSerialization['label']),
      accentColorHex: serializationManager
          .deserialize<String>(jsonSerialization['accentColorHex']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String iconKey;

  String value;

  String label;

  String accentColorHex;

  int displayOrder;

  SolutionMetric copyWith({
    int? id,
    String? iconKey,
    String? value,
    String? label,
    String? accentColorHex,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'value': value,
      'label': label,
      'accentColorHex': accentColorHex,
      'displayOrder': displayOrder,
    };
  }
}

class _Undefined {}

class _SolutionMetricImpl extends SolutionMetric {
  _SolutionMetricImpl({
    int? id,
    required String iconKey,
    required String value,
    required String label,
    required String accentColorHex,
    required int displayOrder,
  }) : super._(
          id: id,
          iconKey: iconKey,
          value: value,
          label: label,
          accentColorHex: accentColorHex,
          displayOrder: displayOrder,
        );

  @override
  SolutionMetric copyWith({
    Object? id = _Undefined,
    String? iconKey,
    String? value,
    String? label,
    String? accentColorHex,
    int? displayOrder,
  }) {
    return SolutionMetric(
      id: id is int? ? id : this.id,
      iconKey: iconKey ?? this.iconKey,
      value: value ?? this.value,
      label: label ?? this.label,
      accentColorHex: accentColorHex ?? this.accentColorHex,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
