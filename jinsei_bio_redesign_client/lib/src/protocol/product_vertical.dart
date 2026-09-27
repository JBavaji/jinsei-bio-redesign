/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ProductVertical extends _i1.SerializableEntity {
  ProductVertical._({
    this.id,
    required this.title,
    required this.strainId,
    required this.description,
    required this.displayOrder,
  });

  factory ProductVertical({
    int? id,
    required String title,
    required String strainId,
    required String description,
    required int displayOrder,
  }) = _ProductVerticalImpl;

  factory ProductVertical.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ProductVertical(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      strainId: serializationManager
          .deserialize<String>(jsonSerialization['strainId']),
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

  String title;

  String strainId;

  String description;

  int displayOrder;

  ProductVertical copyWith({
    int? id,
    String? title,
    String? strainId,
    String? description,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'strainId': strainId,
      'description': description,
      'displayOrder': displayOrder,
    };
  }
}

class _Undefined {}

class _ProductVerticalImpl extends ProductVertical {
  _ProductVerticalImpl({
    int? id,
    required String title,
    required String strainId,
    required String description,
    required int displayOrder,
  }) : super._(
          id: id,
          title: title,
          strainId: strainId,
          description: description,
          displayOrder: displayOrder,
        );

  @override
  ProductVertical copyWith({
    Object? id = _Undefined,
    String? title,
    String? strainId,
    String? description,
    int? displayOrder,
  }) {
    return ProductVertical(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      strainId: strainId ?? this.strainId,
      description: description ?? this.description,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
