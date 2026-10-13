import 'dart:async';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import '../../../../core/config/app_config.dart';
import '../../domain/models/solution_card_model.dart';
import '../../domain/models/solution_metric_model.dart';
import '../../domain/models/solutions_content_model.dart';
import '../../domain/models/solutions_quality_assurance_model.dart';

abstract class ISolutionsRemoteDataSource {
  Future<SolutionsContentModel?> getSolutionsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  });
}

class SolutionsRemoteDataSource implements ISolutionsRemoteDataSource {
  final Client _client;

  SolutionsRemoteDataSource({Client? client})
      : _client = client ?? Client(AppConfig.serverpodUrl);

  @override
  Future<SolutionsContentModel?> getSolutionsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final response =
          await _client.solutions.getSolutionsContent().timeout(timeout);

      final metrics = response.metrics
          .map((m) => SolutionMetricModel.fromJson({
                'iconKey': m.iconKey,
                'value': m.value,
                'label': m.label,
                'accentColorHex': m.accentColorHex,
                'displayOrder': m.displayOrder,
              }))
          .toList();

      final solutions = response.solutions
          .map((s) => SolutionCardModel.fromJson({
                'solutionId': s.solutionId,
                'categoryTag': s.categoryTag,
                'title': s.title,
                'subtitle': s.subtitle,
                'description': s.description,
                'iconKey': s.iconKey,
                'category': s.category,
                'formulationCount': s.formulationCount,
                'keyBenefit': s.keyBenefit,
                'efficacyMetric': s.efficacyMetric,
                'bulletPoints': s.bulletPoints,
                'actionCtaText': s.actionCtaText,
                'caseStudyUrl': s.caseStudyUrl,
                'displayOrder': s.displayOrder,
              }))
          .toList();

      SolutionsQualityAssuranceModel? qa;
      if (response.qualityAssurance != null) {
        qa = SolutionsQualityAssuranceModel.fromJson({
          'title': response.qualityAssurance!.title,
          'description': response.qualityAssurance!.description,
          'badgeText': response.qualityAssurance!.badgeText,
          'complianceStandard': response.qualityAssurance!.complianceStandard,
        });
      }

      return SolutionsContentModel(
        metrics: metrics,
        solutions: solutions,
        qualityAssurance: qa,
      );
    } catch (_) {
      return null;
    }
  }
}
