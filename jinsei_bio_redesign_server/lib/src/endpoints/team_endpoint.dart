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
          'https://lh3.googleusercontent.com/aida/AEtjO1X_nmBcbi4M1mmLUOONovLgU248e0BXOYbLPu01ed2b8zpAvEh70rSrUyENlT7yDJqnHltkEnYTmf0Fp3JMX5N8OJi65ZgU5GU765zIMDl0bkeJR09cFNcZacqufbR0pcUSq_-JKtHjJCXoFfeWCscIbR3St1Pjg1tC6coHwr5L54ysSxi-i9X1IdCZ8CpkO9JF8mVPXJyDMEoyZxc2191LGuesziA954s9tOGvyC_UuNyfkHTqvYIM',
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
          'https://lh3.googleusercontent.com/aida/AEtjO1X2yXb4Q4KyxNFq1vrKVbk7aR5EZnCBkKgMksjDs3gAY_NjXwUgogKu3bL3dyyEAu_I-VYlqHS89CLD1hOcaPUjKrNGQg1iVB66Sy5bzQr80Y0bCdZocIF-0UBOnanB2wfJywT1gjVkOs_xWJY0FE6tvCoMtl84aCbfyVaEWUk2bX2srw0PLhRH-S6JrCFxNZyZa5ZjWA2qlnXrWyBty6SUolrW2kLkdBLTauOn6qLQ7IcI7BwdCwR5gw',
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
          'https://lh3.googleusercontent.com/aida/AEtjO1U69qjewYlHwognIESNy4LumoHBt9_wSPFdw2jxn8teuHI4bdcUYocvS96VdjNCJBumF0GIxnCWDZWIF9BdqmlUnP8ikHSRZTtDQDlPidRW8hPu8f08krPex4VJZyfFrRPON-2GntmCCWqMcxtFj9Oh6OUuik9zZ1-azr7aoy84krO5CYaJKqkJxLn0AjDwtHHF4FD7ojxJxVXtNT5iQ8WgTLtqI7cZbMDCAjRTkSvUSrDt3nZETpfk',
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
          'https://lh3.googleusercontent.com/aida/AEtjO1WVMWIvu0m8YsGoYsmLevVnEVOlk6XXxCPG-10rZNw61oyqpaItUGBhmqwy5w8BCr4jTheXk2Z2JQox_NEibriroC3lHY37Kc3RxbjUb1r0_2KOqy2C-VWsyt-W9qxpS76RUsr7VqCnaovvgl8maefl5W4PS5dJ6RxHZEX7SVa3bJH4n0Fe4SNnyYuFCF9qtZyEq-1mK2qsWKT-UstJ66_u-5g87jhQLijmAN__HTGinGAGdQJkPToAPA',
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
          'https://lh3.googleusercontent.com/aida/AEtjO1XITF4MhT8uQV8yydRxFOhX-c20iXygFBtQpblni7JpejlrDW8rvBqBaAXAqls9Bwa2ws26uNzuP3mSSVVQAIRkv8eMGWYoxv6MgwlBDvmwB0V-ucoIrXlfO2AD99qy3OIdRvrSZjiLwFTqqMkxzr9AWdD6PYojMMHlT7KpTeSPE3xJI2kyTJKmlq0TVGDXEMpTOFSQGMAOA1BSp9vuFlXupKa57jDMTZSkJT2exwPv7dEOwRhq_Geu',
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
          'https://lh3.googleusercontent.com/aida/AEtjO1XD_aQFupkewEaHzyGnLoq5eSX5vbwEfNw-X2U8gd6EYu-VDwk2y_Gb84jKD0ieQ6PFFqRXMXPuaPaiAoHuY8yv20FKcIYWD47fibJL5gzWbYy1qtt5il7SfzE3u_TPesnXF8FUdu0I-p59wGXut-PFJ8nUx0LlLwtlaIGE7sWmuIOw5NezMHPkdzRehPv2TePmZ5gKl2-AMOU9GbbnUr6NpGzQ4shYfX-BFwiJBTDdDCn5psEfztBBRw',
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
          'https://lh3.googleusercontent.com/aida/AEtjO1XY5WWYws8wWvmk1PjhR2UrT_El8FovSWKwp4owcqKNke2diyZGwACOTotQhOZuwVxSIOBRV7PAnixviFlwqxvDKB47PXLl3tMSAs71xxfuHCR2K6jTEMyct2FtD5VH1t_XYBUs7loUZNregJZ4tZ6pT1C9UQ-es-s3vRsNUUakOudeBj9NJjB2McTpeCnCbv-HGgU1Kuv2zILb-JYybBOF8rDWed5Mw29uaI643kQGLGqa-0Dni91oZw',
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
          'https://lh3.googleusercontent.com/aida/AEtjO1UUeFJkLEBv_XHTbceDTfn_7tHy3eo3bHqtTu7txlNisTAiRms3tqojUa_pRYVbcWGHUPDYTK36L_798WsIjTXKQQLOhhozww27ySUJ0bj-036P8yGD-_5THk5Huu3cZE0mlQpGpPgc0DqEWP6y-r5tWcWZW-X16HSO5n5sbn6JGS7CIwrjDRLN3fMYpY6jPYe2TBMC4rdZnYc1x_lN4H_3cILLwy5O_9hOUvFQF_NxHYXI9HKMJenOTg',
      displayOrder: 8,
    ),
  ];
}
