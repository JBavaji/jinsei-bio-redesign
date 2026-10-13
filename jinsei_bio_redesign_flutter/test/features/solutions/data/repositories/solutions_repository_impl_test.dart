import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/datasources/solutions_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/datasources/solutions_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/repositories/solutions_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_quality_assurance_model.dart';

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

class FakeSuccessfulSolutionsRemoteDataSource
    implements ISolutionsRemoteDataSource {
  final SolutionsContentModel mockContent;

  FakeSuccessfulSolutionsRemoteDataSource(this.mockContent);

  @override
  Future<SolutionsContentModel?> getSolutionsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    return mockContent;
  }
}

class FakeFailingSolutionsRemoteDataSource
    implements ISolutionsRemoteDataSource {
  @override
  Future<SolutionsContentModel?> getSolutionsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    return null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SolutionsRepositoryImpl Tests (JIN-18)', () {
    late SolutionsLocalDataSource localDataSource;

    setUp(() {
      localDataSource =
          SolutionsLocalDataSource(bundle: TestSolutionsAssetBundle());
    });

    test(
        'getSolutionsContent returns remote data when remote data source succeeds (remote-first)',
        () async {
      final mockRemoteContent = SolutionsContentModel(
        metrics: [
          SolutionMetricModel.fromJson({
            'iconKey': 'hub_rounded',
            'value': '99',
            'label': 'Remote Metric',
            'accentColorHex': '#7BD4E2',
            'displayOrder': 1,
          }),
        ],
        solutions: [
          SolutionCardModel.fromJson({
            'solutionId': 'sol_remote',
            'categoryTag': 'REMOTE TAG',
            'title': 'Remote Solution Card',
            'subtitle': 'Remote Subtitle',
            'description': 'Remote Description',
            'iconKey': 'biotech_rounded',
            'category': 'human-health',
            'formulationCount': '99 Formulations',
            'keyBenefit': 'High Quality',
            'efficacyMetric': '>99%',
            'bulletPoints': ['Remote Bullet 1'],
            'actionCtaText': 'Explore',
            'caseStudyUrl': '',
            'displayOrder': 1,
          }),
        ],
        qualityAssurance: const SolutionsQualityAssuranceModel(
          title: 'Remote QA',
          description: 'Remote QA Desc',
          badgeText: 'Remote Badge',
          complianceStandard: 'Remote Standard',
        ),
      );

      final repository = SolutionsRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource:
            FakeSuccessfulSolutionsRemoteDataSource(mockRemoteContent),
      );

      final content = await repository.getSolutionsContent();
      expect(content.metrics.length, equals(1));
      expect(content.metrics.first.label, equals('Remote Metric'));
      expect(content.solutions.length, equals(1));
      expect(content.solutions.first.title, equals('Remote Solution Card'));
      expect(content.qualityAssurance?.title, equals('Remote QA'));
    });

    test(
        'getSolutionsContent falls back seamlessly to local asset JSON when remote returns null',
        () async {
      final repository = SolutionsRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeFailingSolutionsRemoteDataSource(),
      );

      final content = await repository.getSolutionsContent();
      expect(content.metrics.length, equals(3));
      expect(content.solutions.length, equals(4));
      expect(content.solutions.first.title,
          equals('Human Health: Precision Wellness'));
      expect(content.solutions.last.title,
          equals('Agri-Tech & Environmental Security'));
      expect(content.qualityAssurance?.badgeText,
          equals('Pune NCL Innovation Park'));
    });

    test('getSolutionsByCategory filters cards by category properly', () async {
      final repository = SolutionsRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeFailingSolutionsRemoteDataSource(),
      );

      final allSolutions = await repository.getSolutionsByCategory('all');
      expect(allSolutions.length, equals(4));

      final humanHealth =
          await repository.getSolutionsByCategory('human-health');
      expect(humanHealth.length, equals(1));
      expect(humanHealth.first.category, equals('human-health'));

      final foodTech = await repository.getSolutionsByCategory('food-tech');
      expect(foodTech.length, equals(1));
      expect(foodTech.first.category, equals('food-tech'));

      final dermoBiotics =
          await repository.getSolutionsByCategory('dermo-biotics');
      expect(dermoBiotics.length, equals(1));
      expect(dermoBiotics.first.category, equals('dermo-biotics'));

      final agriTech = await repository.getSolutionsByCategory('agri-tech');
      expect(agriTech.length, equals(1));
      expect(agriTech.first.category, equals('agri-tech'));
    });
  });
}
