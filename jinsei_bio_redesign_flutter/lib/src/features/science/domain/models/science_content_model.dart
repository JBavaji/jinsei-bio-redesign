import 'science_header_metric_model.dart';
import 'science_step_model.dart';

class ScienceContentModel {
  final List<ScienceHeaderMetricModel> headerMetrics;
  final List<ScienceStepModel> pipelineSteps;

  const ScienceContentModel({
    required this.headerMetrics,
    required this.pipelineSteps,
  });

  factory ScienceContentModel.fromJson(Map<String, dynamic> json) {
    final metricsRaw = json['header_metrics'] as List<dynamic>? ?? [];
    final stepsRaw = json['pipeline_steps'] as List<dynamic>? ?? [];

    final metrics = metricsRaw
        .map((e) => ScienceHeaderMetricModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final steps = stepsRaw
        .map((e) => ScienceStepModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return ScienceContentModel(
      headerMetrics: metrics,
      pipelineSteps: steps,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'header_metrics': headerMetrics.map((m) => m.toJson()).toList(),
      'pipeline_steps': pipelineSteps.map((s) => s.toJson()).toList(),
    };
  }
}
