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
    required this.iconKey,
    required this.title,
    required this.subtitle,
  });

  factory ExecutiveStat({
    required String iconKey,
    required String title,
    required String subtitle,
  }) = _ExecutiveStatImpl;

  factory ExecutiveStat.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ExecutiveStat(
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
    );
  }

  String iconKey;

  String title;

  String subtitle;

  ExecutiveStat copyWith({
    String? iconKey,
    String? title,
    String? subtitle,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'iconKey': iconKey,
      'title': title,
      'subtitle': subtitle,
    };
  }
}

class _ExecutiveStatImpl extends ExecutiveStat {
  _ExecutiveStatImpl({
    required String iconKey,
    required String title,
    required String subtitle,
  }) : super._(
          iconKey: iconKey,
          title: title,
          subtitle: subtitle,
        );

  @override
  ExecutiveStat copyWith({
    String? iconKey,
    String? title,
    String? subtitle,
  }) {
    return ExecutiveStat(
      iconKey: iconKey ?? this.iconKey,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }
}
