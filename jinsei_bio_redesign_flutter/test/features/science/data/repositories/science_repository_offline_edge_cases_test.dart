import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/datasources/science_hive_data_source.dart';
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

class MockRemoteDataSourceThrowsSocket implements IScienceRemoteDataSource {
  @override
  Future<ScienceContentModel?> getScienceContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    throw const SocketException('No Internet Connection');
  }
}

class MockRemoteDataSourceThrowsTimeout implements IScienceRemoteDataSource {
  @override
  Future<ScienceContentModel?> getScienceContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    throw TimeoutException('Server connection timed out');
  }
}

class MockHiveDataSource implements IScienceHiveDataSource {
  ScienceContentModel? cachedData;
  ScienceContentModel? savedData;
  bool clearCacheCalled = false;

  MockHiveDataSource({this.cachedData});

  @override
  Future<ScienceContentModel?> getCachedScienceContent() async {
    return cachedData;
  }

  @override
  Future<void> saveScienceContent(ScienceContentModel content) async {
    savedData = content;
    cachedData = content;
  }

  @override
  Future<void> clearCache() async {
    clearCacheCalled = true;
    cachedData = null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ScienceLocalDataSource localDataSource;

  setUp(() {
    localDataSource = ScienceLocalDataSource(bundle: TestScienceAssetBundle());
  });

  group('ScienceRepositoryImpl 3-Tier Offline Edge Cases (JIN-76)', () {
    test(
        'EDGE CASE: No internet connection (SocketException) falls back to Hive DB cache if present',
        () async {
      final cachedScience = ScienceContentModel(
        headerMetrics: [
          ScienceHeaderMetricModel.fromJson({
            'iconKey': 'science_rounded',
            'value': '99',
            'label': 'Cached From Hive',
            'accentColorHex': '#66DD8B',
          }),
        ],
        pipelineSteps: [
          ScienceStepModel.fromJson({
            'stepNumber': 1,
            'title': 'Offline Cached Step',
            'subtitle': 'Offline Hive Subtitle',
            'description': 'Offline Hive Description',
            'category': 'discovery',
            'iconKey': 'biotech_rounded',
            'metricValue': '100%',
            'metricLabel': 'Resilience',
            'imageUrl': 'https://cdn.example.com/offline.webp',
          }),
        ],
      );

      final mockHive = MockHiveDataSource(cachedData: cachedScience);
      final repository = ScienceRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsSocket(),
        hiveDataSource: mockHive,
      );

      final result = await repository.getScienceContent();

      // Verify Hive DB cache was loaded successfully
      expect(result.headerMetrics.first.label, equals('Cached From Hive'));
      expect(result.pipelineSteps.first.title, equals('Offline Cached Step'));
    });

    test(
        'EDGE CASE: No internet AND empty Hive cache falls back to bundled asset JSON',
        () async {
      final mockEmptyHive = MockHiveDataSource(cachedData: null);
      final repository = ScienceRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsSocket(),
        hiveDataSource: mockEmptyHive,
      );

      final result = await repository.getScienceContent();

      // Verify fallback all the way to bundled static asset JSON
      expect(result.headerMetrics.length, equals(3));
      expect(result.pipelineSteps.length, equals(10));
      expect(result.pipelineSteps.first.title,
          equals('Target Consumer Product Identification'));
    });

    test(
        'EDGE CASE: Server timeout (TimeoutException) falls back to Hive DB cache',
        () async {
      final cachedScience = ScienceContentModel(
        headerMetrics: [
          ScienceHeaderMetricModel.fromJson({
            'iconKey': 'science_rounded',
            'value': '50',
            'label': 'Timeout Hive Recovery',
            'accentColorHex': '#7BD4E2',
          }),
        ],
        pipelineSteps: [],
      );

      final mockHive = MockHiveDataSource(cachedData: cachedScience);
      final repository = ScienceRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsTimeout(),
        hiveDataSource: mockHive,
      );

      final result = await repository.getScienceContent();
      expect(result.headerMetrics.first.label, equals('Timeout Hive Recovery'));
    });
  });
}
