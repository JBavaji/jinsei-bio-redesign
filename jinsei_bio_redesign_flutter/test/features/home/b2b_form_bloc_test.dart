import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/b2b_form_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/b2b_form_event.dart';
import 'package:jinsei_bio_redesign/src/features/home/presentation/bloc/b2b_form_state.dart';

void main() {
  group('B2bFormBloc Tests', () {
    late B2bFormBloc bloc;

    setUp(() {
      bloc = B2bFormBloc();
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state has default empty fields and initial status', () {
      expect(bloc.state.fullName, isEmpty);
      expect(bloc.state.company, isEmpty);
      expect(bloc.state.email, isEmpty);
      expect(bloc.state.status, B2bFormStatus.initial);
      expect(bloc.state.isValid, isFalse);
    });

    test('updating fields sets isValid to true when required inputs are present', () {
      bloc.add(const FullNameChangedEvent('Dr. Jane Doe'));
      bloc.add(const CompanyChangedEvent('BioTech Labs'));
      bloc.add(const EmailChangedEvent('jane@biotechlabs.com'));

      expect(
        bloc.stream,
        emitsThrough(
          predicate<B2bFormState>((state) =>
              state.fullName == 'Dr. Jane Doe' &&
              state.company == 'BioTech Labs' &&
              state.email == 'jane@biotechlabs.com' &&
              state.isValid),
        ),
      );
    });

    test('submitting invalid form emits failure state', () async {
      bloc.add(const SubmitB2bFormEvent());

      await expectLater(
        bloc.stream,
        emits(
          predicate<B2bFormState>((state) =>
              state.status == B2bFormStatus.failure &&
              state.errorMessage != null),
        ),
      );
    });
  });
}
