/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ExecutiveStat extends _i1.SerializableEntity {
  ExecutiveStat._({
    this.id,
    required this.iconKey,
    required this.title,
    required this.subtitle,
    required this.displayOrder,
  });

  factory ExecutiveStat({
    int? id,
    required String iconKey,
    required String title,
    required String subtitle,
    required int displayOrder,
  }) = _ExecutiveStatImpl;

  factory ExecutiveStat.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ExecutiveStat(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String iconKey;

  String title;

  String subtitle;

  int displayOrder;

  ExecutiveStat copyWith({
    int? id,
    String? iconKey,
    String? title,
    String? subtitle,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'title': title,
      'subtitle': subtitle,
      'displayOrder': displayOrder,
    };
  }
}

class _Undefined {}

class _ExecutiveStatImpl extends ExecutiveStat {
  _ExecutiveStatImpl({
    int? id,
    required String iconKey,
    required String title,
    required String subtitle,
    required int displayOrder,
  }) : super._(
          id: id,
          iconKey: iconKey,
          title: title,
          subtitle: subtitle,
          displayOrder: displayOrder,
        );

  @override
  ExecutiveStat copyWith({
    Object? id = _Undefined,
    String? iconKey,
    String? title,
    String? subtitle,
    int? displayOrder,
  }) {
    return ExecutiveStat(
      id: id is int? ? id : this.id,
      iconKey: iconKey ?? this.iconKey,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
