import '../../domain/models/b2b_modal_content_model.dart';
import '../../domain/models/b2b_sample_request_model.dart';
import '../../domain/repositories/i_b2b_repository.dart';
import '../datasources/b2b_local_data_source.dart';
import '../datasources/b2b_remote_data_source.dart';

class B2bRepositoryImpl implements IB2bRepository {
  final IB2bLocalDataSource _localDataSource;
  final IB2bRemoteDataSource _remoteDataSource;

  B2bRepositoryImpl({
    IB2bLocalDataSource? localDataSource,
    IB2bRemoteDataSource? remoteDataSource,
  })  : _localDataSource = localDataSource ?? B2bLocalDataSource(),
        _remoteDataSource = remoteDataSource ?? B2bRemoteDataSource();

  @override
  Future<B2bModalContentModel> getModalContent() async {
    try {
      // 1. Attempt remote Serverpod endpoint first
      final remoteData = await _remoteDataSource.getModalContent();
      if (remoteData != null) {
        return remoteData;
      }
    } catch (_) {
      // Graceful fallback to local asset data
    }

    // 2. Fall back gracefully to bundled asset JSON on error / offline / timeout
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
