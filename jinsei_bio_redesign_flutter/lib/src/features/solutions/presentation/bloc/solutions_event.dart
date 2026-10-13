import 'package:equatable/equatable.dart';
import '../../domain/models/solution_card_model.dart';

abstract class SolutionsEvent extends Equatable {
  const SolutionsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSolutionsEvent extends SolutionsEvent {
  const LoadSolutionsEvent();
}

class FilterSolutionsCategoryEvent extends SolutionsEvent {
  final SolutionCategory category;

  const FilterSolutionsCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class SelectSolutionCardEvent extends SolutionsEvent {
  final int selectedIndex;

  const SelectSolutionCardEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}
