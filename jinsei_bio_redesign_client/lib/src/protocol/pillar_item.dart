/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PillarItem extends _i1.SerializableEntity {
  PillarItem._({
    this.id,
    required this.iconKey,
    required this.title,
    required this.description,
    required this.displayOrder,
  });

  factory PillarItem({
    int? id,
    required String iconKey,
    required String title,
    required String description,
    required int displayOrder,
  }) = _PillarItemImpl;

  factory PillarItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PillarItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
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

  String description;

  int displayOrder;

  PillarItem copyWith({
    int? id,
    String? iconKey,
    String? title,
    String? description,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'title': title,
      'description': description,
      'displayOrder': displayOrder,
    };
  }
}

class _Undefined {}

class _PillarItemImpl extends PillarItem {
  _PillarItemImpl({
    int? id,
    required String iconKey,
    required String title,
    required String description,
    required int displayOrder,
  }) : super._(
          id: id,
          iconKey: iconKey,
          title: title,
          description: description,
          displayOrder: displayOrder,
        );

  @override
  PillarItem copyWith({
    Object? id = _Undefined,
    String? iconKey,
    String? title,
    String? description,
    int? displayOrder,
  }) {
    return PillarItem(
      id: id is int? ? id : this.id,
      iconKey: iconKey ?? this.iconKey,
      title: title ?? this.title,
      description: description ?? this.description,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
