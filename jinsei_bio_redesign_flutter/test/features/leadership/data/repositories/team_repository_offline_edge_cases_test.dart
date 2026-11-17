import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/datasources/team_hive_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/datasources/team_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/datasources/team_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/repositories/team_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/leadership_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_member_model.dart';

class TestTeamAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/data/team_content.json') {
      return File('assets/data/team_content.json').readAsString();
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) async {
    final bytes = await File(key).readAsBytes();
    return ByteData.sublistView(Uint8List.fromList(bytes));
  }
}

class MockRemoteDataSourceThrowsSocket implements ITeamRemoteDataSource {
  @override
  Future<LeadershipContentModel?> getLeadershipContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    throw const SocketException('No Internet Connection');
  }
}

class MockRemoteDataSourceThrowsTimeout implements ITeamRemoteDataSource {
  @override
  Future<LeadershipContentModel?> getLeadershipContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    throw TimeoutException('Server connection timed out');
  }
}

class MockTeamHiveDataSource implements ITeamHiveDataSource {
  LeadershipContentModel? cachedData;
  LeadershipContentModel? savedData;
  bool clearCacheCalled = false;

  MockTeamHiveDataSource({this.cachedData});

  @override
  Future<LeadershipContentModel?> getCachedLeadershipContent() async {
    return cachedData;
  }

  @override
  Future<void> saveLeadershipContent(LeadershipContentModel content) async {
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

  late TeamLocalDataSource localDataSource;

  setUp(() {
    localDataSource = TeamLocalDataSource(bundle: TestTeamAssetBundle());
  });

  group('TeamRepositoryImpl 3-Tier Offline Edge Cases (JIN-76)', () {
    test(
        'EDGE CASE: No internet connection (SocketException) falls back to Hive DB cache if present',
        () async {
      final cachedTeam = LeadershipContentModel(
        headerBadge: 'CACHED BADGE',
        headline: 'Cached Leadership from Hive',
        subhead: 'Cached subhead',
        emblemTitle: 'JINSEI BIOSCIENCE',
        emblemSubtitle: 'Discovery Engine',
        members: [
          TeamMemberModel.fromJson(const {
            'name': 'Dr. Offline Scientist',
            'role': 'Lead Biologist',
            'credentials': 'Ph.D.',
            'bio': 'Offline researcher',
            'category': 'advisors',
            'avatarUrl': 'https://cdn.example.com/offline.webp',
          }),
        ],
      );

      final mockHive = MockTeamHiveDataSource(cachedData: cachedTeam);
      final repository = TeamRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsSocket(),
        hiveDataSource: mockHive,
      );

      final result = await repository.getLeadershipContent();

      // Verify Hive DB cache was loaded successfully
      expect(result.headline, equals('Cached Leadership from Hive'));
      expect(result.members.first.name, equals('Dr. Offline Scientist'));
    });

    test(
        'EDGE CASE: No internet AND empty Hive cache falls back to bundled asset JSON',
        () async {
      final mockEmptyHive = MockTeamHiveDataSource(cachedData: null);
      final repository = TeamRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsSocket(),
        hiveDataSource: mockEmptyHive,
      );

      final result = await repository.getLeadershipContent();

      // Verify fallback all the way to bundled static asset JSON
      expect(result.headline, equals('Leadership & R&D Team'));
      expect(result.members.length, greaterThanOrEqualTo(4));
    });

    test(
        'EDGE CASE: Server timeout (TimeoutException) falls back to Hive DB cache',
        () async {
      const cachedTeam = LeadershipContentModel(
        headerBadge: 'TIMEOUT RECOVERY',
        headline: 'Timeout Recovery Team',
        subhead: 'Subhead',
        emblemTitle: 'EMBLEM',
        emblemSubtitle: 'SUBTITLE',
        members: [],
      );

      final mockHive = MockTeamHiveDataSource(cachedData: cachedTeam);
      final repository = TeamRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: MockRemoteDataSourceThrowsTimeout(),
        hiveDataSource: mockHive,
      );

      final result = await repository.getLeadershipContent();
      expect(result.headline, equals('Timeout Recovery Team'));
    });
  });
}
