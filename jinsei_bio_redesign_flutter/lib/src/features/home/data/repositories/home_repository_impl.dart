import '../../domain/models/home_content_model.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../datasources/home_hive_data_source.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeLocalDataSource _localDataSource;
  final IHomeRemoteDataSource _remoteDataSource;
  final IHomeHiveDataSource _hiveDataSource;

  HomeRepositoryImpl({
    IHomeLocalDataSource? localDataSource,
    IHomeRemoteDataSource? remoteDataSource,
    IHomeHiveDataSource? hiveDataSource,
  })  : _localDataSource = localDataSource ?? HomeLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? HomeRemoteDataSource(),
        _hiveDataSource = hiveDataSource ?? HomeHiveDataSource();

  @override
  Future<HomeContentModel> getHomeContent() async {
    // 1. Attempt API response call
    final remoteData = await _remoteDataSource.getHomeContent();
    if (remoteData != null) {
      // Save successful fresh API payload to Local Hive DB
      await _hiveDataSource.saveHomeContent(remoteData);
      return remoteData;
    }

    // 2. If API fails/offline, check Local Device Hive DB Cache
    final cachedData = await _hiveDataSource.getCachedHomeContent();
    if (cachedData != null) {
      return cachedData;
    }

    // 3. Fallback for very first launch (empty Hive cache) -> static JSON asset
    return await _localDataSource.fetchHomeContent();
  }
}
