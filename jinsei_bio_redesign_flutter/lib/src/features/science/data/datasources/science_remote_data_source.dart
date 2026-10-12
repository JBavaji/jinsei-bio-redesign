import 'dart:async';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import '../../../../core/config/app_config.dart';
import '../../domain/models/science_content_model.dart';
import '../../domain/models/science_header_metric_model.dart';
import '../../domain/models/science_step_model.dart';

abstract class IScienceRemoteDataSource {
  Future<ScienceContentModel?> getScienceContent({
    Duration timeout = const Duration(milliseconds: 5000),
  });
}

class ScienceRemoteDataSource implements IScienceRemoteDataSource {
  final Client _client;

  ScienceRemoteDataSource({Client? client})
      : _client = client ?? Client(AppConfig.serverpodUrl);

  @override
  Future<ScienceContentModel?> getScienceContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final response =
          await _client.science.getScienceContent().timeout(timeout);

      final metrics = response.headerMetrics
          .map((m) => ScienceHeaderMetricModel.fromJson({
                'iconKey': m.iconKey,
                'value': m.value,
                'label': m.label,
                'accentColorHex': m.accentColorHex,
              }))
          .toList();

      final steps = response.pipelineSteps
          .map((s) => ScienceStepModel.fromJson({
                'stepNumber': s.stepNumber,
                'title': s.title,
                'subtitle': s.subtitle,
                'description': s.description,
                'category': s.category,
                'iconKey': s.iconKey,
                'metricValue': s.metricValue,
                'metricLabel': s.metricLabel,
                'imageUrl': s.imageUrl,
              }))
          .toList();

      return ScienceContentModel(
        headerMetrics: metrics,
        pipelineSteps: steps,
      );
    } catch (_) {
      return null;
    }
  }
}
