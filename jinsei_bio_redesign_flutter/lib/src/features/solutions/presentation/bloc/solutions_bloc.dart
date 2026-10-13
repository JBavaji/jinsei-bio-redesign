import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_solutions_repository.dart';
import '../../data/repositories/solutions_repository_impl.dart';
import 'solutions_event.dart';
import 'solutions_state.dart';

class SolutionsBloc extends Bloc<SolutionsEvent, SolutionsState> {
  final ISolutionsRepository _repository;

  SolutionsBloc({ISolutionsRepository? repository})
      : _repository = repository ?? SolutionsRepositoryImpl(),
        super(const SolutionsState()) {
    on<LoadSolutionsEvent>(_onLoadSolutions);
    on<FilterSolutionsCategoryEvent>(_onFilterCategory);
    on<SelectSolutionCardEvent>(_onSelectCard);
  }

  Future<void> _onLoadSolutions(
    LoadSolutionsEvent event,
    Emitter<SolutionsState> emit,
  ) async {
    emit(state.copyWith(status: SolutionsStatus.loading));
    try {
      final content = await _repository.getSolutionsContent();
      emit(state.copyWith(
        status: SolutionsStatus.loaded,
        metrics: content.metrics,
        solutions: content.solutions,
        qualityAssurance: content.qualityAssurance,
      ));
      emit(state.copyWith(status: SolutionsStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: SolutionsStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterCategory(
    FilterSolutionsCategoryEvent event,
    Emitter<SolutionsState> emit,
  ) {
    emit(state.copyWith(
      selectedCategory: event.category,
      selectedCardIndex: 0,
    ));
  }

  void _onSelectCard(
    SelectSolutionCardEvent event,
    Emitter<SolutionsState> emit,
  ) {
    if (event.selectedIndex >= 0 &&
        event.selectedIndex < state.solutions.length) {
      emit(state.copyWith(selectedCardIndex: event.selectedIndex));
    }
  }
}
