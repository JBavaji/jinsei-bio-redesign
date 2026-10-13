import 'solution_card_model.dart';
import 'solution_metric_model.dart';
import 'solutions_quality_assurance_model.dart';

class SolutionsContentModel {
  final List<SolutionMetricModel> metrics;
  final List<SolutionCardModel> solutions;
  final SolutionsQualityAssuranceModel? qualityAssurance;

  const SolutionsContentModel({
    required this.metrics,
    required this.solutions,
    this.qualityAssurance,
  });

  factory SolutionsContentModel.fromJson(Map<String, dynamic> json) {
    final metricsRaw = json['metrics'] as List<dynamic>? ?? [];
    final solutionsRaw = json['solutions'] as List<dynamic>? ?? [];

    final metrics = metricsRaw
        .map((e) => SolutionMetricModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final solutions = solutionsRaw
        .map((e) => SolutionCardModel.fromJson(e as Map<String, dynamic>))
        .toList();

    SolutionsQualityAssuranceModel? qa;
    if (json['quality_assurance'] != null) {
      qa = SolutionsQualityAssuranceModel.fromJson(
          json['quality_assurance'] as Map<String, dynamic>);
    } else if (json['qualityAssurance'] != null) {
      qa = SolutionsQualityAssuranceModel.fromJson(
          json['qualityAssurance'] as Map<String, dynamic>);
    }

    return SolutionsContentModel(
      metrics: metrics,
      solutions: solutions,
      qualityAssurance: qa,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'metrics': metrics.map((m) => m.toJson()).toList(),
      'solutions': solutions.map((s) => s.toJson()).toList(),
      'quality_assurance': qualityAssurance?.toJson(),
    };
  }
}
