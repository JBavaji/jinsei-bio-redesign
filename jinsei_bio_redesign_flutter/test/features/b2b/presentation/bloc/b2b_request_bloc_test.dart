import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_modal_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_sample_request_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/formulation_format_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/strain_vertical_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/repositories/i_b2b_repository.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/presentation/bloc/b2b_request_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/presentation/bloc/b2b_request_event.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/presentation/bloc/b2b_request_state.dart';

class MockB2bRepository implements IB2bRepository {
  B2bModalContentModel stubContent = const B2bModalContentModel(
    badgeText: 'COMMERCIAL FORMULATION',
    title: 'Request Sample',
    subtitle: 'Lactobacillus isolates',
    strains: [
      StrainVerticalOptionModel(
        strainId: 'gut_pro',
        category: 'HUMAN HEALTH',
        name: 'Jinsei-Gut Pro',
        strainCode: 'JN-04',
        highlight: 'Adhesion >94%',
        defaultFormat: 'lyophilized_powder',
      ),
      StrainVerticalOptionModel(
        strainId: 'custom_cro',
        category: 'CUSTOM ISOLATE',
        name: 'Custom LAB Isolate',
        strainCode: 'CRO',
        highlight: 'Native library',
        defaultFormat: 'slurry_concentrate',
      ),
    ],
    formulationFormats: [
      FormulationFormatOptionModel(
        formatId: 'lyophilized_powder',
        label: 'Lyophilized Bulk Powder',
      ),
      FormulationFormatOptionModel(
        formatId: 'slurry_concentrate',
        label: 'Active Ferment Slurry',
      ),
    ],
    complianceNote: 'CoA Included',
    certifications: ['ISO 9001:2015', 'GMP Certified'],
    dispatchNotice: 'Dispatched in 48h',
  );

  String stubTrackingId = 'JIN-REQ-2026-TEST456';
  bool shouldThrowContent = false;
  bool shouldThrowSubmit = false;

  @override
  Future<B2bModalContentModel> getModalContent() async {
    if (shouldThrowContent) throw Exception('Content fetch failed');
    return stubContent;
  }

  @override
  Future<String> submitSampleRequest(B2bSampleRequestModel request) async {
    if (shouldThrowSubmit) throw Exception('Network timeout');
    return stubTrackingId;
  }
}

