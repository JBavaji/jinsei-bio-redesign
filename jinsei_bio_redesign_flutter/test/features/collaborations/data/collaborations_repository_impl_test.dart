import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/data/datasources/collaborations_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/data/datasources/collaborations_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/data/repositories/collaborations_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_contact_info_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_inquiry_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_track_model.dart';

class MockRemoteDataSource implements ICollaborationsRemoteDataSource {
  CollaborationContentModel? mockContent;
  String? mockTrackingId;
  bool shouldThrow = false;

  @override
  Future<CollaborationContentModel?> getCollaborationsContent(
      {Duration timeout = const Duration(milliseconds: 5000)}) async {
    if (shouldThrow) throw Exception('Remote network timeout');
    return mockContent;
  }

  @override
  Future<String?> submitCollaborationInquiry(CollaborationInquiryModel inquiry,
      {Duration timeout = const Duration(milliseconds: 5000)}) async {
    if (shouldThrow) throw Exception('Server offline');
    return mockTrackingId;
  }
}

class MockLocalDataSource implements ICollaborationsLocalDataSource {
  final CollaborationContentModel stubContent = const CollaborationContentModel(
    headlineBadge: 'LOCAL BADGE',
    heroTitle: 'Local Title',
    heroSubtitle: 'Local Subtitle',
    tracks: [
      CollaborationTrackModel(
        trackId: 'local_track',
        title: 'Local Track',
        badge: 'Pillar 1',
        description: 'Local Description',
        deliverables: ['D1'],
        iconKey: 'science',
      ),
    ],
    contactInfo: CollaborationContactInfoModel(
      supportEmail: 'local@jinseibio.com',
      supportNotice: 'Local notice',
      facilityName: 'Local Facility',
      facilityAddress: 'Local Address',
      facilityCoordinates: '0, 0',
      visitingTimings: 'Mon-Fri',
      visitingStatus: 'Open',
      standards: [],
    ),
    governanceTitle: 'Local Governance',
    governanceDescription: 'Local Standards',
  );

  bool shouldThrow = false;

  @override
  Future<CollaborationContentModel> fetchCollaborationsContent() async {
    if (shouldThrow) throw Exception('Asset file corrupted');
    return stubContent;
  }

  @override
  Future<String> saveOfflineInquiry(CollaborationInquiryModel inquiry) async =>
      'JIN-COL-2026-SANDBOX999';
}

void main() {
  group('CollaborationsRepositoryImpl 3-Tier Fallback Tests (JIN-68 / JIN-70)',
      () {
    late MockRemoteDataSource remoteDataSource;
    late MockLocalDataSource localDataSource;
    late CollaborationsRepositoryImpl repository;

    const dummyInquiry = CollaborationInquiryModel(
      name: 'Dr. Test Partner',
      email: 'partner@test.org',
      partnershipTrack: 'FMCG Integration',
      message: 'Exploring commercial licensing',
    );

    setUp(() {
      remoteDataSource = MockRemoteDataSource();
      localDataSource = MockLocalDataSource();
      repository = CollaborationsRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );
    });

    test(
        'Tier 1: getCollaborationsContent returns remote data when remote succeeds',
        () async {
      remoteDataSource.mockContent = const CollaborationContentModel(
        headlineBadge: 'REMOTE BADGE',
        heroTitle: 'Remote Title',
        heroSubtitle: 'Remote Subtitle',
        tracks: [],
        contactInfo: CollaborationContactInfoModel(
          supportEmail: 'remote@jinseibio.com',
          supportNotice: '',
          facilityName: '',
          facilityAddress: '',
          facilityCoordinates: '',
          visitingTimings: '',
          visitingStatus: '',
          standards: [],
        ),
        governanceTitle: '',
        governanceDescription: '',
      );

      final result = await repository.getCollaborationsContent();
      expect(result.headlineBadge, equals('REMOTE BADGE'));
    });

    test(
        'Tier 2: getCollaborationsContent falls back to local data when remote returns null',
        () async {
      remoteDataSource.mockContent = null;

      final result = await repository.getCollaborationsContent();
      expect(result.headlineBadge, equals('LOCAL BADGE'));
      expect(result.tracks.length, equals(1));
    });

    test(
        'Tier 2: getCollaborationsContent falls back to local data when remote throws',
        () async {
      remoteDataSource.shouldThrow = true;

      final result = await repository.getCollaborationsContent();
      expect(result.headlineBadge, equals('LOCAL BADGE'));
    });

    test(
        'Tier 3: getCollaborationsContent falls back to in-memory model when both remote and local fail',
        () async {
      remoteDataSource.shouldThrow = true;
      localDataSource.shouldThrow = true;

      final result = await repository.getCollaborationsContent();
      expect(
          result.headlineBadge, equals('STRATEGIC ALLIANCES & CRO SERVICES'));
      expect(result.tracks.length, equals(3));
    });

    test(
        'Tier 1: submitCollaborationInquiry returns remote tracking ID when remote succeeds',
        () async {
      remoteDataSource.mockTrackingId = 'JIN-COL-2026-REMOTE888';

      final trackingId =
          await repository.submitCollaborationInquiry(dummyInquiry);
      expect(trackingId, equals('JIN-COL-2026-REMOTE888'));
    });

    test(
        'Tier 2: submitCollaborationInquiry falls back to sandbox ID when remote is offline',
        () async {
      remoteDataSource.mockTrackingId = null;

      final trackingId =
          await repository.submitCollaborationInquiry(dummyInquiry);
      expect(trackingId, equals('JIN-COL-2026-SANDBOX999'));
    });
  });
}
