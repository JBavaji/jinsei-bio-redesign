import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/datasources/solutions_remote_data_source.dart';

void main() {
  group('SolutionsRemoteDataSource Tests (JIN-18)', () {
    late SolutionsRemoteDataSource dataSource;

    setUp(() {
      dataSource = SolutionsRemoteDataSource(
        client: Client('http://localhost:9999/'),
      );
    });

    test(
        'returns null gracefully when Serverpod server is offline or times out',
        () async {
      final result = await dataSource.getSolutionsContent(
        timeout: const Duration(milliseconds: 100),
      );
      expect(result, isNull);
    });
  });
}
