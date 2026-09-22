import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/science_local_data_source.dart';
import '../../data/repositories/science_repository_impl.dart';
import '../../domain/repositories/i_science_repository.dart';
import 'science_stepper_event.dart';
import 'science_stepper_state.dart';

class ScienceStepperBloc
    extends Bloc<ScienceStepperEvent, ScienceStepperState> {
  final IScienceRepository _repository;

  ScienceStepperBloc({
    IScienceRepository? repository,
  })  : _repository = repository ??
            ScienceRepositoryImpl(
              localDataSource: ScienceLocalDataSource(),
            ),
        super(const ScienceStepperState()) {
    on<LoadScienceStepsEvent>(_onLoadScienceSteps);
    on<SelectScienceStepEvent>(_onSelectScienceStep);
    on<FilterScienceCategoryEvent>(_onFilterScienceCategory);
  }

  Future<void> _onLoadScienceSteps(
    LoadScienceStepsEvent event,
    Emitter<ScienceStepperState> emit,
  ) async {
    emit(state.copyWith(status: ScienceStepperStatus.loading));
    try {
      final content = await _repository.getScienceContent();
      emit(state.copyWith(
        status: ScienceStepperStatus.success,
        headerMetrics: content.headerMetrics,
        steps: content.pipelineSteps,
        selectedStepIndex: 0,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ScienceStepperStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onSelectScienceStep(
    SelectScienceStepEvent event,
    Emitter<ScienceStepperState> emit,
  ) {
    if (event.stepIndex >= 0 && event.stepIndex < state.steps.length) {
      emit(state.copyWith(selectedStepIndex: event.stepIndex));
    }
  }

  void _onFilterScienceCategory(
    FilterScienceCategoryEvent event,
    Emitter<ScienceStepperState> emit,
  ) {
    emit(state.copyWith(
      selectedCategory: event.category,
      selectedStepIndex: 0,
    ));
  }
}
