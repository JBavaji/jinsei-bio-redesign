import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/data/datasources/collaborations_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_inquiry_model.dart';

void main() {
  group('CollaborationsRemoteDataSource Tests (JIN-68 / JIN-73)', () {
    late CollaborationsRemoteDataSource dataSource;

    setUp(() {
      dataSource = CollaborationsRemoteDataSource(
        client: Client('http://localhost:9999/'),
      );
    });

    test(
        'getCollaborationsContent returns null gracefully when Serverpod server is offline or times out',
        () async {
      final result = await dataSource.getCollaborationsContent(
        timeout: const Duration(milliseconds: 100),
      );
      expect(result, isNull);
    });

    test(
        'submitCollaborationInquiry returns null gracefully when Serverpod server is offline or times out',
        () async {
      const inquiry = CollaborationInquiryModel(
        name: 'Dr. Test Partner',
        email: 'partner@test.com',
        organization: 'Test Org',
        partnershipTrack: 'fmcg_integration',
        message: 'Test message',
      );
      final result = await dataSource.submitCollaborationInquiry(
        inquiry,
        timeout: const Duration(milliseconds: 100),
      );
      expect(result, isNull);
    });
  });
}
