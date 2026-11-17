import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/data/datasources/b2b_hive_data_source.dart';
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

class MockB2bHiveDataSource implements IB2bHiveDataSource {
  B2bModalContentModel? cachedData;
  B2bModalContentModel? savedData;
  bool clearCacheCalled = false;

  MockB2bHiveDataSource({this.cachedData});

  @override
  Future<B2bModalContentModel?> getCachedModalContent() async {
    return cachedData;
  }

  @override
  Future<void> saveModalContent(B2bModalContentModel content) async {
    savedData = content;
    cachedData = content;
  }

  @override
  Future<void> clearCache() async {
    clearCacheCalled = true;
    cachedData = null;
  }
}

void main() {
  group('B2bRepositoryImpl 3-Tier Fallback Tests (JIN-22 / JIN-76)', () {
    late MockRemoteDataSource remoteDataSource;
    late MockLocalDataSource localDataSource;
    late MockB2bHiveDataSource hiveDataSource;
    late B2bRepositoryImpl repository;

    const dummyRequest = B2bSampleRequestModel(
      strainId: 'gut_pro',
      fullName: 'Dr. Test',
      email: 'test@pharma.org',
      company: 'Test Bio',
      formulationFormat: 'powder',
    );

    setUp(() {
      remoteDataSource = MockRemoteDataSource();
      localDataSource = MockLocalDataSource();
      hiveDataSource = MockB2bHiveDataSource();
      repository = B2bRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
        hiveDataSource: hiveDataSource,
      );
    });

    test(
        'Tier 1: getModalContent returns remote data and saves to Hive when remote succeeds',
        () async {
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
      expect(hiveDataSource.savedData?.badgeText, equals('REMOTE BADGE'));
    });

    test(
        'Tier 2: getModalContent falls back to Hive DB cache when remote returns null',
        () async {
      remoteDataSource.mockModalContent = null;
      hiveDataSource.cachedData = const B2bModalContentModel(
        badgeText: 'HIVE CACHED BADGE',
        title: 'Hive Title',
        subtitle: 'Hive Subtitle',
        strains: [],
        formulationFormats: [],
        complianceNote: '',
        certifications: [],
        dispatchNotice: '',
      );

      final result = await repository.getModalContent();
      expect(result.badgeText, equals('HIVE CACHED BADGE'));
    });

    test(
        'Tier 3: getModalContent falls back to local data when remote throws and Hive cache is empty',
        () async {
      remoteDataSource.shouldThrow = true;
      hiveDataSource.cachedData = null;

      final result = await repository.getModalContent();
      expect(result.badgeText, equals('LOCAL BADGE'));
      expect(result.strains.length, equals(1));
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
