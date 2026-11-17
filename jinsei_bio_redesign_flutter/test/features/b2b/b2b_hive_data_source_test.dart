import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/data/datasources/b2b_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_modal_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/formulation_format_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/strain_vertical_option_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Box testBox;
  late B2bHiveDataSource hiveDataSource;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync('b2b_hive_test_');
    Hive.init(tempDir.path);
    testBox = await Hive.openBox('test_b2b_box');
    hiveDataSource = B2bHiveDataSource(box: testBox);
  });

  tearDown(() async {
    await testBox.clear();
    await testBox.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('B2bHiveDataSource Tests (JIN-76)', () {
    test('getCachedModalContent returns null when box is empty', () async {
      final cached = await hiveDataSource.getCachedModalContent();
      expect(cached, isNull);
    });

    test(
        'saveModalContent persists model and returns it on getCachedModalContent',
        () async {
      final sampleContent = B2bModalContentModel(
        badgeText: 'SAMPLE ACCESS',
        title: 'Request Laboratory Samples',
        subtitle: 'For enterprise co-development evaluation',
        strains: [
          StrainVerticalOptionModel.fromJson(const {
            'strainId': 'strain-01',
            'name': 'JB-GUT-01 L. plantarum',
            'category': 'human_nutrition',
            'strainCode': 'JN-01',
            'highlight': 'Microbiome balance',
            'defaultFormat': 'powder',
          }),
        ],
        formulationFormats: [
          FormulationFormatOptionModel.fromJson(const {
            'formatId': 'powder',
            'label': 'Lyophilized Bulk Powder',
          }),
        ],
        complianceNote: 'NDA Required',
        certifications: const ['GMP Certified'],
        dispatchNotice: 'Dispatched within 48h',
      );

      await hiveDataSource.saveModalContent(sampleContent);
      final cached = await hiveDataSource.getCachedModalContent();

      expect(cached, isNotNull);
      expect(cached!.badgeText, equals('SAMPLE ACCESS'));
      expect(cached.strains.length, equals(1));
      expect(cached.strains.first.name, equals('JB-GUT-01 L. plantarum'));
    });

    test('clearCache deletes persisted content from Hive box', () async {
      const sampleContent = B2bModalContentModel(
        badgeText: '',
        title: '',
        subtitle: '',
        strains: [],
        formulationFormats: [],
        complianceNote: '',
        certifications: [],
        dispatchNotice: '',
      );

      await hiveDataSource.saveModalContent(sampleContent);
      await hiveDataSource.clearCache();

      final cached = await hiveDataSource.getCachedModalContent();
      expect(cached, isNull);
    });
  });
}
