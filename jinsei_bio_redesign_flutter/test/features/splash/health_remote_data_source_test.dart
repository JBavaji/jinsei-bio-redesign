import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/splash/data/datasources/health_remote_data_source.dart';

class MockHealthRemoteDataSource implements IHealthRemoteDataSource {
  final bool shouldSucceed;
  final Duration delay;

  MockHealthRemoteDataSource(
      {this.shouldSucceed = true, this.delay = Duration.zero});

  @override
  Future<bool> checkServerHealth({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    if (delay > Duration.zero) {
      await Future.delayed(delay);
    }
    if (delay > timeout) {
      return false;
    }
    return shouldSucceed;
  }
}

void main() {
  group('HealthRemoteDataSource Tests', () {
    test('returns true when Serverpod health check succeeds within timeout',
        () async {
      final dataSource = MockHealthRemoteDataSource(shouldSucceed: true);
      final result = await dataSource.checkServerHealth();
      expect(result, isTrue);
    });

    test('returns false gracefully when Serverpod health check times out',
        () async {
      final dataSource = MockHealthRemoteDataSource(
        shouldSucceed: true,
        delay: const Duration(milliseconds: 6000),
      );
      final result = await dataSource.checkServerHealth(
        timeout: const Duration(milliseconds: 100),
      );
      expect(result, isFalse);
    });

    test('returns false gracefully on network failure', () async {
      final dataSource = MockHealthRemoteDataSource(shouldSucceed: false);
      final result = await dataSource.checkServerHealth();
      expect(result, isFalse);
    });
  });
}
