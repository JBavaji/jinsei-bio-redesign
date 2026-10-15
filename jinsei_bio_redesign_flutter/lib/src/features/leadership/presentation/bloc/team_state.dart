import 'package:equatable/equatable.dart';

import '../../domain/models/governance_assurance_model.dart';
import '../../domain/models/team_category.dart';
import '../../domain/models/team_member_model.dart';

enum TeamStatus { idle, loading, loaded, success, failed }

class TeamState extends Equatable {
  final TeamStatus status;
  final String headerBadge;
  final String headline;
  final String subhead;
  final String emblemTitle;
  final String emblemSubtitle;
  final List<TeamMemberModel> members;
  final GovernanceAssuranceModel? governanceAssurance;
  final TeamCategory selectedCategory;
  final int selectedMemberIndex;
  final String? errorMessage;

  const TeamState({
    this.status = TeamStatus.idle,
    this.headerBadge = 'ONE TEAM, ONE VISION',
    this.headline = 'Leadership & R&D Team',
    this.subhead = '',
    this.emblemTitle = 'JINSEI BIOSCIENCE',
    this.emblemSubtitle = 'Translational Microbial Discovery Engine',
    this.members = const [],
    this.governanceAssurance,
    this.selectedCategory = TeamCategory.all,
    this.selectedMemberIndex = 0,
    this.errorMessage,
  });

  bool get isIdle => status == TeamStatus.idle;
  bool get isLoading => status == TeamStatus.loading;
  bool get isLoaded => status == TeamStatus.loaded;
  bool get isSuccess => status == TeamStatus.success;
  bool get isFailed => status == TeamStatus.failed;

  TeamMemberModel? get selectedMember =>
      members.isNotEmpty && selectedMemberIndex < members.length
          ? members[selectedMemberIndex]
          : null;

  List<TeamMemberModel> get executiveMembers =>
      members.where((m) => m.isExecutive).toList();

  List<TeamMemberModel> get gridMembers {
    final list = members.where((m) => !m.isExecutive).toList();
    if (selectedCategory == TeamCategory.all) return list;
    return list
        .where((m) =>
            m.category.toLowerCase() == selectedCategory.id.toLowerCase())
        .toList();
  }

  List<TeamMemberModel> get filteredMembers {
    if (selectedCategory == TeamCategory.all) return members;
    return members
        .where((m) =>
            m.category.toLowerCase() == selectedCategory.id.toLowerCase())
        .toList();
  }

  TeamState copyWith({
    TeamStatus? status,
    String? headerBadge,
    String headline = 'Leadership & R&D Team',
    String? subhead,
    String? emblemTitle,
    String? emblemSubtitle,
    List<TeamMemberModel>? members,
    GovernanceAssuranceModel? governanceAssurance,
    TeamCategory? selectedCategory,
    int? selectedMemberIndex,
    String? errorMessage,
  }) {
    return TeamState(
      status: status ?? this.status,
      headerBadge: headerBadge ?? this.headerBadge,
      headline: headline,
      subhead: subhead ?? this.subhead,
      emblemTitle: emblemTitle ?? this.emblemTitle,
      emblemSubtitle: emblemSubtitle ?? this.emblemSubtitle,
      members: members ?? this.members,
      governanceAssurance: governanceAssurance ?? this.governanceAssurance,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedMemberIndex: selectedMemberIndex ?? this.selectedMemberIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        headerBadge,
        headline,
        subhead,
        emblemTitle,
        emblemSubtitle,
        members,
        governanceAssurance,
        selectedCategory,
        selectedMemberIndex,
        errorMessage,
      ];
}
