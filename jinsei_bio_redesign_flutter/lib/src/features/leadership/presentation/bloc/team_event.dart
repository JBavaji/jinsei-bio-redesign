import 'package:equatable/equatable.dart';

import '../../domain/models/team_category.dart';

abstract class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object?> get props => [];
}

class LoadTeamContentEvent extends TeamEvent {
  final bool forceRefresh;

  const LoadTeamContentEvent({this.forceRefresh = false});

  @override
  List<Object?> get props => [forceRefresh];
}

class FilterTeamCategoryEvent extends TeamEvent {
  final TeamCategory category;

  const FilterTeamCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class SelectTeamMemberEvent extends TeamEvent {
  final int index;

  const SelectTeamMemberEvent(this.index);

  @override
  List<Object?> get props => [index];
}
