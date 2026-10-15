import 'package:flutter/material.dart';
import '../../domain/models/team_member_model.dart';
import 'discovery_emblem_widget.dart';
import 'leadership_card_widget.dart';

class LeadershipExecutiveRow extends StatelessWidget {
  final List<TeamMemberModel> executiveMembers;
  final String emblemTitle;
  final String emblemSubtitle;
  final ValueChanged<TeamMemberModel>? onMemberTap;

  const LeadershipExecutiveRow({
    super.key,
    required this.executiveMembers,
    this.emblemTitle = 'JINSEI BIOSCIENCE',
    this.emblemSubtitle = 'Translational Microbial Discovery Engine',
    this.onMemberTap,
  });

  @override
  Widget build(BuildContext context) {
    if (executiveMembers.isEmpty) return const SizedBox.shrink();

    final ceo = executiveMembers.first;
    final cso = executiveMembers.length > 1 ? executiveMembers[1] : null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        if (isDesktop) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LeadershipCardWidget(
                  member: ceo,
                  onTap: () => onMemberTap?.call(ceo),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Center(
                  child: DiscoveryEmblemWidget(
                    title: emblemTitle,
                    subtitle: emblemSubtitle,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: cso != null
                    ? LeadershipCardWidget(
                        member: cso,
                        onTap: () => onMemberTap?.call(cso),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          );
        }

        // Mobile & Tablet Layout: Stack with Emblem
        return Column(
          children: [
            LeadershipCardWidget(
              member: ceo,
              onTap: () => onMemberTap?.call(ceo),
            ),
            const SizedBox(height: 24),
            DiscoveryEmblemWidget(
              title: emblemTitle,
              subtitle: emblemSubtitle,
            ),
            if (cso != null) ...[
              const SizedBox(height: 24),
              LeadershipCardWidget(
                member: cso,
                onTap: () => onMemberTap?.call(cso),
              ),
            ],
          ],
        );
      },
    );
  }
}
