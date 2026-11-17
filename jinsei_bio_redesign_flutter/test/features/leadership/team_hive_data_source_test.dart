import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/datasources/team_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/leadership_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_member_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late Box testBox;
  late TeamHiveDataSource hiveDataSource;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync('team_hive_test_');
    Hive.init(tempDir.path);
    testBox = await Hive.openBox('test_team_box');
    hiveDataSource = TeamHiveDataSource(box: testBox);
  });

  tearDown(() async {
    await testBox.clear();
    await testBox.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('TeamHiveDataSource Tests (JIN-76)', () {
    test('getCachedLeadershipContent returns null when box is empty', () async {
      final cached = await hiveDataSource.getCachedLeadershipContent();
      expect(cached, isNull);
    });

    test(
        'saveLeadershipContent persists model and returns it on getCachedLeadershipContent',
        () async {
      final sampleContent = LeadershipContentModel(
        headerBadge: 'ONE TEAM, ONE VISION',
        headline: 'Leadership & R&D Team',
        subhead: 'Subhead',
        emblemTitle: 'JINSEI BIOSCIENCE',
        emblemSubtitle: 'Discovery Engine',
        members: [
          TeamMemberModel.fromJson(const {
            'name': 'Dr. Marcus Vance',
            'role': 'Co-CTO Infrastructure',
            'credentials': 'Ph.D. Bioinformatics',
            'bio': 'Infrastructure architect',
            'category': 'executive',
            'avatarUrl': 'https://cdn.example.com/marcus.webp',
          }),
        ],
      );

      await hiveDataSource.saveLeadershipContent(sampleContent);
      final cached = await hiveDataSource.getCachedLeadershipContent();

      expect(cached, isNotNull);
      expect(cached!.headline, equals('Leadership & R&D Team'));
      expect(cached.members.length, equals(1));
      expect(cached.members.first.name, equals('Dr. Marcus Vance'));
    });

    test('clearCache deletes persisted content from Hive box', () async {
      const sampleContent = LeadershipContentModel(
        headerBadge: '',
        headline: '',
        subhead: '',
        emblemTitle: '',
        emblemSubtitle: '',
        members: [],
      );

      await hiveDataSource.saveLeadershipContent(sampleContent);
      await hiveDataSource.clearCache();

      final cached = await hiveDataSource.getCachedLeadershipContent();
      expect(cached, isNull);
    });
  });
}
