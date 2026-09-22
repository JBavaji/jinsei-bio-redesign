import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/datasources/science_local_data_source.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/repositories/science_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/science/domain/models/science_step_model.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/bloc/science_stepper_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/bloc/science_stepper_event.dart';
import 'package:jinsei_bio_redesign/src/features/science/presentation/bloc/science_stepper_state.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == 'assets/data/science_content.json') {
      return File('assets/data/science_content.json').readAsString();
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

  group('ScienceStepperBloc & Repository Tests', () {
    late ScienceStepperBloc bloc;

    setUp(() {
      final localDataSource =
          ScienceLocalDataSource(bundle: TestAssetBundle());
      final repository =
          ScienceRepositoryImpl(localDataSource: localDataSource);
      bloc = ScienceStepperBloc(repository: repository);
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state has isIdle true', () {
      expect(bloc.state.isIdle, isTrue);
      expect(bloc.state.steps, isEmpty);
      expect(bloc.state.headerMetrics, isEmpty);
      expect(bloc.state.selectedStepIndex, equals(0));
    });

    test('LoadScienceStepsEvent populates header metrics and 10 steps from JSON',
        () async {
      bloc.add(const LoadScienceStepsEvent());
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const ScienceStepperState(status: ScienceStepperStatus.loading),
          isA<ScienceStepperState>()
              .having((s) => s.isSuccess, 'isSuccess', isTrue)
              .having((s) => s.headerMetrics.length, 'headerMetrics length', 3)
              .having((s) => s.steps.length, 'steps length', 10),
        ]),
      );
    });

    test('SelectScienceStepEvent updates selectedStepIndex', () async {
      bloc.add(const LoadScienceStepsEvent());
      await bloc.stream.firstWhere((s) => s.isSuccess);

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
      await bloc.stream.firstWhere((s) => s.isSuccess);

      bloc.add(
          const FilterScienceCategoryEvent(ScienceStepCategory.discovery));
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
