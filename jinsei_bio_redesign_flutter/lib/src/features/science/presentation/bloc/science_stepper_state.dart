import 'package:equatable/equatable.dart';
import '../../domain/models/science_step_model.dart';

enum ScienceStepperStatus { initial, loading, loaded, error }

class ScienceStepperState extends Equatable {
  final ScienceStepperStatus status;
  final List<ScienceStepModel> steps;
  final int selectedStepIndex;
  final ScienceStepCategory? selectedCategory;
  final String? errorMessage;

  const ScienceStepperState({
    this.status = ScienceStepperStatus.initial,
    this.steps = const [],
    this.selectedStepIndex = 0,
    this.selectedCategory,
    this.errorMessage,
  });

  ScienceStepModel? get selectedStep =>
      steps.isNotEmpty && selectedStepIndex < steps.length
          ? steps[selectedStepIndex]
          : null;

  List<ScienceStepModel> get filteredSteps {
    if (selectedCategory == null) return steps;
    return steps.where((s) => s.category == selectedCategory).toList();
  }

  ScienceStepperState copyWith({
    ScienceStepperStatus? status,
    List<ScienceStepModel>? steps,
    int? selectedStepIndex,
    ScienceStepCategory? selectedCategory,
    String? errorMessage,
  }) {
    return ScienceStepperState(
      status: status ?? this.status,
      steps: steps ?? this.steps,
      selectedStepIndex: selectedStepIndex ?? this.selectedStepIndex,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        steps,
        selectedStepIndex,
        selectedCategory,
        errorMessage,
      ];
}
