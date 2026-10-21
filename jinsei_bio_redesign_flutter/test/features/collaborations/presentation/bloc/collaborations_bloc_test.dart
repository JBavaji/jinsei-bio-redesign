import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_contact_info_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_inquiry_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_track_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/repositories/i_collaborations_repository.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/bloc/collaborations_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/bloc/collaborations_event.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/bloc/collaborations_state.dart';

class MockCollaborationsRepository implements ICollaborationsRepository {
  CollaborationContentModel stubContent = const CollaborationContentModel(
    headlineBadge: 'STRATEGIC ALLIANCES & CRO SERVICES',
    heroTitle: 'LOOKING TO COLLABORATE WITH US?',
    heroSubtitle: 'Partnering with FMCG leaders',
    tracks: [
      CollaborationTrackModel(
        trackId: 'fmcg_integration',
        title: '1. FMCG Integration',
        badge: 'Pillar 1',
        description: 'Include indigenous strains',
        deliverables: ['Dossiers'],
        iconKey: 'sanitizer',
      ),
    ],
    contactInfo: CollaborationContactInfoModel(
      supportEmail: 'info@jinseibio.com',
      supportNotice: '24h notice',
      facilityName: 'Campus',
      facilityAddress: 'Pashan, Pune',
      facilityCoordinates: '18.5362° N, 73.8152° E',
      visitingTimings: 'Mon-Sat: By Appointment',
      visitingStatus: 'By Appointment',
      standards: [],
    ),
    governanceTitle: 'Ethics',
    governanceDescription: 'ISO 9001',
  );

  String stubTrackingId = 'JIN-COL-2026-TEST123';
  bool shouldThrowContent = false;
  bool shouldThrowSubmit = false;

  @override
  Future<CollaborationContentModel> getCollaborationsContent() async {
    if (shouldThrowContent) throw Exception('Content fetch failed');
    return stubContent;
  }

  @override
  Future<String> submitCollaborationInquiry(
      CollaborationInquiryModel inquiry) async {
    if (shouldThrowSubmit) throw Exception('Inquiry submit failed');
    return stubTrackingId;
  }
}

