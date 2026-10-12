import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/datasources/science_remote_data_source.dart';

void main() {
  group('ScienceRemoteDataSource Tests (JIN-60)', () {
    late ScienceRemoteDataSource dataSource;

    setUp(() {
      dataSource = ScienceRemoteDataSource(
        client: Client('http://localhost:9999/'),
      );
    });

    test(
        'returns null gracefully when Serverpod server is offline or times out',
        () async {
      final result = await dataSource.getScienceContent(
        timeout: const Duration(milliseconds: 100),
      );
      expect(result, isNull);
    });
  });
}
