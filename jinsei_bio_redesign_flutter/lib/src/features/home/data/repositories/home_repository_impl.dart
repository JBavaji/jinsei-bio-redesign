import '../../domain/models/home_content_model.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeLocalDataSource _localDataSource;

  HomeRepositoryImpl({
    IHomeLocalDataSource? localDataSource,
  }) : _localDataSource = localDataSource ?? HomeLocalDataSource();

  @override
  Future<HomeContentModel> getHomeContent() async {
    return await _localDataSource.fetchHomeContent();
  }
}
