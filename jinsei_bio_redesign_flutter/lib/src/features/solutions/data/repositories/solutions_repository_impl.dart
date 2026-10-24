import '../../domain/models/solution_card_model.dart';
import '../../domain/models/solution_metric_model.dart';
import '../../domain/models/solutions_content_model.dart';
import '../../domain/repositories/i_solutions_repository.dart';
import '../datasources/solutions_hive_data_source.dart';
import '../datasources/solutions_local_data_source.dart';
import '../datasources/solutions_remote_data_source.dart';

class SolutionsRepositoryImpl implements ISolutionsRepository {
  final ISolutionsLocalDataSource _localDataSource;
  final ISolutionsRemoteDataSource _remoteDataSource;
  final ISolutionsHiveDataSource _hiveDataSource;

  SolutionsRepositoryImpl({
    ISolutionsLocalDataSource? localDataSource,
    ISolutionsRemoteDataSource? remoteDataSource,
    ISolutionsHiveDataSource? hiveDataSource,
  })  : _localDataSource = localDataSource ?? SolutionsLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? SolutionsRemoteDataSource(),
        _hiveDataSource = hiveDataSource ?? SolutionsHiveDataSource();

  @override
  Future<SolutionsContentModel> getSolutionsContent() async {
    // 1. Attempt remote Serverpod endpoint first
    try {
      final remoteData = await _remoteDataSource.getSolutionsContent();
      if (remoteData != null) {
        // Save fresh API payload to Local Hive DB
        await _hiveDataSource.saveSolutionsContent(remoteData);
        return remoteData;
      }
    } catch (_) {
      // Graceful degradation on network/endpoint error
    }

    // 2. If API fails/offline, check Local Device Hive DB Cache
    final cachedData = await _hiveDataSource.getCachedSolutionsContent();
    if (cachedData != null) {
      return cachedData;
    }

    // 3. Fallback for very first launch (empty Hive cache) -> static JSON asset
    return await _localDataSource.fetchSolutionsContent();
  }

  @override
  Future<List<SolutionCardModel>> getSolutions() async {
    final content = await getSolutionsContent();
    return content.solutions;
  }

  @override
  Future<List<SolutionCardModel>> getSolutionsByCategory(
      String category) async {
    final solutions = await getSolutions();
    if (category.toLowerCase() == 'all') {
      return solutions;
    }
    return solutions
        .where((s) => s.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  @override
  Future<List<SolutionMetricModel>> getSolutionMetrics() async {
    final content = await getSolutionsContent();
    return content.metrics;
  }
}
