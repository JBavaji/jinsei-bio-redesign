import 'package:equatable/equatable.dart';
import '../../domain/models/solution_card_model.dart';
import '../../domain/models/solution_metric_model.dart';
import '../../domain/models/solutions_quality_assurance_model.dart';

enum SolutionsStatus { idle, loading, loaded, success, failed }

class SolutionsState extends Equatable {
  final SolutionsStatus status;
  final List<SolutionMetricModel> metrics;
  final List<SolutionCardModel> solutions;
  final SolutionsQualityAssuranceModel? qualityAssurance;
  final SolutionCategory selectedCategory;
  final int selectedCardIndex;
  final String? errorMessage;

  const SolutionsState({
    this.status = SolutionsStatus.idle,
    this.metrics = const [],
    this.solutions = const [],
    this.qualityAssurance,
    this.selectedCategory = SolutionCategory.all,
    this.selectedCardIndex = 0,
    this.errorMessage,
  });

  bool get isIdle => status == SolutionsStatus.idle;
  bool get isLoading => status == SolutionsStatus.loading;
  bool get isLoaded => status == SolutionsStatus.loaded;
  bool get isSuccess => status == SolutionsStatus.success;
  bool get isFailed => status == SolutionsStatus.failed;

  SolutionCardModel? get selectedCard =>
      solutions.isNotEmpty && selectedCardIndex < solutions.length
          ? solutions[selectedCardIndex]
          : null;

  List<SolutionCardModel> get filteredSolutions {
    if (selectedCategory == SolutionCategory.all) return solutions;
    return solutions
        .where((s) =>
            s.category.toLowerCase() == selectedCategory.id.toLowerCase())
        .toList();
  }

  SolutionsState copyWith({
    SolutionsStatus? status,
    List<SolutionMetricModel>? metrics,
    List<SolutionCardModel>? solutions,
    SolutionsQualityAssuranceModel? qualityAssurance,
    SolutionCategory? selectedCategory,
    int? selectedCardIndex,
    String? errorMessage,
  }) {
    return SolutionsState(
      status: status ?? this.status,
      metrics: metrics ?? this.metrics,
      solutions: solutions ?? this.solutions,
      qualityAssurance: qualityAssurance ?? this.qualityAssurance,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCardIndex: selectedCardIndex ?? this.selectedCardIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        metrics,
        solutions,
        qualityAssurance,
        selectedCategory,
        selectedCardIndex,
        errorMessage,
      ];
}
