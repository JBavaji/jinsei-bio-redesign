import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_step_model.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/bloc/science_stepper_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/bloc/science_stepper_event.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/bloc/science_stepper_state.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/config/science_steps.json') {
      return File('assets/config/science_steps.json').readAsString();
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) async {
    final bytes = await File(key).readAsBytes();
    return ByteData.sublistView(Uint8List.fromList(bytes));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ScienceStepperBloc Tests', () {
    late ScienceStepperBloc bloc;

    setUp(() {
      bloc = ScienceStepperBloc(assetBundle: TestAssetBundle());
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state has ScienceStepperStatus.initial', () {
      expect(bloc.state.status, equals(ScienceStepperStatus.initial));
      expect(bloc.state.steps, isEmpty);
      expect(bloc.state.selectedStepIndex, equals(0));
    });

    test('LoadScienceStepsEvent populates 10 steps from JSON', () async {
      bloc.add(const LoadScienceStepsEvent());
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const ScienceStepperState(status: ScienceStepperStatus.loading),
          isA<ScienceStepperState>()
              .having((s) => s.status, 'status', ScienceStepperStatus.loaded)
              .having((s) => s.steps.length, 'steps length', 10),
        ]),
      );
    });

    test('SelectScienceStepEvent updates selectedStepIndex', () async {
      bloc.add(const LoadScienceStepsEvent());
      await bloc.stream
          .firstWhere((s) => s.status == ScienceStepperStatus.loaded);

      bloc.add(const SelectScienceStepEvent(3));
      await expectLater(
        bloc.stream,
        emits(
          isA<ScienceStepperState>()
              .having((s) => s.selectedStepIndex, 'selectedStepIndex', 3),
        ),
      );
    });

    test('FilterScienceCategoryEvent updates filteredSteps', () async {
      bloc.add(const LoadScienceStepsEvent());
      await bloc.stream
          .firstWhere((s) => s.status == ScienceStepperStatus.loaded);

      bloc.add(const FilterScienceCategoryEvent(ScienceStepCategory.discovery));
      await expectLater(
        bloc.stream,
        emits(
          isA<ScienceStepperState>()
              .having((s) => s.selectedCategory, 'category',
                  ScienceStepCategory.discovery)
              .having((s) => s.filteredSteps.length, 'filtered length', 2),
        ),
      );
    });
  });
}
