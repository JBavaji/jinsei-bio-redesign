import '../../domain/models/science_content_model.dart';
import '../../domain/repositories/i_science_repository.dart';
import '../datasources/science_local_data_source.dart';
import '../datasources/science_remote_data_source.dart';

class ScienceRepositoryImpl implements IScienceRepository {
  final IScienceLocalDataSource _localDataSource;
  final IScienceRemoteDataSource _remoteDataSource;

  ScienceRepositoryImpl({
    IScienceLocalDataSource? localDataSource,
    IScienceRemoteDataSource? remoteDataSource,
  })  : _localDataSource = localDataSource ?? ScienceLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? ScienceRemoteDataSource();

  @override
  Future<ScienceContentModel> getScienceContent() async {
    // 1. Attempt remote Serverpod endpoint first
    final remoteData = await _remoteDataSource.getScienceContent();
    if (remoteData != null) {
      return remoteData;
    }

    // 2. Fall back gracefully to bundled asset JSON on error / offline / timeout
    return await _localDataSource.fetchScienceContent();
  }
}
