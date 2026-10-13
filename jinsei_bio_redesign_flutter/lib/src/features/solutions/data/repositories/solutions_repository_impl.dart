import '../../domain/models/solution_card_model.dart';
import '../../domain/models/solution_metric_model.dart';
import '../../domain/models/solutions_content_model.dart';
import '../../domain/repositories/i_solutions_repository.dart';
import '../datasources/solutions_local_data_source.dart';
import '../datasources/solutions_remote_data_source.dart';

class SolutionsRepositoryImpl implements ISolutionsRepository {
  final ISolutionsLocalDataSource _localDataSource;
  final ISolutionsRemoteDataSource _remoteDataSource;

  SolutionsRepositoryImpl({
    ISolutionsLocalDataSource? localDataSource,
    ISolutionsRemoteDataSource? remoteDataSource,
  })  : _localDataSource = localDataSource ?? SolutionsLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? SolutionsRemoteDataSource();

  @override
  Future<SolutionsContentModel> getSolutionsContent() async {
    // 1. Attempt remote Serverpod endpoint first
    final remoteData = await _remoteDataSource.getSolutionsContent();
    if (remoteData != null) {
      return remoteData;
    }

    // 2. Fall back gracefully to bundled asset JSON on error / offline / timeout
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
