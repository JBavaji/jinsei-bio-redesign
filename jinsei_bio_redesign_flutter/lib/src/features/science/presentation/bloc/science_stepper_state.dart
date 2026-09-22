import 'package:equatable/equatable.dart';
import '../../domain/models/science_header_metric_model.dart';
import '../../domain/models/science_step_model.dart';

enum ScienceStepperStatus { idle, loading, loaded, success, failed }

class ScienceStepperState extends Equatable {
  final ScienceStepperStatus status;
  final List<ScienceHeaderMetricModel> headerMetrics;
  final List<ScienceStepModel> steps;
  final int selectedStepIndex;
  final ScienceStepCategory? selectedCategory;
  final String? errorMessage;

  const ScienceStepperState({
    this.status = ScienceStepperStatus.idle,
    this.headerMetrics = const [],
    this.steps = const [],
    this.selectedStepIndex = 0,
    this.selectedCategory,
    this.errorMessage,
  });

  bool get isIdle => status == ScienceStepperStatus.idle;
  bool get isLoading => status == ScienceStepperStatus.loading;
  bool get isLoaded => status == ScienceStepperStatus.loaded;
  bool get isSuccess => status == ScienceStepperStatus.success;
  bool get isFailed => status == ScienceStepperStatus.failed;

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
    List<ScienceHeaderMetricModel>? headerMetrics,
    List<ScienceStepModel>? steps,
    int? selectedStepIndex,
    ScienceStepCategory? selectedCategory,
    String? errorMessage,
  }) {
    return ScienceStepperState(
      status: status ?? this.status,
      headerMetrics: headerMetrics ?? this.headerMetrics,
      steps: steps ?? this.steps,
      selectedStepIndex: selectedStepIndex ?? this.selectedStepIndex,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        headerMetrics,
        steps,
        selectedStepIndex,
        selectedCategory,
        errorMessage,
      ];
}
