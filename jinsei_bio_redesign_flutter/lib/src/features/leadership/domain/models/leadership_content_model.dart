import 'package:equatable/equatable.dart';

import 'governance_assurance_model.dart';
import 'team_member_model.dart';

class LeadershipContentModel extends Equatable {
  final String headerBadge;
  final String headline;
  final String subhead;
  final String emblemTitle;
  final String emblemSubtitle;
  final List<TeamMemberModel> members;
  final GovernanceAssuranceModel? governanceAssurance;

  const LeadershipContentModel({
    required this.headerBadge,
    required this.headline,
    required this.subhead,
    required this.emblemTitle,
    required this.emblemSubtitle,
    required this.members,
    this.governanceAssurance,
  });

  factory LeadershipContentModel.fromJson(Map<String, dynamic> json) {
    return LeadershipContentModel(
      headerBadge: json['headerBadge'] as String? ?? 'ONE TEAM, ONE VISION',
      headline: json['headline'] as String? ?? 'Leadership & R&D Team',
      subhead: json['subhead'] as String? ?? '',
      emblemTitle: json['emblemTitle'] as String? ?? 'JINSEI BIOSCIENCE',
      emblemSubtitle: json['emblemSubtitle'] as String? ??
          'Translational Microbial Discovery Engine',
      members: (json['members'] as List<dynamic>? ?? [])
          .map((m) => TeamMemberModel.fromJson(m as Map<String, dynamic>))
          .toList(),
      governanceAssurance: json['governanceAssurance'] != null
          ? GovernanceAssuranceModel.fromJson(
              json['governanceAssurance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'headerBadge': headerBadge,
      'headline': headline,
      'subhead': subhead,
      'emblemTitle': emblemTitle,
      'emblemSubtitle': emblemSubtitle,
      'members': members.map((m) => m.toJson()).toList(),
      'governanceAssurance': governanceAssurance?.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        headerBadge,
        headline,
        subhead,
        emblemTitle,
        emblemSubtitle,
        members,
        governanceAssurance,
      ];
}
