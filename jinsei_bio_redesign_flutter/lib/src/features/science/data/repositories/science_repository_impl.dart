import '../../domain/models/science_content_model.dart';
import '../../domain/repositories/i_science_repository.dart';
import '../datasources/science_hive_data_source.dart';
import '../datasources/science_local_data_source.dart';
import '../datasources/science_remote_data_source.dart';

class ScienceRepositoryImpl implements IScienceRepository {
  final IScienceLocalDataSource _localDataSource;
  final IScienceRemoteDataSource _remoteDataSource;
  final IScienceHiveDataSource _hiveDataSource;

  ScienceRepositoryImpl({
    IScienceLocalDataSource? localDataSource,
    IScienceRemoteDataSource? remoteDataSource,
    IScienceHiveDataSource? hiveDataSource,
  })  : _localDataSource = localDataSource ?? ScienceLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? ScienceRemoteDataSource(),
        _hiveDataSource = hiveDataSource ?? ScienceHiveDataSource();

  @override
  Future<ScienceContentModel> getScienceContent() async {
    // 1. Attempt remote Serverpod endpoint first
    try {
      final remoteData = await _remoteDataSource.getScienceContent();
      if (remoteData != null) {
        // Save fresh API payload to Local Hive DB
        await _hiveDataSource.saveScienceContent(remoteData);
        return remoteData;
      }
    } catch (_) {
      // Graceful degradation on network/endpoint error
    }

    // 2. If API fails/offline, check Local Device Hive DB Cache
    final cachedData = await _hiveDataSource.getCachedScienceContent();
    if (cachedData != null) {
      return cachedData;
    }

    // 3. Fallback for very first launch (empty Hive cache) -> static JSON asset
    return await _localDataSource.fetchScienceContent();
  }
}
