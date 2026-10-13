/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class SolutionsContent extends _i1.SerializableEntity {
  SolutionsContent._({
    required this.metrics,
    required this.solutions,
    this.qualityAssurance,
  });

  factory SolutionsContent({
    required List<_i2.SolutionMetric> metrics,
    required List<_i2.SolutionCard> solutions,
    _i2.ClinicalQualityAssurance? qualityAssurance,
  }) = _SolutionsContentImpl;

  factory SolutionsContent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SolutionsContent(
      metrics: serializationManager
          .deserialize<List<_i2.SolutionMetric>>(jsonSerialization['metrics']),
      solutions: serializationManager
          .deserialize<List<_i2.SolutionCard>>(jsonSerialization['solutions']),
      qualityAssurance:
          serializationManager.deserialize<_i2.ClinicalQualityAssurance?>(
              jsonSerialization['qualityAssurance']),
    );
  }

  List<_i2.SolutionMetric> metrics;

  List<_i2.SolutionCard> solutions;

  _i2.ClinicalQualityAssurance? qualityAssurance;

  SolutionsContent copyWith({
    List<_i2.SolutionMetric>? metrics,
    List<_i2.SolutionCard>? solutions,
    _i2.ClinicalQualityAssurance? qualityAssurance,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'metrics': metrics.toJson(valueToJson: (v) => v.toJson()),
      'solutions': solutions.toJson(valueToJson: (v) => v.toJson()),
      if (qualityAssurance != null)
        'qualityAssurance': qualityAssurance?.toJson(),
    };
  }
}

class _Undefined {}

class _SolutionsContentImpl extends SolutionsContent {
  _SolutionsContentImpl({
    required List<_i2.SolutionMetric> metrics,
    required List<_i2.SolutionCard> solutions,
    _i2.ClinicalQualityAssurance? qualityAssurance,
  }) : super._(
          metrics: metrics,
          solutions: solutions,
          qualityAssurance: qualityAssurance,
        );

  @override
  SolutionsContent copyWith({
    List<_i2.SolutionMetric>? metrics,
    List<_i2.SolutionCard>? solutions,
    Object? qualityAssurance = _Undefined,
  }) {
    return SolutionsContent(
      metrics: metrics ?? this.metrics.clone(),
      solutions: solutions ?? this.solutions.clone(),
      qualityAssurance: qualityAssurance is _i2.ClinicalQualityAssurance?
          ? qualityAssurance
          : this.qualityAssurance?.copyWith(),
    );
  }
}
