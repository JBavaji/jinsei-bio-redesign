import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_error_state_view.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_loading_indicator.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/governance_assurance_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/leadership_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_member_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/repositories/i_team_repository.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/bloc/team_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/bloc/team_event.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/bloc/team_state.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/leadership_screen.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/widgets/governance_assurance_banner.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/widgets/leadership_card_widget.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/widgets/leadership_header.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/presentation/widgets/team_category_tabs.dart';

class MockLeadershipRepository implements ITeamRepository {
  final bool shouldFail;
  final LeadershipContentModel mockContent;

  MockLeadershipRepository({
    this.shouldFail = false,
  }) : mockContent = const LeadershipContentModel(
          headerBadge: 'ONE TEAM, ONE VISION',
          headline: 'Leadership & R&D Team',
          subhead: 'Pioneering microbiologists',
          emblemTitle: 'JINSEI BIOSCIENCE',
          emblemSubtitle: 'Translational Microbial Discovery Engine',
          members: [
            TeamMemberModel(
              memberId: 'lead_ria',
              name: 'Dr. Ria Deshpande, PhD',
              role: 'Chief Executive Officer (CEO)',
              categoryTag: 'Executive Lead',
              category: 'executive',
              academicCredential: 'PhD UC Irvine',
              areaOfExpertise: 'Strategic Leadership & Operations',
              imageUrl: null,
              displayOrder: 1,
            ),
            TeamMemberModel(
              memberId: 'lead_asha',
              name: 'Dr. Asha Kembhavi',
              role: 'Chief Scientific Officer (CSO)',
              categoryTag: 'Scientific Leadership',
              category: 'executive',
              academicCredential: 'PhD Cambridge',
              areaOfExpertise: 'R&D Operations & Strategy',
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
              areaOfExpertise: 'Formulations & Scaling',
              imageUrl: null,
              displayOrder: 3,
            ),
          ],
          governanceAssurance: GovernanceAssuranceModel(
            title: 'Scientific Governance & Ethics Assurance',
            description: 'ISO 9001:2015 & cGMP Certified R&D Standards',
            badgeText: 'Pune NCL Innovation Park',
            complianceStandard: 'Bio-Prospecting Ethics Compliant',
          ),
        );

  @override
  Future<LeadershipContentModel> getLeadershipContent() async {
    if (shouldFail) throw Exception('Failed to load team data');
    return mockContent;
  }

  @override
  Future<List<TeamMemberModel>> getTeamMembers() async {
    if (shouldFail) throw Exception('Failed to load team data');
    return mockContent.members;
  }

  @override
  Future<List<TeamMemberModel>> getTeamMembersByCategory(
      String category) async {
    if (shouldFail) throw Exception('Failed to load team data');
    if (category.toLowerCase() == 'all') return mockContent.members;
    return mockContent.members
        .where((m) => m.category.toLowerCase() == category.toLowerCase())
        .toList();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget buildTestWidget({
    required TeamBloc bloc,
    ThemeData? theme,
  }) {
    return MaterialApp(
      theme: theme ?? AppTheme.darkTheme,
      home: Scaffold(
        body: LeadershipScreen(bloc: bloc),
      ),
    );
  }

  group('LeadershipScreen Responsive UI & State Tests', () {
    testWidgets('Renders all core widgets and sections cleanly',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final repository = MockLeadershipRepository();
      final bloc = TeamBloc(repository: repository)
        ..add(const LoadTeamContentEvent());

      await tester.pumpWidget(buildTestWidget(bloc: bloc));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(LeadershipHeader), findsOneWidget);
      expect(find.text('ONE TEAM, ONE VISION'), findsOneWidget);
      expect(find.text('Leadership & R&D Team'), findsOneWidget);
      expect(find.byType(TeamCategoryTabs), findsOneWidget);
      expect(find.byType(LeadershipCardWidget), findsNWidgets(3));
      expect(find.text('Dr. Ria Deshpande, PhD'), findsOneWidget);
      expect(find.text('Dr. Asha Kembhavi'), findsOneWidget);
      expect(find.text('Dr. Kirankumar Beede'), findsOneWidget);
      expect(find.byType(GovernanceAssuranceBanner), findsOneWidget);
      expect(find.text('Scientific Governance & Ethics Assurance'),
          findsOneWidget);

      bloc.close();
    });

    testWidgets('Filtering by category updates the displayed team members',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final repository = MockLeadershipRepository();
      final bloc = TeamBloc(repository: repository)
        ..add(const LoadTeamContentEvent());

      await tester.pumpWidget(buildTestWidget(bloc: bloc));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      final scientificChip = find.text('Scientific R&D');
      expect(scientificChip, findsOneWidget);

      await tester.tap(scientificChip);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Dr. Kirankumar Beede'), findsOneWidget);
      expect(find.text('Dr. Ria Deshpande, PhD'), findsNothing);

      bloc.close();
    });

    testWidgets('Tapping a leadership card opens TeamMemberDetailDialog',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final repository = MockLeadershipRepository();
      final bloc = TeamBloc(repository: repository)
        ..add(const LoadTeamContentEvent());

      await tester.pumpWidget(buildTestWidget(bloc: bloc));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      final riaCard = find.text('Dr. Ria Deshpande, PhD');
      await tester.tap(riaCard);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Connect with R&D Leadership'), findsOneWidget);
      expect(find.text('Strategic Leadership & Operations'), findsOneWidget);

      final closeBtn = find.byIcon(Icons.close_rounded);
      await tester.tap(closeBtn);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Connect with R&D Leadership'), findsNothing);

      bloc.close();
    });

    testWidgets('Displays AppLoadingIndicator when in loading state',
        (tester) async {
      final repository = MockLeadershipRepository();
      final bloc = TeamBloc(repository: repository);

      await tester.pumpWidget(buildTestWidget(bloc: bloc));
      bloc.emit(bloc.state.copyWith(status: TeamStatus.loading));
      await tester.pump();

      expect(find.byType(AppLoadingIndicator), findsOneWidget);

      bloc.close();
    });

    testWidgets('Displays AppErrorStateView on failure and allows retry',
        (tester) async {
      final repository = MockLeadershipRepository(shouldFail: true);
      final bloc = TeamBloc(repository: repository)
        ..add(const LoadTeamContentEvent());

      await tester.pumpWidget(buildTestWidget(bloc: bloc));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(AppErrorStateView), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);

      bloc.close();
    });

    testWidgets('Renders properly in Light Mode', (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final repository = MockLeadershipRepository();
      final bloc = TeamBloc(repository: repository)
        ..add(const LoadTeamContentEvent());

      await tester
          .pumpWidget(buildTestWidget(bloc: bloc, theme: AppTheme.lightTheme));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Leadership & R&D Team'), findsOneWidget);
      expect(find.byType(GovernanceAssuranceBanner), findsOneWidget);

      bloc.close();
    });
  });
}
