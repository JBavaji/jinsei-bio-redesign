import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_error_state_view.dart';
import '../../../core/widgets/app_footer_bar.dart';
import '../../../core/widgets/app_loading_indicator.dart';
import '../domain/models/team_category.dart';
import '../domain/models/team_member_model.dart';
import 'bloc/team_bloc.dart';
import 'bloc/team_event.dart';
import 'bloc/team_state.dart';
import 'widgets/governance_assurance_banner.dart';
import 'widgets/leadership_executive_row.dart';
import 'widgets/leadership_grid_layout.dart';
import 'widgets/leadership_header.dart';
import 'widgets/team_category_tabs.dart';
import 'widgets/team_member_detail_dialog.dart';

class LeadershipScreen extends StatelessWidget {
  final TeamBloc? bloc;

  const LeadershipScreen({super.key, this.bloc});

  @override
  Widget build(BuildContext context) {
    if (bloc != null) {
      return BlocProvider.value(
        value: bloc!,
        child: const _LeadershipScreenView(),
      );
    }
    return BlocProvider(
      create: (context) => TeamBloc()..add(const LoadTeamContentEvent()),
      child: const _LeadershipScreenView(),
    );
  }
}

class _LeadershipScreenView extends StatelessWidget {
  const _LeadershipScreenView();

  void _onMemberTap(BuildContext context, TeamMemberModel member) {
    TeamMemberDetailDialog.show(
      context,
      member: member,
      onCollaborate: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Leadership consultation inquiry logged for ${member.name}',
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<TeamBloc, TeamState>(
                      buildWhen: (prev, curr) =>
                          prev.headerBadge != curr.headerBadge ||
                          prev.headline != curr.headline ||
                          prev.subhead != curr.subhead,
                      builder: (context, state) => LeadershipHeader(
                        badgeText: state.headerBadge,
                        headline: state.headline,
                        subhead: state.subhead,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const TeamCategoryTabs(),
                    const SizedBox(height: 36),
                    BlocBuilder<TeamBloc, TeamState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const AppLoadingIndicator();
                        }
                        if (state.isFailed) {
                          return AppErrorStateView(
                            errorMessage: state.errorMessage ??
                                'Failed to load leadership team data.',
                            onRetry: () {
                              context
                                  .read<TeamBloc>()
                                  .add(const LoadTeamContentEvent());
                            },
                          );
                        }

                        final isAll =
                            state.selectedCategory == TeamCategory.all;

                        return Column(
                          children: [
                            if (isAll) ...[
                              LeadershipExecutiveRow(
                                executiveMembers: state.executiveMembers,
                                emblemTitle: state.emblemTitle,
                                emblemSubtitle: state.emblemSubtitle,
                                onMemberTap: (m) => _onMemberTap(context, m),
                              ),
                              const SizedBox(height: 40),
                              LeadershipGridLayout(
                                members: state.gridMembers,
                                onMemberTap: (m) => _onMemberTap(context, m),
                              ),
                            ] else ...[
                              LeadershipGridLayout(
                                members: state.filteredMembers,
                                onMemberTap: (m) => _onMemberTap(context, m),
                              ),
                            ],
                            const SizedBox(height: 44),
                            GovernanceAssuranceBanner(
                              assurance: state.governanceAssurance,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const AppFooterBar(),
        ],
      ),
    );
  }
}
