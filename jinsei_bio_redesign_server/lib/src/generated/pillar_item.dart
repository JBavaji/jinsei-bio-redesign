/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class PillarItem extends _i1.SerializableEntity {
  PillarItem._({
    required this.iconKey,
    required this.title,
    required this.description,
  });

  factory PillarItem({
    required String iconKey,
    required String title,
    required String description,
  }) = _PillarItemImpl;

  factory PillarItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PillarItem(
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
    );
  }

  String iconKey;

  String title;

  String description;

  PillarItem copyWith({
    String? iconKey,
    String? title,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'iconKey': iconKey,
      'title': title,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'iconKey': iconKey,
      'title': title,
      'description': description,
    };
  }
}

class _PillarItemImpl extends PillarItem {
  _PillarItemImpl({
    required String iconKey,
    required String title,
    required String description,
  }) : super._(
          iconKey: iconKey,
          title: title,
          description: description,
        );

  @override
  PillarItem copyWith({
    String? iconKey,
    String? title,
    String? description,
  }) {
    return PillarItem(
      iconKey: iconKey ?? this.iconKey,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
