/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ScienceStep extends _i1.SerializableEntity {
  ScienceStep._({
    this.id,
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.iconKey,
    required this.metricValue,
    required this.metricLabel,
    required this.imageUrl,
    required this.displayOrder,
  });

  factory ScienceStep({
    int? id,
    required int stepNumber,
    required String title,
    required String subtitle,
    required String description,
    required String category,
    required String iconKey,
    required String metricValue,
    required String metricLabel,
    required String imageUrl,
    required int displayOrder,
  }) = _ScienceStepImpl;

  factory ScienceStep.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScienceStep(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      stepNumber: serializationManager
          .deserialize<int>(jsonSerialization['stepNumber']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      metricValue: serializationManager
          .deserialize<String>(jsonSerialization['metricValue']),
      metricLabel: serializationManager
          .deserialize<String>(jsonSerialization['metricLabel']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int stepNumber;

  String title;

  String subtitle;

  String description;

  String category;

  String iconKey;

  String metricValue;

  String metricLabel;

  String imageUrl;

  int displayOrder;

  ScienceStep copyWith({
    int? id,
    int? stepNumber,
    String? title,
    String? subtitle,
    String? description,
    String? category,
    String? iconKey,
    String? metricValue,
    String? metricLabel,
    String? imageUrl,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'stepNumber': stepNumber,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'category': category,
      'iconKey': iconKey,
      'metricValue': metricValue,
      'metricLabel': metricLabel,
      'imageUrl': imageUrl,
      'displayOrder': displayOrder,
    };
  }
}

class _Undefined {}

class _ScienceStepImpl extends ScienceStep {
  _ScienceStepImpl({
    int? id,
    required int stepNumber,
    required String title,
    required String subtitle,
    required String description,
    required String category,
    required String iconKey,
    required String metricValue,
    required String metricLabel,
    required String imageUrl,
    required int displayOrder,
  }) : super._(
          id: id,
          stepNumber: stepNumber,
          title: title,
          subtitle: subtitle,
          description: description,
          category: category,
          iconKey: iconKey,
          metricValue: metricValue,
          metricLabel: metricLabel,
          imageUrl: imageUrl,
          displayOrder: displayOrder,
        );

  @override
  ScienceStep copyWith({
    Object? id = _Undefined,
    int? stepNumber,
    String? title,
    String? subtitle,
    String? description,
    String? category,
    String? iconKey,
    String? metricValue,
    String? metricLabel,
    String? imageUrl,
    int? displayOrder,
  }) {
    return ScienceStep(
      id: id is int? ? id : this.id,
      stepNumber: stepNumber ?? this.stepNumber,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      category: category ?? this.category,
      iconKey: iconKey ?? this.iconKey,
      metricValue: metricValue ?? this.metricValue,
      metricLabel: metricLabel ?? this.metricLabel,
      imageUrl: imageUrl ?? this.imageUrl,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
