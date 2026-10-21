import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/data/datasources/b2b_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/data/datasources/b2b_remote_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/data/repositories/b2b_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_modal_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_sample_request_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/formulation_format_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/strain_vertical_option_model.dart';

class MockRemoteDataSource implements IB2bRemoteDataSource {
  B2bModalContentModel? mockModalContent;
  String? mockTrackingId;
  bool shouldThrow = false;

  @override
  Future<B2bModalContentModel?> getModalContent(
      {Duration timeout = const Duration(milliseconds: 5000)}) async {
    if (shouldThrow) throw Exception('Remote network timeout');
    return mockModalContent;
  }

  @override
  Future<String?> submitSampleRequest(B2bSampleRequestModel request,
      {Duration timeout = const Duration(milliseconds: 5000)}) async {
    if (shouldThrow) throw Exception('Server offline');
    return mockTrackingId;
  }
}

class MockLocalDataSource implements IB2bLocalDataSource {
  final B2bModalContentModel stubContent = const B2bModalContentModel(
    badgeText: 'LOCAL BADGE',
    title: 'Local Title',
    subtitle: 'Local Subtitle',
    strains: [
      StrainVerticalOptionModel(
        strainId: 'gut_pro',
        category: 'HEALTH',
        name: 'Gut Pro',
        strainCode: 'JN-04',
        highlight: 'Adhesion',
        defaultFormat: 'powder',
      ),
    ],
    formulationFormats: [
      FormulationFormatOptionModel(
        formatId: 'powder',
        label: 'Powder',
      ),
    ],
    complianceNote: 'Local Note',
    certifications: ['GMP'],
    dispatchNotice: 'Local Notice',
  );

  @override
  Future<B2bModalContentModel> fetchModalContent() async => stubContent;

  @override
  Future<String> saveOfflineRequest(B2bSampleRequestModel request) async =>
      'JIN-REQ-2026-SANDBOX999';
}

void main() {
  group('B2bRepositoryImpl 3-Tier Fallback Tests (JIN-22)', () {
    late MockRemoteDataSource remoteDataSource;
    late MockLocalDataSource localDataSource;
    late B2bRepositoryImpl repository;

    final dummyRequest = const B2bSampleRequestModel(
      strainId: 'gut_pro',
      fullName: 'Dr. Test',
      email: 'test@pharma.org',
      company: 'Test Bio',
      formulationFormat: 'powder',
    );

    setUp(() {
      remoteDataSource = MockRemoteDataSource();
      localDataSource = MockLocalDataSource();
      repository = B2bRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );
    });

    test('getModalContent returns remote data when remote succeeds', () async {
      remoteDataSource.mockModalContent = const B2bModalContentModel(
        badgeText: 'REMOTE BADGE',
        title: 'Remote Title',
        subtitle: 'Remote Subtitle',
        strains: [],
        formulationFormats: [],
        complianceNote: '',
        certifications: [],
        dispatchNotice: '',
      );

      final result = await repository.getModalContent();
      expect(result.badgeText, equals('REMOTE BADGE'));
    });

    test('getModalContent falls back to local data when remote returns null',
        () async {
      remoteDataSource.mockModalContent = null;

      final result = await repository.getModalContent();
      expect(result.badgeText, equals('LOCAL BADGE'));
      expect(result.strains.length, equals(1));
    });

    test('getModalContent falls back to local data when remote throws',
        () async {
      remoteDataSource.shouldThrow = true;

      final result = await repository.getModalContent();
      expect(result.badgeText, equals('LOCAL BADGE'));
    });

    test('submitSampleRequest returns remote tracking ID when remote succeeds',
        () async {
      remoteDataSource.mockTrackingId = 'JIN-REQ-2026-REMOTE123';

      final trackingId = await repository.submitSampleRequest(dummyRequest);
      expect(trackingId, equals('JIN-REQ-2026-REMOTE123'));
    });

    test('submitSampleRequest falls back to sandbox ID when remote is offline',
        () async {
      remoteDataSource.mockTrackingId = null;

      final trackingId = await repository.submitSampleRequest(dummyRequest);
      expect(trackingId, equals('JIN-REQ-2026-SANDBOX999'));
    });
  });
}
