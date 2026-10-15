import 'package:flutter/material.dart';
import '../../domain/models/team_member_model.dart';
import 'leadership_card_widget.dart';

class LeadershipGridLayout extends StatelessWidget {
  final List<TeamMemberModel> members;
  final ValueChanged<TeamMemberModel>? onMemberTap;

  const LeadershipGridLayout({
    super.key,
    required this.members,
    this.onMemberTap,
  });

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Text('No team members found for this category.'),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 960
            ? 3
            : (constraints.maxWidth >= 640 ? 2 : 1);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            mainAxisExtent: 440,
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return LeadershipCardWidget(
              member: member,
              onTap: () => onMemberTap?.call(member),
            );
          },
        );
      },
    );
  }
}
