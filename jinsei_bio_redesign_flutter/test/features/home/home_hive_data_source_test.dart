import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/datasources/home_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/models/pillar_item_model.dart';
import 'package:jinsei_bio_redesign/src/features/home/domain/models/home_content_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Box testBox;
  late HomeHiveDataSource hiveDataSource;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync('hive_test_');
    Hive.init(tempDir.path);
    testBox = await Hive.openBox('test_home_box');
    hiveDataSource = HomeHiveDataSource(box: testBox);
  });

  tearDown(() async {
    await testBox.clear();
    await testBox.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('HomeHiveDataSource Tests', () {
    test('getCachedHomeContent returns null when box is empty', () async {
      final cached = await hiveDataSource.getCachedHomeContent();
      expect(cached, isNull);
    });

    test(
        'saveHomeContent persists model and returns it on getCachedHomeContent',
        () async {
      final sampleContent = HomeContentModel(
        pillars: [
          PillarItemModel(
            iconKey: 'dna',
            icon: PillarItemModel.iconFromKey('dna'),
            title: 'Test Pillar',
            description: 'Test Description',
          ),
        ],
        executiveStats: [],
        productVerticals: [],
      );

      await hiveDataSource.saveHomeContent(sampleContent);
      final cached = await hiveDataSource.getCachedHomeContent();

      expect(cached, isNotNull);
      expect(cached!.pillars.length, equals(1));
      expect(cached.pillars.first.title, equals('Test Pillar'));
    });

    test('clearCache removes saved content from box', () async {
      final sampleContent = HomeContentModel(
        pillars: [
          PillarItemModel(
            iconKey: 'dna',
            icon: PillarItemModel.iconFromKey('dna'),
            title: 'Test Pillar',
            description: 'Test Description',
          ),
        ],
        executiveStats: [],
        productVerticals: [],
      );

      await hiveDataSource.saveHomeContent(sampleContent);
      await hiveDataSource.clearCache();

      final cached = await hiveDataSource.getCachedHomeContent();
      expect(cached, isNull);
    });
  });
}
