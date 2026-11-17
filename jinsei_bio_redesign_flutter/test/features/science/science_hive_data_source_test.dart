import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/datasources/science_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_header_metric_model.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_step_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Box testBox;
  late ScienceHiveDataSource hiveDataSource;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync('science_hive_test_');
    Hive.init(tempDir.path);
    testBox = await Hive.openBox('test_science_box');
    hiveDataSource = ScienceHiveDataSource(box: testBox);
  });

  tearDown(() async {
    await testBox.clear();
    await testBox.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('ScienceHiveDataSource Tests (JIN-76)', () {
    test('getCachedScienceContent returns null when box is empty', () async {
      final cached = await hiveDataSource.getCachedScienceContent();
      expect(cached, isNull);
    });

    test(
        'saveScienceContent persists model and returns it on getCachedScienceContent',
        () async {
      final sampleContent = ScienceContentModel(
        headerMetrics: [
          ScienceHeaderMetricModel.fromJson({
            'iconKey': 'science_rounded',
            'value': '10',
            'label': 'Milestones',
            'accentColorHex': '#7BD4E2',
          }),
        ],
        pipelineSteps: [
          ScienceStepModel.fromJson({
            'stepNumber': 1,
            'title': 'Discovery Phase',
            'subtitle': 'Phase 1 Subtitle',
            'description': 'Phase 1 Description',
            'category': 'discovery',
            'iconKey': 'biotech_rounded',
            'metricValue': '99.9%',
            'metricLabel': 'Purity',
            'imageUrl': 'https://cdn.example.com/step1.webp',
          }),
        ],
      );

      await hiveDataSource.saveScienceContent(sampleContent);
      final cached = await hiveDataSource.getCachedScienceContent();

      expect(cached, isNotNull);
      expect(cached!.headerMetrics.length, equals(1));
      expect(cached.headerMetrics.first.value, equals('10'));
      expect(cached.pipelineSteps.length, equals(1));
      expect(cached.pipelineSteps.first.title, equals('Discovery Phase'));
      expect(cached.pipelineSteps.first.metricValue, equals('99.9%'));
    });

    test('clearCache deletes persisted content from Hive box', () async {
      const sampleContent = ScienceContentModel(
        headerMetrics: [],
        pipelineSteps: [],
      );

      await hiveDataSource.saveScienceContent(sampleContent);
      await hiveDataSource.clearCache();

      final cached = await hiveDataSource.getCachedScienceContent();
      expect(cached, isNull);
    });
  });
}
