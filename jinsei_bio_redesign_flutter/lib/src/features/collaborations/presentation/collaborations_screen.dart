import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_error_state_view.dart';
import '../../../core/widgets/app_footer_bar.dart';
import '../../../core/widgets/app_loading_indicator.dart';
import '../data/repositories/collaborations_repository_impl.dart';
import 'bloc/collaborations_bloc.dart';
import 'bloc/collaborations_event.dart';
import 'bloc/collaborations_state.dart';
import 'widgets/collaboration_campus_map_card.dart';
import 'widgets/collaboration_contact_card.dart';
import 'widgets/collaboration_governance_banner.dart';
import 'widgets/collaboration_header_section.dart';
import 'widgets/collaboration_inquiry_form.dart';
import 'widgets/partnership_tracks_section.dart';

class CollaborationsScreen extends StatelessWidget {
  final CollaborationsBloc? bloc;

  const CollaborationsScreen({super.key, this.bloc});

  @override
  Widget build(BuildContext context) {
    if (bloc != null) {
      return BlocProvider.value(
        value: bloc!,
        child: const _CollaborationsScreenView(),
      );
    }
    return BlocProvider(
      create: (context) => CollaborationsBloc(
        repository: CollaborationsRepositoryImpl(),
      )..add(const LoadCollaborationsContentEvent()),
      child: const _CollaborationsScreenView(),
    );
  }
}

class _CollaborationsScreenView extends StatelessWidget {
  const _CollaborationsScreenView();

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1240),
                child: BlocBuilder<CollaborationsBloc, CollaborationsState>(
                  builder: (context, state) {
                    if (state.isLoading && state.content == null) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 80),
                          child: AppLoadingIndicator(),
                        ),
                      );
                    }

                    if (state.isFailed && state.content == null) {
                      return AppErrorStateView(
                        errorMessage: state.errorMessage ??
                            'Failed to load collaboration data.',
                        onRetry: () => context
                            .read<CollaborationsBloc>()
                            .add(const LoadCollaborationsContentEvent()),
                      );
                    }

                    final content = state.content;
                    if (content == null) return const SizedBox.shrink();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CollaborationHeaderSection(
                          badge: content.headlineBadge,
                          title: content.heroTitle,
                          subtitle: content.heroSubtitle,
                        ),
                        const SizedBox(height: 48),
                        if (isDesktop)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  children: [
                                    PartnershipTracksSection(
                                        tracks: content.tracks),
                                    const SizedBox(height: 32),
                                    const CollaborationInquiryForm(),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                flex: 5,
                                child: CollaborationContactCard(
                                  contactInfo: content.contactInfo,
                                ),
                              ),
                            ],
                          )
                        else
                          Column(
                            children: [
                              PartnershipTracksSection(tracks: content.tracks),
                              const SizedBox(height: 24),
                              const CollaborationInquiryForm(),
                              const SizedBox(height: 24),
                              CollaborationContactCard(
                                contactInfo: content.contactInfo,
                              ),
                            ],
                          ),
                        const SizedBox(height: 48),
                        const CollaborationCampusMapCard(),
                        const SizedBox(height: 32),
                        CollaborationGovernanceBanner(
                          title: content.governanceTitle,
                          description: content.governanceDescription,
                        ),
                      ],
                    );
                  },
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