void main() {
  group('CollaborationsBloc Tests (JIN-68 / JIN-71)', () {
    late MockCollaborationsRepository repository;

    setUp(() {
      repository = MockCollaborationsRepository();
    });

    test('initial state has idle status and default values', () {
      final bloc = CollaborationsBloc(repository: repository);
      expect(bloc.state.status, equals(CollaborationsStatus.idle));
      expect(bloc.state.isIdle, isTrue);
      expect(bloc.state.name, isEmpty);
      expect(bloc.state.email, isEmpty);
      expect(bloc.state.organization, isEmpty);
      expect(bloc.state.partnershipTrack, equals('FMCG Product Integration'));
      expect(bloc.state.message, isEmpty);
      expect(bloc.state.trackingId, isNull);
    });

    blocTest<CollaborationsBloc, CollaborationsState>(
      'emits [loading, loaded] on LoadCollaborationsContentEvent',
      build: () => CollaborationsBloc(repository: repository),
      act: (bloc) => bloc.add(const LoadCollaborationsContentEvent()),
      expect: () => [
        const CollaborationsState(status: CollaborationsStatus.loading),
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.loaded &&
            state.isLoaded &&
            state.content != null &&
            state.content!.headlineBadge ==
                'STRATEGIC ALLIANCES & CRO SERVICES'),
      ],
    );

    blocTest<CollaborationsBloc, CollaborationsState>(
      'emits [loading, failed] when content loading throws error',
      build: () {
        repository.shouldThrowContent = true;
        return CollaborationsBloc(repository: repository);
      },
      act: (bloc) => bloc.add(const LoadCollaborationsContentEvent()),
      expect: () => [
        const CollaborationsState(status: CollaborationsStatus.loading),
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.failed &&
            state.isFailed &&
            state.errorMessage != null &&
            state.errorMessage!
                .contains('Failed to load collaborations content')),
      ],
    );

    blocTest<CollaborationsBloc, CollaborationsState>(
      'updates field values correctly on changed events',
      build: () => CollaborationsBloc(repository: repository),
      act: (bloc) {
        bloc.add(const NameChangedEvent('Dr. Robert Vance'));
        bloc.add(const EmailChangedEvent('r.vance@vancebiotech.com'));
        bloc.add(const OrganizationChangedEvent('Vance Biotech'));
        bloc.add(const PartnershipTrackChangedEvent('LAB CRO Services'));
        bloc.add(const MessageChangedEvent(
            'We are interested in co-developing a high-yield fermentation isolate.'));
      },
      expect: () => [
        const CollaborationsState(name: 'Dr. Robert Vance'),
        const CollaborationsState(
          name: 'Dr. Robert Vance',
          email: 'r.vance@vancebiotech.com',
        ),
        const CollaborationsState(
          name: 'Dr. Robert Vance',
          email: 'r.vance@vancebiotech.com',
          organization: 'Vance Biotech',
        ),
        const CollaborationsState(
          name: 'Dr. Robert Vance',
          email: 'r.vance@vancebiotech.com',
          organization: 'Vance Biotech',
          partnershipTrack: 'LAB CRO Services',
        ),
        predicate<CollaborationsState>((state) =>
            state.name == 'Dr. Robert Vance' &&
            state.email == 'r.vance@vancebiotech.com' &&
            state.organization == 'Vance Biotech' &&
            state.partnershipTrack == 'LAB CRO Services' &&
            state.message.contains('co-developing') &&
            state.isFormValid),
      ],
    );

    blocTest<CollaborationsBloc, CollaborationsState>(
      'emits failed state if submission attempted with invalid form',
      build: () => CollaborationsBloc(repository: repository),
      seed: () => const CollaborationsState(
        name: 'Dr. R',
        email: 'invalid-email',
        message: 'short',
      ),
      act: (bloc) => bloc.add(const SubmitCollaborationInquiryEvent()),
      expect: () => [
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.failed &&
            state.isFailed &&
            state.errorMessage != null),
      ],
    );

    blocTest<CollaborationsBloc, CollaborationsState>(
      'emits [loading, success] with trackingId when form is valid and submission succeeds',
      build: () => CollaborationsBloc(repository: repository),
      seed: () => const CollaborationsState(
        status: CollaborationsStatus.loaded,
        name: 'Dr. Robert Vance',
        email: 'r.vance@vancebiotech.com',
        organization: 'Vance Biotech',
        partnershipTrack: 'LAB CRO Services',
        message: 'Extensive R&D collaboration inquiry message text.',
      ),
      act: (bloc) => bloc.add(const SubmitCollaborationInquiryEvent()),
      expect: () => [
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.loading && state.isLoading),
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.success &&
            state.isSuccess &&
            state.trackingId == 'JIN-COL-2026-TEST123'),
      ],
    );

    blocTest<CollaborationsBloc, CollaborationsState>(
      'emits [loading, failed] when repository throws during inquiry submission',
      build: () {
        repository.shouldThrowSubmit = true;
        return CollaborationsBloc(repository: repository);
      },
      seed: () => const CollaborationsState(
        status: CollaborationsStatus.loaded,
        name: 'Dr. Robert Vance',
        email: 'r.vance@vancebiotech.com',
        organization: 'Vance Biotech',
        partnershipTrack: 'LAB CRO Services',
        message: 'Extensive R&D collaboration inquiry message text.',
      ),
      act: (bloc) => bloc.add(const SubmitCollaborationInquiryEvent()),
      expect: () => [
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.loading && state.isLoading),
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.failed &&
            state.isFailed &&
            state.errorMessage != null &&
            state.errorMessage!.contains('transmission failed')),
      ],
    );

    blocTest<CollaborationsBloc, CollaborationsState>(
      'resets form fields on ResetCollaborationInquiryEvent',
      build: () => CollaborationsBloc(repository: repository),
      seed: () => const CollaborationsState(
        status: CollaborationsStatus.success,
        name: 'Dr. Robert Vance',
        email: 'r.vance@vancebiotech.com',
        organization: 'Vance Biotech',
        partnershipTrack: 'LAB CRO Services',
        message: 'Message text',
        trackingId: 'JIN-COL-2026-TEST123',
      ),
      act: (bloc) => bloc.add(const ResetCollaborationInquiryEvent()),
      expect: () => [
        predicate<CollaborationsState>((state) =>
            state.status == CollaborationsStatus.loaded &&
            state.name.isEmpty &&
            state.email.isEmpty &&
            state.organization.isEmpty &&
            state.message.isEmpty &&
            state.trackingId == null &&
            state.errorMessage == null),
      ],
    );
  });
}