void main() {
  group('B2bRequestBloc Tests (JIN-22)', () {
    late MockB2bRepository repository;

    setUp(() {
      repository = MockB2bRepository();
    });

    test('initial state has idle status and empty fields', () {
      final bloc = B2bRequestBloc(repository: repository);
      expect(bloc.state.status, equals(B2bRequestStatus.idle));
      expect(bloc.state.isIdle, isTrue);
      expect(bloc.state.fullName, isEmpty);
      expect(bloc.state.email, isEmpty);
      expect(bloc.state.company, isEmpty);
    });

    blocTest<B2bRequestBloc, B2bRequestState>(
      'emits [loading, loaded] with default strain and format on LoadB2bModalContentEvent',
      build: () => B2bRequestBloc(repository: repository),
      act: (bloc) => bloc.add(const LoadB2bModalContentEvent()),
      expect: () => [
        const B2bRequestState(status: B2bRequestStatus.loading),
        predicate<B2bRequestState>((state) =>
            state.status == B2bRequestStatus.loaded &&
            state.isLoaded &&
            state.selectedStrainId == 'gut_pro' &&
            state.selectedFormatId == 'lyophilized_powder' &&
            state.content != null),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'honors initialStrainId when passed in LoadB2bModalContentEvent',
      build: () => B2bRequestBloc(repository: repository),
      act: (bloc) => bloc.add(const LoadB2bModalContentEvent(
        initialStrainId: 'custom_cro',
      )),
      expect: () => [
        const B2bRequestState(status: B2bRequestStatus.loading),
        predicate<B2bRequestState>((state) =>
            state.status == B2bRequestStatus.loaded &&
            state.selectedStrainId == 'custom_cro' &&
            state.selectedFormatId == 'slurry_concentrate'),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'emits [loading, failed] when repository throws on LoadB2bModalContentEvent',
      build: () {
        repository.shouldThrowContent = true;
        return B2bRequestBloc(repository: repository);
      },
      act: (bloc) => bloc.add(const LoadB2bModalContentEvent()),
      expect: () => [
        const B2bRequestState(status: B2bRequestStatus.loading),
        predicate<B2bRequestState>((state) =>
            state.status == B2bRequestStatus.failed &&
            state.isFailed &&
            state.errorMessage != null),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'SelectStrainVerticalEvent updates selectedStrainId and synchronizes format',
      build: () => B2bRequestBloc(repository: repository),
      seed: () => B2bRequestState(
        status: B2bRequestStatus.loaded,
        content: repository.stubContent,
        selectedStrainId: 'gut_pro',
        selectedFormatId: 'lyophilized_powder',
      ),
      act: (bloc) => bloc.add(const SelectStrainVerticalEvent('custom_cro')),
      expect: () => [
        predicate<B2bRequestState>((state) =>
            state.selectedStrainId == 'custom_cro' &&
            state.selectedFormatId == 'slurry_concentrate'),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'updates form input fields correctly',
      build: () => B2bRequestBloc(repository: repository),
      act: (bloc) {
        bloc.add(const FullNameChangedEvent('Dr. Rajesh Sharma'));
        bloc.add(const EmailChangedEvent('r.sharma@acme.com'));
        bloc.add(const CompanyChangedEvent('Acme Pharma'));
        bloc.add(const FormulationFormatChangedEvent('slurry_concentrate'));
        bloc.add(const ClinicalScopeChangedEvent('Phase-1 trial'));
      },
      expect: () => [
        predicate<B2bRequestState>((s) => s.fullName == 'Dr. Rajesh Sharma'),
        predicate<B2bRequestState>(
            (s) => s.email == 'r.sharma@acme.com' && s.isEmailValid),
        predicate<B2bRequestState>((s) => s.company == 'Acme Pharma'),
        predicate<B2bRequestState>(
            (s) => s.selectedFormatId == 'slurry_concentrate'),
        predicate<B2bRequestState>((s) => s.clinicalScope == 'Phase-1 trial'),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'emits failed when SubmitB2bSampleRequestEvent called on invalid form',
      build: () => B2bRequestBloc(repository: repository),
      seed: () => const B2bRequestState(
        status: B2bRequestStatus.loaded,
        fullName: '',
        email: 'invalid',
        company: '',
      ),
      act: (bloc) => bloc.add(const SubmitB2bSampleRequestEvent()),
      expect: () => [
        predicate<B2bRequestState>(
            (s) => s.status == B2bRequestStatus.failed && s.isFailed),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'emits [loading, success] on valid form submission',
      build: () => B2bRequestBloc(repository: repository),
      seed: () => const B2bRequestState(
        status: B2bRequestStatus.loaded,
        selectedStrainId: 'gut_pro',
        selectedFormatId: 'lyophilized_powder',
        fullName: 'Dr. Rajesh Sharma',
        email: 'r.sharma@acme.com',
        company: 'Acme Biotherapeutics Ltd.',
      ),
      act: (bloc) => bloc.add(const SubmitB2bSampleRequestEvent()),
      expect: () => [
        predicate<B2bRequestState>((s) => s.status == B2bRequestStatus.loading),
        predicate<B2bRequestState>((s) =>
            s.status == B2bRequestStatus.success &&
            s.isSuccess &&
            s.trackingId == 'JIN-REQ-2026-TEST456'),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'emits [loading, failed] when repository submission throws',
      build: () {
        repository.shouldThrowSubmit = true;
        return B2bRequestBloc(repository: repository);
      },
      seed: () => const B2bRequestState(
        status: B2bRequestStatus.loaded,
        selectedStrainId: 'gut_pro',
        selectedFormatId: 'lyophilized_powder',
        fullName: 'Dr. Rajesh Sharma',
        email: 'r.sharma@acme.com',
        company: 'Acme Biotherapeutics Ltd.',
      ),
      act: (bloc) => bloc.add(const SubmitB2bSampleRequestEvent()),
      expect: () => [
        predicate<B2bRequestState>((s) => s.status == B2bRequestStatus.loading),
        predicate<B2bRequestState>((s) =>
            s.status == B2bRequestStatus.failed &&
            s.isFailed &&
            s.errorMessage!.contains('transmission failed')),
      ],
    );

    blocTest<B2bRequestBloc, B2bRequestState>(
      'ResetB2bRequestFormEvent clears form inputs while preserving loaded content',
      build: () => B2bRequestBloc(repository: repository),
      seed: () => B2bRequestState(
        status: B2bRequestStatus.success,
        content: repository.stubContent,
        selectedStrainId: 'gut_pro',
        selectedFormatId: 'lyophilized_powder',
        fullName: 'Dr. Old Data',
        email: 'old@data.com',
        company: 'Old Co',
        trackingId: 'TRACK123',
      ),
      act: (bloc) => bloc.add(const ResetB2bRequestFormEvent()),
      expect: () => [
        predicate<B2bRequestState>((s) =>
            s.status == B2bRequestStatus.loaded &&
            s.fullName.isEmpty &&
            s.email.isEmpty &&
            s.company.isEmpty &&
            s.trackingId == null &&
            s.content != null),
      ],
    );
  });
}
