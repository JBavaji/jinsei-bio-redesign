import '../../domain/models/home_content_model.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeLocalDataSource _localDataSource;
  final IHomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl({
    IHomeLocalDataSource? localDataSource,
    IHomeRemoteDataSource? remoteDataSource,
  })  : _localDataSource = localDataSource ?? HomeLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? HomeRemoteDataSource();

  @override
  Future<HomeContentModel> getHomeContent() async {
    final remoteData = await _remoteDataSource.getHomeContent();
    if (remoteData != null) {
      return remoteData;
    }
    return await _localDataSource.fetchHomeContent();
  }
}
