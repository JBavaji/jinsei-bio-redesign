import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/datasources/science_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/datasources/science_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/repositories/science_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_header_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_step_model.dart';

class TestScienceAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/data/science_content.json') {
      return File('assets/data/science_content.json').readAsString();
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) async {
    final bytes = await File(key).readAsBytes();
    return ByteData.sublistView(Uint8List.fromList(bytes));
  }
}

class FakeSuccessfulRemoteDataSource implements IScienceRemoteDataSource {
  final ScienceContentModel mockContent;

  FakeSuccessfulRemoteDataSource(this.mockContent);

  @override
  Future<ScienceContentModel?> getScienceContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    return mockContent;
  }
}

class FakeFailingRemoteDataSource implements IScienceRemoteDataSource {
  @override
  Future<ScienceContentModel?> getScienceContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    return null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ScienceRepositoryImpl Tests (JIN-60)', () {
    late ScienceLocalDataSource localDataSource;

    setUp(() {
      localDataSource =
          ScienceLocalDataSource(bundle: TestScienceAssetBundle());
    });

    test(
        'getScienceContent returns remote data when remote data source succeeds (remote-first)',
        () async {
      final mockRemoteContent = ScienceContentModel(
        headerMetrics: [
          ScienceHeaderMetricModel.fromJson({
            'iconKey': 'science_rounded',
            'value': '10',
            'label': 'Remote Milestones',
            'accentColorHex': '#7BD4E2',
          }),
        ],
        pipelineSteps: [
          ScienceStepModel.fromJson({
            'stepNumber': 1,
            'title': 'Remote Discovery Step',
            'subtitle': 'Sub',
            'description': 'Desc',
            'category': 'discovery',
            'iconKey': 'search_rounded',
            'metricValue': '99%',
            'metricLabel': 'Precision',
            'imageUrl': 'step_01.jpg',
          }),
        ],
      );

      final repository = ScienceRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeSuccessfulRemoteDataSource(mockRemoteContent),
      );

      final content = await repository.getScienceContent();
      expect(content.headerMetrics.length, equals(1));
      expect(content.headerMetrics.first.label, equals('Remote Milestones'));
      expect(content.pipelineSteps.length, equals(1));
      expect(
          content.pipelineSteps.first.title, equals('Remote Discovery Step'));
    });

    test(
        'getScienceContent falls back seamlessly to local asset JSON when remote returns null',
        () async {
      final repository = ScienceRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeFailingRemoteDataSource(),
      );

      final content = await repository.getScienceContent();
      expect(content.headerMetrics.length, equals(3));
      expect(content.pipelineSteps.length, equals(10));
      expect(content.pipelineSteps.first.title,
          equals('Target Consumer Product Identification'));
      expect(content.pipelineSteps.last.title,
          equals('Continuous Improvement of Strains & Process'));
    });
  });
}
