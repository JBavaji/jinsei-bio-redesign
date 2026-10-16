import '../../domain/models/leadership_content_model.dart';
import '../../domain/models/team_member_model.dart';
import '../../domain/repositories/i_team_repository.dart';
import '../datasources/team_local_data_source.dart';
import '../datasources/team_remote_data_source.dart';

class TeamRepositoryImpl implements ITeamRepository {
  final ITeamLocalDataSource _localDataSource;
  final ITeamRemoteDataSource _remoteDataSource;

  TeamRepositoryImpl({
    ITeamLocalDataSource? localDataSource,
    ITeamRemoteDataSource? remoteDataSource,
  })  : _localDataSource = localDataSource ?? TeamLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? TeamRemoteDataSource();

  @override
  Future<LeadershipContentModel> getLeadershipContent() async {
    // 1. Attempt remote Serverpod endpoint first
    final remoteData = await _remoteDataSource.getLeadershipContent();
    if (remoteData != null) {
      return remoteData;
    }

    // 2. Fall back gracefully to bundled asset JSON on error / offline / timeout
    return await _localDataSource.fetchLeadershipContent();
  }

  @override
  Future<List<TeamMemberModel>> getTeamMembers() async {
    final content = await getLeadershipContent();
    return content.members;
  }

  @override
  Future<List<TeamMemberModel>> getTeamMembersByCategory(
      String category) async {
    final members = await getTeamMembers();
    if (category.toLowerCase() == 'all') {
      return members;
    }
    return members
        .where((m) => m.category.toLowerCase() == category.toLowerCase())
        .toList();
  }
}
