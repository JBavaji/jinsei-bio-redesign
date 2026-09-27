import 'dart:async';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import '../../../../core/config/app_config.dart';

abstract class IHealthRemoteDataSource {
  Future<bool> checkServerHealth(
      {Duration timeout = const Duration(milliseconds: 5000)});
}

class HealthRemoteDataSource implements IHealthRemoteDataSource {
  final Client _client;

  HealthRemoteDataSource({Client? client})
      : _client = client ?? Client(AppConfig.serverpodUrl);

  @override
  Future<bool> checkServerHealth({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final response = await _client.health.ping().timeout(timeout);
      return response.isNotEmpty;
    } catch (_) {
      // Graceful fallback on network error or Cloud Run cold start timeout
      return false;
    }
  }
}
