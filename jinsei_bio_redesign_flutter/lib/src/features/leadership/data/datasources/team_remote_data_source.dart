import 'dart:async';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import '../../../../core/config/app_config.dart';
import '../../domain/models/governance_assurance_model.dart';
import '../../domain/models/leadership_content_model.dart';
import '../../domain/models/team_member_model.dart';

abstract class ITeamRemoteDataSource {
  Future<LeadershipContentModel?> getLeadershipContent({
    Duration timeout = const Duration(milliseconds: 5000),
  });
}

class TeamRemoteDataSource implements ITeamRemoteDataSource {
  final Client _client;

  TeamRemoteDataSource({Client? client})
      : _client = client ?? Client(AppConfig.serverpodUrl);

  @override
  Future<LeadershipContentModel?> getLeadershipContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final response =
          await _client.team.getLeadershipContent().timeout(timeout);

      final members = response.members
          .map((m) => TeamMemberModel.fromJson({
                'memberId': m.memberId,
                'name': m.name,
                'role': m.role,
                'categoryTag': m.categoryTag,
                'category': m.category,
                'academicCredential': m.academicCredential,
                'areaOfExpertise': m.areaOfExpertise,
                'imageUrl': m.imageUrl,
                'displayOrder': m.displayOrder,
              }))
          .toList();

      GovernanceAssuranceModel? qa;
      if (response.governanceAssurance != null) {
        qa = GovernanceAssuranceModel.fromJson({
          'title': response.governanceAssurance!.title,
          'description': response.governanceAssurance!.description,
          'badgeText': response.governanceAssurance!.badgeText,
          'complianceStandard':
              response.governanceAssurance!.complianceStandard,
        });
      }

      return LeadershipContentModel(
        headerBadge: response.headerBadge,
        headline: response.headline,
        subhead: response.subhead,
        emblemTitle: response.emblemTitle,
        emblemSubtitle: response.emblemSubtitle,
        members: members,
        governanceAssurance: qa,
      );
    } catch (_) {
      return null;
    }
  }
}
