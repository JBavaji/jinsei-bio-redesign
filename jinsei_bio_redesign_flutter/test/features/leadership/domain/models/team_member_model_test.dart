import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/governance_assurance_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/leadership_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_category.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/domain/models/team_member_model.dart';

void main() {
  group('Team Domain Models Tests', () {
    test('TeamMemberModel fromJson and toJson roundtrip', () {
      final json = {
        'memberId': 'lead_ria_deshpande',
        'name': 'Dr. Ria Deshpande, PhD',
        'role': 'Chief Executive Officer (CEO)',
        'categoryTag': 'Executive Lead',
        'category': 'executive',
        'academicCredential': 'PhD in Systems Biology from UC Irvine',
        'areaOfExpertise': 'Translational R&D & Strategy',
        'imageUrl': 'https://example.com/ria.webp',
        'displayOrder': 1,
      };

      final model = TeamMemberModel.fromJson(json);

      expect(model.memberId, 'lead_ria_deshpande');
      expect(model.name, 'Dr. Ria Deshpande, PhD');
      expect(model.role, 'Chief Executive Officer (CEO)');
      expect(model.categoryTag, 'Executive Lead');
      expect(model.category, 'executive');
      expect(model.isExecutive, isTrue);
      expect(model.teamCategory, TeamCategory.executive);
      expect(model.academicCredential, 'PhD in Systems Biology from UC Irvine');
      expect(model.areaOfExpertise, 'Translational R&D & Strategy');
      expect(model.imageUrl, 'https://example.com/ria.webp');
      expect(model.displayOrder, 1);

      final output = model.toJson();
      expect(output['memberId'], 'lead_ria_deshpande');
      expect(output['displayOrder'], 1);
    });

    test('TeamCategory enum parsing fromId with fallback', () {
      expect(TeamCategory.fromId('executive'), TeamCategory.executive);
      expect(TeamCategory.fromId('scientific'), TeamCategory.scientific);
      expect(TeamCategory.fromId('product'), TeamCategory.product);
      expect(TeamCategory.fromId('operations'), TeamCategory.operations);
      expect(TeamCategory.fromId('all'), TeamCategory.all);
      expect(TeamCategory.fromId('unknown_category'), TeamCategory.all);
    });

    test('GovernanceAssuranceModel fromJson and toJson roundtrip', () {
      final json = {
        'title': 'Scientific Governance & Ethics Assurance',
        'description': 'ISO 9001:2015 & cGMP Certified R&D Standards',
        'badgeText': 'Pune NCL Innovation Park',
        'complianceStandard': 'Bio-Prospecting Ethics Compliant',
      };

      final model = GovernanceAssuranceModel.fromJson(json);
      expect(model.title, 'Scientific Governance & Ethics Assurance');
      expect(model.badgeText, 'Pune NCL Innovation Park');

      final output = model.toJson();
      expect(output['description'],
          'ISO 9001:2015 & cGMP Certified R&D Standards');
    });

    test('LeadershipContentModel fromJson and toJson roundtrip', () {
      final json = {
        'headerBadge': 'ONE TEAM, ONE VISION',
        'headline': 'Leadership & R&D Team',
        'subhead': 'Pioneering microbiologists',
        'emblemTitle': 'JINSEI BIOSCIENCE',
        'emblemSubtitle': 'Translational Microbial Discovery Engine',
        'members': [
          {
            'memberId': 'lead_1',
            'name': 'Member 1',
            'role': 'Role 1',
            'categoryTag': 'Tag 1',
            'category': 'scientific',
            'academicCredential': 'PhD',
            'areaOfExpertise': 'Focus 1',
            'imageUrl': null,
            'displayOrder': 1,
          }
        ],
        'governanceAssurance': {
          'title': 'Assurance',
          'description': 'ISO',
          'badgeText': 'Pune',
          'complianceStandard': 'Ethics',
        },
      };

      final model = LeadershipContentModel.fromJson(json);
      expect(model.headline, 'Leadership & R&D Team');
      expect(model.members.length, 1);
      expect(model.governanceAssurance?.title, 'Assurance');

      final output = model.toJson();
      expect(output['headerBadge'], 'ONE TEAM, ONE VISION');
    });
  });
}
