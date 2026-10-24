import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/datasources/solutions_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_card_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solution_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/domain/models/solutions_content_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Box testBox;
  late SolutionsHiveDataSource hiveDataSource;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync('solutions_hive_test_');
    Hive.init(tempDir.path);
    testBox = await Hive.openBox('test_solutions_box');
    hiveDataSource = SolutionsHiveDataSource(box: testBox);
  });

  tearDown(() async {
    await testBox.clear();
    await testBox.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('SolutionsHiveDataSource Tests (JIN-76)', () {
    test('getCachedSolutionsContent returns null when box is empty', () async {
      final cached = await hiveDataSource.getCachedSolutionsContent();
      expect(cached, isNull);
    });

    test(
        'saveSolutionsContent persists model and returns it on getCachedSolutionsContent',
        () async {
      final sampleContent = SolutionsContentModel(
        metrics: [
          SolutionMetricModel.fromJson({
            'value': '4',
            'label': 'Therapeutic Verticals',
            'changeLabel': '+100% Validated',
            'trend': 'up',
          }),
        ],
        solutions: [
          SolutionCardModel.fromJson({
            'id': 'sol-01',
            'title': 'Gut Health & Microbiome Formulations',
            'category': 'human_nutrition',
            'categoryLabel': 'Human Nutrition',
            'headline': 'Precision Probiotics',
            'scientificValidation': 'Clinical Trial Phase III',
            'keyBenefits': ['Enhanced mucosal immunity'],
            'actionLabel': 'Request Sample',
          }),
        ],
      );

      await hiveDataSource.saveSolutionsContent(sampleContent);
      final cached = await hiveDataSource.getCachedSolutionsContent();

      expect(cached, isNotNull);
      expect(cached!.metrics.length, equals(1));
      expect(cached.metrics.first.value, equals('4'));
      expect(cached.solutions.length, equals(1));
      expect(cached.solutions.first.title,
          equals('Gut Health & Microbiome Formulations'));
    });

    test('clearCache deletes persisted content from Hive box', () async {
      const sampleContent = SolutionsContentModel(
        metrics: [],
        solutions: [],
      );

      await hiveDataSource.saveSolutionsContent(sampleContent);
      await hiveDataSource.clearCache();

      final cached = await hiveDataSource.getCachedSolutionsContent();
      expect(cached, isNull);
    });
  });
}
