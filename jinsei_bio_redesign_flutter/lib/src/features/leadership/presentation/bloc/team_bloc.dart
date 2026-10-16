import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/team_repository_impl.dart';
import '../../domain/repositories/i_team_repository.dart';
import 'team_event.dart';
import 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final ITeamRepository _repository;

  TeamBloc({ITeamRepository? repository})
      : _repository = repository ?? TeamRepositoryImpl(),
        super(const TeamState()) {
    on<LoadTeamContentEvent>(_onLoadTeamContent);
    on<FilterTeamCategoryEvent>(_onFilterTeamCategory);
    on<SelectTeamMemberEvent>(_onSelectTeamMember);
  }

  Future<void> _onLoadTeamContent(
    LoadTeamContentEvent event,
    Emitter<TeamState> emit,
  ) async {
    if (state.isLoaded && !event.forceRefresh) return;

    emit(state.copyWith(status: TeamStatus.loading));

    try {
      final content = await _repository.getLeadershipContent();

      emit(state.copyWith(
        status: TeamStatus.loaded,
        headerBadge: content.headerBadge,
        headline: content.headline,
        subhead: content.subhead,
        emblemTitle: content.emblemTitle,
        emblemSubtitle: content.emblemSubtitle,
        members: content.members,
        governanceAssurance: content.governanceAssurance,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: TeamStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onFilterTeamCategory(
    FilterTeamCategoryEvent event,
    Emitter<TeamState> emit,
  ) {
    emit(state.copyWith(selectedCategory: event.category));
  }

  void _onSelectTeamMember(
    SelectTeamMemberEvent event,
    Emitter<TeamState> emit,
  ) {
    if (event.index >= 0 && event.index < state.members.length) {
      emit(state.copyWith(selectedMemberIndex: event.index));
    }
  }
}
