import '../../domain/models/b2b_modal_content_model.dart';
import '../../domain/models/b2b_sample_request_model.dart';
import '../../domain/repositories/i_b2b_repository.dart';
import '../datasources/b2b_hive_data_source.dart';
import '../datasources/b2b_local_data_source.dart';
import '../datasources/b2b_remote_data_source.dart';

class B2bRepositoryImpl implements IB2bRepository {
  final IB2bLocalDataSource _localDataSource;
  final IB2bRemoteDataSource _remoteDataSource;
  final IB2bHiveDataSource _hiveDataSource;

  B2bRepositoryImpl({
    IB2bLocalDataSource? localDataSource,
    IB2bRemoteDataSource? remoteDataSource,
    IB2bHiveDataSource? hiveDataSource,
  })  : _localDataSource = localDataSource ?? B2bLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? B2bRemoteDataSource(),
        _hiveDataSource = hiveDataSource ?? B2bHiveDataSource();

  @override
  Future<B2bModalContentModel> getModalContent() async {
    try {
      // 1. Attempt remote Serverpod endpoint first
      final remoteData = await _remoteDataSource.getModalContent();
      if (remoteData != null) {
        // Save fresh API payload to Local Hive DB
        await _hiveDataSource.saveModalContent(remoteData);
        return remoteData;
      }
    } catch (_) {
      // Graceful fallback to local cache
    }

    // 2. If API fails/offline, check Local Device Hive DB Cache
    final cachedData = await _hiveDataSource.getCachedModalContent();
    if (cachedData != null) {
      return cachedData;
    }

    // 3. Fall back gracefully to bundled asset JSON on empty Hive cache
    return await _localDataSource.fetchModalContent();
  }

  @override
  Future<String> submitSampleRequest(B2bSampleRequestModel request) async {
    try {
      // 1. Attempt remote Serverpod submission first
      final remoteTrackingId =
          await _remoteDataSource.submitSampleRequest(request);
      if (remoteTrackingId != null && remoteTrackingId.isNotEmpty) {
        return remoteTrackingId;
      }
    } catch (_) {
      // Graceful fallback to local sandbox persistence
    }

    // 2. Fall back to local sandbox mock persistence
    return await _localDataSource.saveOfflineRequest(request);
  }
}
