import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/datasources/home_remote_data_source.dart';

void main() {
  group('HomeRemoteDataSource Tests', () {
    late HomeRemoteDataSource dataSource;

    setUp(() {
      dataSource = HomeRemoteDataSource(
        client: Client('http://localhost:9999/'),
      );
    });

    test(
        'returns null gracefully when Serverpod server is offline or times out',
        () async {
      final result = await dataSource.getHomeContent(
        timeout: const Duration(milliseconds: 100),
      );
      expect(result, isNull);
    });
  });
}
