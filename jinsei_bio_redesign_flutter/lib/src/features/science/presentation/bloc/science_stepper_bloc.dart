import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/science_step_model.dart';
import 'science_stepper_event.dart';
import 'science_stepper_state.dart';

class ScienceStepperBloc
    extends Bloc<ScienceStepperEvent, ScienceStepperState> {
  ScienceStepperBloc() : super(const ScienceStepperState()) {
    on<LoadScienceStepsEvent>(_onLoadScienceSteps);
    on<SelectScienceStepEvent>(_onSelectScienceStep);
    on<FilterScienceCategoryEvent>(_onFilterScienceCategory);
  }

  void _onLoadScienceSteps(
    LoadScienceStepsEvent event,
    Emitter<ScienceStepperState> emit,
  ) {
    emit(state.copyWith(status: ScienceStepperStatus.loading));
    final steps = ScienceStepModel.defaultSteps;
    emit(state.copyWith(
      status: ScienceStepperStatus.loaded,
      steps: steps,
      selectedStepIndex: 0,
    ));
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
