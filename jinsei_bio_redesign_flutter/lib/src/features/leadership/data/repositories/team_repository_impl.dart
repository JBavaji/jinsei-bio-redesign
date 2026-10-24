import '../../domain/models/leadership_content_model.dart';
import '../../domain/models/team_member_model.dart';
import '../../domain/repositories/i_team_repository.dart';
import '../datasources/team_hive_data_source.dart';
import '../datasources/team_local_data_source.dart';
import '../datasources/team_remote_data_source.dart';

class TeamRepositoryImpl implements ITeamRepository {
  final ITeamLocalDataSource _localDataSource;
  final ITeamRemoteDataSource _remoteDataSource;
  final ITeamHiveDataSource _hiveDataSource;

  TeamRepositoryImpl({
    ITeamLocalDataSource? localDataSource,
    ITeamRemoteDataSource? remoteDataSource,
    ITeamHiveDataSource? hiveDataSource,
  })  : _localDataSource = localDataSource ?? TeamLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? TeamRemoteDataSource(),
        _hiveDataSource = hiveDataSource ?? TeamHiveDataSource();

  @override
  Future<LeadershipContentModel> getLeadershipContent() async {
    // 1. Attempt remote Serverpod endpoint first
    try {
      final remoteData = await _remoteDataSource.getLeadershipContent();
      if (remoteData != null) {
        // Save fresh API payload to Local Hive DB
        await _hiveDataSource.saveLeadershipContent(remoteData);
        return remoteData;
      }
    } catch (_) {
      // Graceful degradation on network/endpoint error
    }

    // 2. If API fails/offline, check Local Device Hive DB Cache
    final cachedData = await _hiveDataSource.getCachedLeadershipContent();
    if (cachedData != null) {
      return cachedData;
    }

    // 3. Fallback for very first launch (empty Hive cache) -> static JSON asset
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
