import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/failures/team_failure.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/governance_assurance_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/leadership_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_category.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_member_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/repositories/i_team_repository.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/bloc/team_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/bloc/team_event.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/bloc/team_state.dart';

class MockTeamRepository implements ITeamRepository {
  final bool shouldFail;
  final LeadershipContentModel mockContent;

  MockTeamRepository({
    this.shouldFail = false,
    LeadershipContentModel? content,
  }) : mockContent = content ??
            const LeadershipContentModel(
              headerBadge: 'ONE TEAM, ONE VISION',
              headline: 'Leadership & R&D Team',
              subhead: 'Pioneering microbiologists',
              emblemTitle: 'JINSEI BIOSCIENCE',
              emblemSubtitle: 'Translational Microbial Discovery Engine',
              members: [
                TeamMemberModel(
                  memberId: 'lead_ria',
                  name: 'Dr. Ria Deshpande, PhD',
                  role: 'CEO',
                  categoryTag: 'Executive Lead',
                  category: 'executive',
                  academicCredential: 'PhD UC Irvine',
                  areaOfExpertise: 'Leadership',
                  imageUrl: null,
                  displayOrder: 1,
                ),
                TeamMemberModel(
                  memberId: 'lead_asha',
                  name: 'Dr. Asha Kembhavi',
                  role: 'CSO',
                  categoryTag: 'Scientific Leadership',
                  category: 'executive',
                  academicCredential: 'PhD Cambridge',
                  areaOfExpertise: 'R&D',
                  imageUrl: null,
                  displayOrder: 2,
                ),
                TeamMemberModel(
                  memberId: 'lead_kiran',
                  name: 'Dr. Kirankumar Beede',
                  role: 'Principal Scientist',
                  categoryTag: 'Principal Scientist',
                  category: 'scientific',
                  academicCredential: 'PhD Biochemistry',
                  areaOfExpertise: 'Characterization',
                  imageUrl: null,
                  displayOrder: 3,
                ),
              ],
              governanceAssurance: GovernanceAssuranceModel(
                title: 'Scientific Governance & Ethics Assurance',
                description: 'ISO 9001:2015',
                badgeText: 'Pune NCL',
                complianceStandard: 'Ethics Compliant',
              ),
            );

  @override
  Future<LeadershipContentModel> getLeadershipContent() async {
    if (shouldFail) {
      throw const TeamNetworkFailure('Simulated failure');
    }
    return mockContent;
  }

  @override
  Future<List<TeamMemberModel>> getTeamMembers() async {
    if (shouldFail) {
      throw const TeamNetworkFailure('Simulated failure');
    }
    return mockContent.members;
  }

  @override
  Future<List<TeamMemberModel>> getTeamMembersByCategory(
      String category) async {
    if (shouldFail) {
      throw const TeamNetworkFailure('Simulated failure');
    }
    if (category.toLowerCase() == 'all') {
      return mockContent.members;
    }
    return mockContent.members
        .where((m) => m.category.toLowerCase() == category.toLowerCase())
        .toList();
  }
}

void main() {
  group('TeamBloc Lifecycle & State Tests', () {
    test('Initial state is idle with default values', () {
      final bloc = TeamBloc(repository: MockTeamRepository());
      expect(bloc.state.status, TeamStatus.idle);
      expect(bloc.state.isIdle, isTrue);
      expect(bloc.state.selectedCategory, TeamCategory.all);
      expect(bloc.state.members, isEmpty);
      bloc.close();
    });

    test('LoadTeamContentEvent successfully updates state to loaded', () async {
      final repository = MockTeamRepository();
      final bloc = TeamBloc(repository: repository);

      final states = <TeamState>[];
      final subscription = bloc.stream.listen(states.add);

      bloc.add(const LoadTeamContentEvent());

      await Future.delayed(const Duration(milliseconds: 50));

      expect(states.length, 2);
      expect(states[0].status, TeamStatus.loading);
      expect(states[0].isLoading, isTrue);

      expect(states[1].status, TeamStatus.loaded);
      expect(states[1].isLoaded, isTrue);
      expect(states[1].members.length, 3);
      expect(states[1].executiveMembers.length, 2);
      expect(states[1].gridMembers.length, 1);
      expect(states[1].governanceAssurance?.title,
          'Scientific Governance & Ethics Assurance');

      await subscription.cancel();
      await bloc.close();
    });

    test('LoadTeamContentEvent emits failed status when repository throws',
        () async {
      final repository = MockTeamRepository(shouldFail: true);
      final bloc = TeamBloc(repository: repository);

      final states = <TeamState>[];
      final subscription = bloc.stream.listen(states.add);

      bloc.add(const LoadTeamContentEvent());

      await Future.delayed(const Duration(milliseconds: 50));

      expect(states.length, 2);
      expect(states[0].status, TeamStatus.loading);
      expect(states[1].status, TeamStatus.failed);
      expect(states[1].isFailed, isTrue);
      expect(states[1].errorMessage, contains('Simulated failure'));

      await subscription.cancel();
      await bloc.close();
    });

    test('FilterTeamCategoryEvent changes selectedCategory and filters members',
        () async {
      final repository = MockTeamRepository();
      final bloc = TeamBloc(repository: repository);

      bloc.add(const LoadTeamContentEvent());
      await Future.delayed(const Duration(milliseconds: 50));

      bloc.add(const FilterTeamCategoryEvent(TeamCategory.scientific));
      await Future.delayed(const Duration(milliseconds: 50));

      expect(bloc.state.selectedCategory, TeamCategory.scientific);
      expect(bloc.state.filteredMembers.length, 1);
      expect(bloc.state.filteredMembers.first.name, 'Dr. Kirankumar Beede');

      await bloc.close();
    });

    test('SelectTeamMemberEvent updates selectedMemberIndex', () async {
      final repository = MockTeamRepository();
      final bloc = TeamBloc(repository: repository);

      bloc.add(const LoadTeamContentEvent());
      await Future.delayed(const Duration(milliseconds: 50));

      bloc.add(const SelectTeamMemberEvent(1));
      await Future.delayed(const Duration(milliseconds: 50));

      expect(bloc.state.selectedMemberIndex, 1);
      expect(bloc.state.selectedMember?.name, 'Dr. Asha Kembhavi');

      await bloc.close();
    });
  });
}
