/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class ScienceContent extends _i1.SerializableEntity {
  ScienceContent._({
    required this.headerMetrics,
    required this.pipelineSteps,
    this.clinicalQa,
  });

  factory ScienceContent({
    required List<_i2.ScienceHeaderMetric> headerMetrics,
    required List<_i2.ScienceStep> pipelineSteps,
    _i2.ClinicalQualityAssurance? clinicalQa,
  }) = _ScienceContentImpl;

  factory ScienceContent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScienceContent(
      headerMetrics:
          serializationManager.deserialize<List<_i2.ScienceHeaderMetric>>(
              jsonSerialization['headerMetrics']),
      pipelineSteps: serializationManager.deserialize<List<_i2.ScienceStep>>(
          jsonSerialization['pipelineSteps']),
      clinicalQa:
          serializationManager.deserialize<_i2.ClinicalQualityAssurance?>(
              jsonSerialization['clinicalQa']),
    );
  }

  List<_i2.ScienceHeaderMetric> headerMetrics;

  List<_i2.ScienceStep> pipelineSteps;

  _i2.ClinicalQualityAssurance? clinicalQa;

  ScienceContent copyWith({
    List<_i2.ScienceHeaderMetric>? headerMetrics,
    List<_i2.ScienceStep>? pipelineSteps,
    _i2.ClinicalQualityAssurance? clinicalQa,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'headerMetrics': headerMetrics.toJson(valueToJson: (v) => v.toJson()),
      'pipelineSteps': pipelineSteps.toJson(valueToJson: (v) => v.toJson()),
      if (clinicalQa != null) 'clinicalQa': clinicalQa?.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'headerMetrics': headerMetrics.toJson(valueToJson: (v) => v.allToJson()),
      'pipelineSteps': pipelineSteps.toJson(valueToJson: (v) => v.allToJson()),
      if (clinicalQa != null) 'clinicalQa': clinicalQa?.allToJson(),
    };
  }
}

class _Undefined {}

class _ScienceContentImpl extends ScienceContent {
  _ScienceContentImpl({
    required List<_i2.ScienceHeaderMetric> headerMetrics,
    required List<_i2.ScienceStep> pipelineSteps,
    _i2.ClinicalQualityAssurance? clinicalQa,
  }) : super._(
          headerMetrics: headerMetrics,
          pipelineSteps: pipelineSteps,
          clinicalQa: clinicalQa,
        );

  @override
  ScienceContent copyWith({
    List<_i2.ScienceHeaderMetric>? headerMetrics,
    List<_i2.ScienceStep>? pipelineSteps,
    Object? clinicalQa = _Undefined,
  }) {
    return ScienceContent(
      headerMetrics: headerMetrics ?? this.headerMetrics.clone(),
      pipelineSteps: pipelineSteps ?? this.pipelineSteps.clone(),
      clinicalQa: clinicalQa is _i2.ClinicalQualityAssurance?
          ? clinicalQa
          : this.clinicalQa?.copyWith(),
    );
  }
}
