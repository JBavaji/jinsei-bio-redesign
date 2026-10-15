import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/datasources/team_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/datasources/team_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/repositories/team_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/governance_assurance_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/leadership_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_member_model.dart';

class TestTeamAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/data/leadership_content.json') {
      return File('assets/data/leadership_content.json').readAsString();
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) async {
    final bytes = await File(key).readAsBytes();
    return ByteData.sublistView(Uint8List.fromList(bytes));
  }
}

class FakeSuccessfulTeamRemoteDataSource implements ITeamRemoteDataSource {
  final LeadershipContentModel mockContent;

  FakeSuccessfulTeamRemoteDataSource(this.mockContent);

  @override
  Future<LeadershipContentModel?> getLeadershipContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    return mockContent;
  }
}

class FakeFailingTeamRemoteDataSource implements ITeamRemoteDataSource {
  @override
  Future<LeadershipContentModel?> getLeadershipContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    return null;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TeamRepositoryImpl Tests', () {
    late TeamLocalDataSource localDataSource;
    const testMember1 = TeamMemberModel(
      memberId: 'lead_ria',
      name: 'Dr. Ria Deshpande, PhD',
      role: 'CEO',
      categoryTag: 'Executive Lead',
      category: 'executive',
      academicCredential: 'PhD UC Irvine',
      areaOfExpertise: 'Leadership',
      imageUrl: null,
      displayOrder: 1,
    );
    const testMember2 = TeamMemberModel(
      memberId: 'lead_kiran',
      name: 'Dr. Kirankumar Beede',
      role: 'Principal Scientist',
      categoryTag: 'Principal Scientist',
      category: 'scientific',
      academicCredential: 'PhD Biochemistry',
      areaOfExpertise: 'Characterization',
      imageUrl: null,
      displayOrder: 2,
    );

    const mockRemoteContent = LeadershipContentModel(
      headerBadge: 'REMOTE BADGE',
      headline: 'Remote Headline',
      subhead: 'Remote Subhead',
      emblemTitle: 'JINSEI BIOSCIENCE',
      emblemSubtitle: 'Translational Engine',
      members: [testMember1, testMember2],
      governanceAssurance: GovernanceAssuranceModel(
        title: 'Assurance',
        description: 'ISO',
        badgeText: 'Pune',
        complianceStandard: 'Compliant',
      ),
    );

    setUp(() {
      localDataSource = TeamLocalDataSource(bundle: TestTeamAssetBundle());
    });

    test('Returns remote data when remote data source returns content',
        () async {
      final repository = TeamRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeSuccessfulTeamRemoteDataSource(mockRemoteContent),
      );

      final result = await repository.getLeadershipContent();

      expect(result.headerBadge, 'REMOTE BADGE');
      expect(result.members.length, 2);
      expect(result.members.first.name, 'Dr. Ria Deshpande, PhD');
    });

    test(
        'Falls back to local asset JSON when remote data source fails / is null',
        () async {
      final repository = TeamRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeFailingTeamRemoteDataSource(),
      );

      final result = await repository.getLeadershipContent();

      expect(result.headline, 'Leadership & R&D Team');
      expect(result.members.isNotEmpty, isTrue);
      expect(result.members.length, 8);
      expect(result.members.first.name, 'Dr. Ria Deshpande, PhD');
    });

    test('getTeamMembers returns full list of members', () async {
      final repository = TeamRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeSuccessfulTeamRemoteDataSource(mockRemoteContent),
      );

      final members = await repository.getTeamMembers();
      expect(members.length, 2);
    });

    test('getTeamMembersByCategory returns filtered members', () async {
      final repository = TeamRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: FakeSuccessfulTeamRemoteDataSource(mockRemoteContent),
      );

      final executives = await repository.getTeamMembersByCategory('executive');
      expect(executives.length, 1);
      expect(executives.first.name, 'Dr. Ria Deshpande, PhD');

      final all = await repository.getTeamMembersByCategory('all');
      expect(all.length, 2);
    });
  });
}
