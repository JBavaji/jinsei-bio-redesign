import 'package:equatable/equatable.dart';
import '../../domain/models/science_step_model.dart';

abstract class ScienceStepperEvent extends Equatable {
  const ScienceStepperEvent();

  @override
  List<Object?> get props => [];
}

class LoadScienceStepsEvent extends ScienceStepperEvent {
  const LoadScienceStepsEvent();
}

class SelectScienceStepEvent extends ScienceStepperEvent {
  final int stepIndex;

  const SelectScienceStepEvent(this.stepIndex);

  @override
  List<Object?> get props => [stepIndex];
}

class FilterScienceCategoryEvent extends ScienceStepperEvent {
  final ScienceStepCategory? category;

  const FilterScienceCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}
