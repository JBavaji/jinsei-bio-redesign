import '../../domain/models/science_content_model.dart';
import '../../domain/repositories/i_science_repository.dart';
import '../datasources/science_local_data_source.dart';

class ScienceRepositoryImpl implements IScienceRepository {
  final IScienceLocalDataSource _localDataSource;

  ScienceRepositoryImpl({
    IScienceLocalDataSource? localDataSource,
  }) : _localDataSource = localDataSource ?? ScienceLocalDataSource();

  @override
  Future<ScienceContentModel> getScienceContent() async {
    return await _localDataSource.fetchScienceContent();
  }
}
