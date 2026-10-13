/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SolutionCard extends _i1.SerializableEntity {
  SolutionCard._({
    this.id,
    required this.solutionId,
    required this.categoryTag,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconKey,
    required this.category,
    required this.formulationCount,
    required this.keyBenefit,
    required this.efficacyMetric,
    required this.bulletPoints,
    required this.actionCtaText,
    required this.caseStudyUrl,
    this.imageUrl,
    this.darkImageUrl,
    this.lightImageUrl,
    required this.displayOrder,
  });

  factory SolutionCard({
    int? id,
    required String solutionId,
    required String categoryTag,
    required String title,
    required String subtitle,
    required String description,
    required String iconKey,
    required String category,
    required String formulationCount,
    required String keyBenefit,
    required String efficacyMetric,
    required List<String> bulletPoints,
    required String actionCtaText,
    required String caseStudyUrl,
    String? imageUrl,
    String? darkImageUrl,
    String? lightImageUrl,
    required int displayOrder,
  }) = _SolutionCardImpl;

  factory SolutionCard.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SolutionCard(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      solutionId: serializationManager
          .deserialize<String>(jsonSerialization['solutionId']),
      categoryTag: serializationManager
          .deserialize<String>(jsonSerialization['categoryTag']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      formulationCount: serializationManager
          .deserialize<String>(jsonSerialization['formulationCount']),
      keyBenefit: serializationManager
          .deserialize<String>(jsonSerialization['keyBenefit']),
      efficacyMetric: serializationManager
          .deserialize<String>(jsonSerialization['efficacyMetric']),
      bulletPoints: serializationManager
          .deserialize<List<String>>(jsonSerialization['bulletPoints']),
      actionCtaText: serializationManager
          .deserialize<String>(jsonSerialization['actionCtaText']),
      caseStudyUrl: serializationManager
          .deserialize<String>(jsonSerialization['caseStudyUrl']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      darkImageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['darkImageUrl']),
      lightImageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['lightImageUrl']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String solutionId;

  String categoryTag;

  String title;

  String subtitle;

  String description;

  String iconKey;

  String category;

  String formulationCount;

  String keyBenefit;

  String efficacyMetric;

  List<String> bulletPoints;

  String actionCtaText;

  String caseStudyUrl;

  String? imageUrl;

  String? darkImageUrl;

  String? lightImageUrl;

  int displayOrder;

  SolutionCard copyWith({
    int? id,
    String? solutionId,
    String? categoryTag,
    String? title,
    String? subtitle,
    String? description,
    String? iconKey,
    String? category,
    String? formulationCount,
    String? keyBenefit,
    String? efficacyMetric,
    List<String>? bulletPoints,
    String? actionCtaText,
    String? caseStudyUrl,
    String? imageUrl,
    String? darkImageUrl,
    String? lightImageUrl,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'solutionId': solutionId,
      'categoryTag': categoryTag,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'iconKey': iconKey,
      'category': category,
      'formulationCount': formulationCount,
      'keyBenefit': keyBenefit,
      'efficacyMetric': efficacyMetric,
      'bulletPoints': bulletPoints.toJson(),
      'actionCtaText': actionCtaText,
      'caseStudyUrl': caseStudyUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (darkImageUrl != null) 'darkImageUrl': darkImageUrl,
      if (lightImageUrl != null) 'lightImageUrl': lightImageUrl,
      'displayOrder': displayOrder,
    };
  }
}

class _Undefined {}

class _SolutionCardImpl extends SolutionCard {
  _SolutionCardImpl({
    int? id,
    required String solutionId,
    required String categoryTag,
    required String title,
    required String subtitle,
    required String description,
    required String iconKey,
    required String category,
    required String formulationCount,
    required String keyBenefit,
    required String efficacyMetric,
    required List<String> bulletPoints,
    required String actionCtaText,
    required String caseStudyUrl,
    String? imageUrl,
    String? darkImageUrl,
    String? lightImageUrl,
    required int displayOrder,
  }) : super._(
          id: id,
          solutionId: solutionId,
          categoryTag: categoryTag,
          title: title,
          subtitle: subtitle,
          description: description,
          iconKey: iconKey,
          category: category,
          formulationCount: formulationCount,
          keyBenefit: keyBenefit,
          efficacyMetric: efficacyMetric,
          bulletPoints: bulletPoints,
          actionCtaText: actionCtaText,
          caseStudyUrl: caseStudyUrl,
          imageUrl: imageUrl,
          darkImageUrl: darkImageUrl,
          lightImageUrl: lightImageUrl,
          displayOrder: displayOrder,
        );

  @override
  SolutionCard copyWith({
    Object? id = _Undefined,
    String? solutionId,
    String? categoryTag,
    String? title,
    String? subtitle,
    String? description,
    String? iconKey,
    String? category,
    String? formulationCount,
    String? keyBenefit,
    String? efficacyMetric,
    List<String>? bulletPoints,
    String? actionCtaText,
    String? caseStudyUrl,
    Object? imageUrl = _Undefined,
    Object? darkImageUrl = _Undefined,
    Object? lightImageUrl = _Undefined,
    int? displayOrder,
  }) {
    return SolutionCard(
      id: id is int? ? id : this.id,
      solutionId: solutionId ?? this.solutionId,
      categoryTag: categoryTag ?? this.categoryTag,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      iconKey: iconKey ?? this.iconKey,
      category: category ?? this.category,
      formulationCount: formulationCount ?? this.formulationCount,
      keyBenefit: keyBenefit ?? this.keyBenefit,
      efficacyMetric: efficacyMetric ?? this.efficacyMetric,
      bulletPoints: bulletPoints ?? this.bulletPoints.clone(),
      actionCtaText: actionCtaText ?? this.actionCtaText,
      caseStudyUrl: caseStudyUrl ?? this.caseStudyUrl,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      darkImageUrl: darkImageUrl is String? ? darkImageUrl : this.darkImageUrl,
      lightImageUrl:
          lightImageUrl is String? ? lightImageUrl : this.lightImageUrl,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
