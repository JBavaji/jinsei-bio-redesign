import '../models/leadership_content_model.dart';
import '../models/team_member_model.dart';

abstract class ITeamRepository {
  Future<LeadershipContentModel> getLeadershipContent();
  Future<List<TeamMemberModel>> getTeamMembers();
  Future<List<TeamMemberModel>> getTeamMembersByCategory(String category);
}
