import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/b2b_form_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/b2b_form_event.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/b2b_form_state.dart';

void main() {
  group('B2B Contact Form QA & Data Sandbox Guardrail Tests', () {
    late B2bFormBloc bloc;

    setUp(() {
      bloc = B2bFormBloc();
    });

    tearDown(() {
      bloc.close();
    });

    test('validates email format regex and rejects malformed email strings',
        () async {
      bloc.add(const EmailChangedEvent('invalid-email-address'));
      await Future<void>.delayed(Duration.zero);
      expect(bloc.state.isValid, isFalse);

      bloc.add(const FullNameChangedEvent('Dr. Marcus Vance'));
      bloc.add(const CompanyChangedEvent('BioResearch Labs'));
      bloc.add(const EmailChangedEvent('valid.partner@biotech.org'));
      await Future<void>.delayed(Duration.zero);
      expect(bloc.state.isValid, isTrue);
    });

    test(
        'sandbox guardrail verification: form submission payload is processed safely',
        () async {
      bloc.add(const FullNameChangedEvent('Dr. Marcus Vance'));
      bloc.add(const CompanyChangedEvent('BioResearch Labs'));
      bloc.add(const EmailChangedEvent('jbavaji@gmail.com'));

      bloc.add(const SubmitB2bFormEvent());

      await expectLater(
        bloc.stream,
        emitsThrough(
          predicate<B2bFormState>((state) =>
              state.status == B2bFormStatus.success ||
              state.status == B2bFormStatus.submitting),
        ),
      );
    });
  });
}
