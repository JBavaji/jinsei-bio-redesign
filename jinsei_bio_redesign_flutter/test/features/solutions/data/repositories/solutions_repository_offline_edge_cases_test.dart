import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/datasources/solutions_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/datasources/solutions_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/datasources/solutions_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/repositories/solutions_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_content_model.dart';

class TestSolutionsAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/data/solutions_content.json') {
      return File('assets/data/solutions_content.json').readAsString();
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) async {
    final bytes = await File(key).readAsBytes();
    return ByteData.sublistView(Uint8List.fromList(bytes));
  }
}

class MockRemoteDataSourceThrowsSocket implements ISolutionsRemoteDataSource {
  @override
  Future<SolutionsContentModel?> getSolutionsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    throw const SocketException('No Internet Connection');
  }
}

class MockRemoteDataSourceThrowsTimeout implements ISolutionsRemoteDataSource {
  @override
  Future<SolutionsContentModel?> getSolutionsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    throw TimeoutException('Server connection timed out');
  }
}

class MockSolutionsHiveDataSource implements ISolutionsHiveDataSource {
  SolutionsContentModel? cachedData;
  SolutionsContentModel? savedData;
  bool clearCacheCalled = false;

  MockSolutionsHiveDataSource({this.cachedData});

  @override
  Future<SolutionsContentModel?> getCachedSolutionsContent() async {
    return cachedData;
  }

  @override
  Future<void> saveSolutionsContent(SolutionsContentModel content) async {
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

  late SolutionsLocalDataSource localDataSource;

  setUp(() {
    localDataSource =
        SolutionsLocalDataSource(bundle: TestSolutionsAssetBundle());
  });

  group('SolutionsRepositoryImpl 3-Tier Offline Edge Cases (JIN-76)', () {
    test(
        'EDGE CASE: No internet connection (SocketException) falls back to Hive DB cache if present',
        () async {
      final cachedSolutions = SolutionsContentModel(
        metrics: [
          SolutionMetricModel.fromJson({
            'value': '99',
            'label': 'Cached Hive Metric',
            'changeLabel': '+10%',
            'trend': 'up',
          }),
        ],
        solutions: [
          SolutionCardModel.fromJson({
            'id': 'cached-01',
            'title': 'Cached Solution From Hive',
            'category': 'human_nutrition',
            'categoryLabel': 'Human Nutrition',
            'headline': 'From Hive DB',
            'scientificValidation': 'Validated Offline',
            'keyBenefits': ['Immunity'],
            'actionLabel': 'View Details',
          }),
        ],
      );

      final mockHive = MockSolutionsHiveDataSource(cachedData: cachedSolutions);
      final repository = SolutionsRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsSocket(),
        hiveDataSource: mockHive,
      );

      final result = await repository.getSolutionsContent();

      // Verify Hive DB cache was loaded successfully
      expect(result.metrics.first.label, equals('Cached Hive Metric'));
      expect(result.solutions.first.title, equals('Cached Solution From Hive'));
    });

    test(
        'EDGE CASE: No internet AND empty Hive cache falls back to bundled asset JSON',
        () async {
      final mockEmptyHive = MockSolutionsHiveDataSource(cachedData: null);
      final repository = SolutionsRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsSocket(),
        hiveDataSource: mockEmptyHive,
      );

      final result = await repository.getSolutionsContent();

      // Verify fallback all the way to bundled static asset JSON
      expect(result.metrics.length, equals(3));
      expect(result.solutions.length, equals(4));
      expect(result.solutions.first.title,
          equals('Human Health: Precision Wellness'));
    });

    test(
        'EDGE CASE: Server timeout (TimeoutException) falls back to Hive DB cache',
        () async {
      final cachedSolutions = SolutionsContentModel(
        metrics: [
          SolutionMetricModel.fromJson({
            'value': '77',
            'label': 'Timeout Hive Recovery',
            'changeLabel': 'OK',
            'trend': 'neutral',
          }),
        ],
        solutions: [],
      );

      final mockHive = MockSolutionsHiveDataSource(cachedData: cachedSolutions);
      final repository = SolutionsRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsTimeout(),
        hiveDataSource: mockHive,
      );

      final result = await repository.getSolutionsContent();
      expect(result.metrics.first.label, equals('Timeout Hive Recovery'));
    });
  });
}
