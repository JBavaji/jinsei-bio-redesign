import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Serverpod Endpoint for Leadership & Advisory Team
class TeamEndpoint extends Endpoint {
  /// Fetches the complete Leadership Team content payload including members and governance standards.
  Future<LeadershipContent> getLeadershipContent(Session session) async {
    try {
      var members = await TeamMember.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );

      if (members.isEmpty) {
        members = await _seedTeamMembers(session);
      }

      return LeadershipContent(
        headerBadge: 'ONE TEAM, ONE VISION',
        headline: 'Leadership & R&D Team',
        subhead:
            'Pioneering microbiologists, computational biologists, and growth strategists translating indigenous human microbial isolates into validated therapeutic solutions.',
        emblemTitle: 'JINSEI BIOSCIENCE',
        emblemSubtitle: 'Translational Microbial Discovery Engine',
        members: members,
        governanceAssurance: _defaultGovernanceAssurance,
      );
    } catch (_) {
      return LeadershipContent(
        headerBadge: 'ONE TEAM, ONE VISION',
        headline: 'Leadership & R&D Team',
        subhead:
            'Pioneering microbiologists, computational biologists, and growth strategists translating indigenous human microbial isolates into validated therapeutic solutions.',
        emblemTitle: 'JINSEI BIOSCIENCE',
        emblemSubtitle: 'Translational Microbial Discovery Engine',
        members: _defaultTeamMembers,
        governanceAssurance: _defaultGovernanceAssurance,
      );
    }
  }

  /// Fetches all team members ordered by display order.
  Future<List<TeamMember>> getTeamMembers(Session session) async {
    try {
      var members = await TeamMember.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      if (members.isEmpty) {
        members = await _seedTeamMembers(session);
      }
      return members;
    } catch (_) {
      return _defaultTeamMembers;
    }
  }

  /// Fetches team members filtered by category (executive, scientific, product, operations).
  Future<List<TeamMember>> getTeamMembersByCategory(
    Session session,
    String category,
  ) async {
    try {
      var members = await TeamMember.db.find(
        session,
        where: (t) => t.category.equals(category),
        orderBy: (t) => t.displayOrder,
      );
      if (members.isEmpty) {
        return _defaultTeamMembers
            .where((m) => m.category == category)
            .toList();
      }
      return members;
    } catch (_) {
      return _defaultTeamMembers.where((m) => m.category == category).toList();
    }
  }

  // --- Seed Database Helper Methods ---

  static Future<List<TeamMember>> _seedTeamMembers(Session session) async {
    for (var m in _defaultTeamMembers) {
      await TeamMember.db.insertRow(session, m);
    }
    return await TeamMember.db.find(
      session,
      orderBy: (t) => t.displayOrder,
    );
  }

  // --- Static Defaults & Contracts ---

  static final ClinicalQualityAssurance _defaultGovernanceAssurance =
      ClinicalQualityAssurance(
    title: 'Scientific Governance & Ethics Assurance',
    description:
        'ISO 9001:2015 & GMP Certified R&D Standards • Ethical Bio-Prospecting',
    badgeText: 'Pune NCL Innovation Park',
    complianceStandard: 'Bio-Prospecting Ethics Compliant',
  );

  static final List<TeamMember> _defaultTeamMembers = [
    TeamMember(
      memberId: 'dr-ria-deshpande',
      name: 'Dr. Ria Deshpande, PhD',
      role: 'Chief Executive Officer (CEO)',
      categoryTag: 'EXECUTIVE LEAD',
      category: 'executive',
      academicCredential:
          'PhD in Mathematical, Computational and Systems Biology from University of California, Irvine',
      areaOfExpertise:
          'Overseeing all aspects of business, finance, regulatory compliance, and daily operations.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_01_dr_ria_deshpande.webp',
      displayOrder: 1,
    ),
    TeamMember(
      memberId: 'dr-asha-kembhavi',
      name: 'Dr. Asha Kembhavi',
      role: 'Chief Scientific Officer (CSO)',
      categoryTag: 'SCIENTIFIC LEADERSHIP',
      category: 'executive',
      academicCredential: 'PhD in Applied Biology from Cambridge University',
      areaOfExpertise:
          'Overseeing all aspects of R&D operations and long-term scientific strategy.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_02_dr_asha_kembhavi.webp',
      displayOrder: 2,
    ),
    TeamMember(
      memberId: 'dr-kirankumar-beede',
      name: 'Dr. Kirankumar Beede',
      role: 'Principal Scientist',
      categoryTag: 'PRINCIPAL SCIENTIST',
      category: 'scientific',
      academicCredential: 'PhD in Biochemistry',
      areaOfExpertise:
          'Characterization, upstream and downstream optimization, pre-pilot development, formulations, bioactivity optimization, scaling for commercialization.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_03_dr_kirankumar_beede.webp',
      displayOrder: 3,
    ),
    TeamMember(
      memberId: 'nandita-bal',
      name: 'Nandita Bal',
      role: 'Scientist & Growth Strategist',
      categoryTag: 'GROWTH & REGULATORY',
      category: 'product',
      academicCredential:
          'Master\'s in Biomedical Engg (Cornell University) & Master\'s in Chemical Engg (Northeastern University)',
      areaOfExpertise:
          'Target consumer product identification, regulatory compliance, IP strategy, business development and finance.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_04_nandita_bal.webp',
      displayOrder: 4,
    ),
    TeamMember(
      memberId: 'rucha-karkamkar',
      name: 'Rucha Karkamkar',
      role: 'Scientist & Product Manager',
      categoryTag: 'PRODUCT MANAGEMENT',
      category: 'product',
      academicCredential: 'Master\'s in Biotechnology (Pune University)',
      areaOfExpertise:
          'Characterization, product development, formulation and formats, shelf life and stability, scaling for commercialization.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_05_rucha_karkamkar.webp',
      displayOrder: 5,
    ),
    TeamMember(
      memberId: 'sudharani-beede',
      name: 'Sudharani Beede',
      role: 'Lab Manager',
      categoryTag: 'OPERATIONS & LAB',
      category: 'operations',
      academicCredential: 'B.Sc (CBZ) and MBA (Karnataka)',
      areaOfExpertise:
          'Lab inventory management, vendor relationships, procurement management.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_06_sudharani_beede.webp',
      displayOrder: 6,
    ),
    TeamMember(
      memberId: 'harshal-kelkar',
      name: 'Harshal Kelkar',
      role: 'Associate Scientist',
      categoryTag: 'UPSTREAM OPTIMIZATION',
      category: 'scientific',
      academicCredential: 'M.Sc. Biotechnology (Lund University)',
      areaOfExpertise: 'Upstream optimization, strain characterization.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_07_harshal_kelkar.webp',
      displayOrder: 7,
    ),
    TeamMember(
      memberId: 'saloni-koul',
      name: 'Saloni Koul',
      role: 'Associate Scientist',
      categoryTag: 'BIO-FUNCTIONAL ASSAYS',
      category: 'scientific',
      academicCredential:
          'Integrated Master of Science (M.Sc.) in Biotechnology (IBB, SPPU)',
      areaOfExpertise:
          'Strain characterization, assay development, application studies.',
      imageUrl:
          'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_08_saloni_koul.webp',
      displayOrder: 8,
    ),
  ];
}
