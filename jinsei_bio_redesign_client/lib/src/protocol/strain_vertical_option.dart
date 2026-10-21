/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class StrainVerticalOption extends _i1.SerializableEntity {
  StrainVerticalOption._({
    required this.strainId,
    required this.category,
    required this.name,
    required this.strainCode,
    required this.highlight,
    required this.defaultFormat,
    required this.displayOrder,
  });

  factory StrainVerticalOption({
    required String strainId,
    required String category,
    required String name,
    required String strainCode,
    required String highlight,
    required String defaultFormat,
    required int displayOrder,
  }) = _StrainVerticalOptionImpl;

  factory StrainVerticalOption.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return StrainVerticalOption(
      strainId: serializationManager
          .deserialize<String>(jsonSerialization['strainId']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      strainCode: serializationManager
          .deserialize<String>(jsonSerialization['strainCode']),
      highlight: serializationManager
          .deserialize<String>(jsonSerialization['highlight']),
      defaultFormat: serializationManager
          .deserialize<String>(jsonSerialization['defaultFormat']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  String strainId;

  String category;

  String name;

  String strainCode;

  String highlight;

  String defaultFormat;

  int displayOrder;

  StrainVerticalOption copyWith({
    String? strainId,
    String? category,
    String? name,
    String? strainCode,
    String? highlight,
    String? defaultFormat,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'strainId': strainId,
      'category': category,
      'name': name,
      'strainCode': strainCode,
      'highlight': highlight,
      'defaultFormat': defaultFormat,
      'displayOrder': displayOrder,
    };
  }
}

class _StrainVerticalOptionImpl extends StrainVerticalOption {
  _StrainVerticalOptionImpl({
    required String strainId,
    required String category,
    required String name,
    required String strainCode,
    required String highlight,
    required String defaultFormat,
    required int displayOrder,
  }) : super._(
          strainId: strainId,
          category: category,
          name: name,
          strainCode: strainCode,
          highlight: highlight,
          defaultFormat: defaultFormat,
          displayOrder: displayOrder,
        );

  @override
  StrainVerticalOption copyWith({
    String? strainId,
    String? category,
    String? name,
    String? strainCode,
    String? highlight,
    String? defaultFormat,
    int? displayOrder,
  }) {
    return StrainVerticalOption(
      strainId: strainId ?? this.strainId,
      category: category ?? this.category,
      name: name ?? this.name,
      strainCode: strainCode ?? this.strainCode,
      highlight: highlight ?? this.highlight,
      defaultFormat: defaultFormat ?? this.defaultFormat,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
