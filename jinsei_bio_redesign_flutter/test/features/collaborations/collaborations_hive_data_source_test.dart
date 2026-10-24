import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/data/datasources/collaborations_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_contact_info_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_track_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Box testBox;
  late CollaborationsHiveDataSource hiveDataSource;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync('collab_hive_test_');
    Hive.init(tempDir.path);
    testBox = await Hive.openBox('test_collab_box');
    hiveDataSource = CollaborationsHiveDataSource(box: testBox);
  });

  tearDown(() async {
    await testBox.clear();
    await testBox.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('CollaborationsHiveDataSource Tests (JIN-76)', () {
    test('getCachedCollaborationsContent returns null when box is empty',
        () async {
      final cached = await hiveDataSource.getCachedCollaborationsContent();
      expect(cached, isNull);
    });

    test(
        'saveCollaborationsContent persists model and returns it on getCachedCollaborationsContent',
        () async {
      const sampleContent = CollaborationContentModel(
        headlineBadge: 'STRATEGIC ALLIANCES',
        heroTitle: 'Partner With Jinsei Bio',
        heroSubtitle: 'Co-development and contract research',
        tracks: [
          CollaborationTrackModel(
            trackId: 'fmcg_01',
            title: 'FMCG Integration',
            badge: 'Pillar 1',
            description: 'Fermentation optimization',
            deliverables: ['Optimization'],
            iconKey: 'sanitizer',
          ),
        ],
        contactInfo: CollaborationContactInfoModel(
          supportEmail: 'collab@jinseibio.com',
          supportNotice: '24h response',
          facilityName: 'NCL Innovation Park',
          facilityAddress: 'Pune, India',
          facilityCoordinates: '18.5362° N, 73.8152° E',
          visitingTimings: 'Mon-Sat',
          visitingStatus: 'By Appointment',
          standards: [],
        ),
        governanceTitle: 'Governance',
        governanceDescription: 'ISO 9001:2015',
      );

      await hiveDataSource.saveCollaborationsContent(sampleContent);
      final cached = await hiveDataSource.getCachedCollaborationsContent();

      expect(cached, isNotNull);
      expect(cached!.headlineBadge, equals('STRATEGIC ALLIANCES'));
      expect(cached.tracks.length, equals(1));
      expect(cached.tracks.first.title, equals('FMCG Integration'));
      expect(cached.contactInfo.supportEmail, equals('collab@jinseibio.com'));
    });

    test('clearCache deletes persisted content from Hive box', () async {
      const sampleContent = CollaborationContentModel(
        headlineBadge: '',
        heroTitle: '',
        heroSubtitle: '',
        tracks: [],
        contactInfo: CollaborationContactInfoModel(
          supportEmail: '',
          supportNotice: '',
          facilityName: '',
          facilityAddress: '',
          facilityCoordinates: '',
          visitingTimings: '',
          visitingStatus: '',
          standards: [],
        ),
        governanceTitle: '',
        governanceDescription: '',
      );

      await hiveDataSource.saveCollaborationsContent(sampleContent);
      await hiveDataSource.clearCache();

      final cached = await hiveDataSource.getCachedCollaborationsContent();
      expect(cached, isNull);
    });
  });
}
