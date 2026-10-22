import 'dart:io';
import 'package:jinsei_bio_redesign_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() {
  group('Serverpod PostgreSQL Models & Migrations Verification (JIN-24)', () {
    test('All 10 core entity tables are defined and instantiate cleanly', () {
      final stat = ExecutiveStat(
        iconKey: 'speed',
        title: '3x Faster',
        subtitle: 'Optimization',
        displayOrder: 1,
      );
      expect(ExecutiveStat.t.tableName, 'executive_stat');
      expect(stat.title, '3x Faster');

      final pillar = PillarItem(
        iconKey: 'science',
        title: 'Microbial Profiling',
        description: 'Genomic isolation',
        displayOrder: 1,
      );
      expect(PillarItem.t.tableName, 'pillar_item');
      expect(pillar.title, 'Microbial Profiling');

      final vertical = ProductVertical(
        title: 'FMCG Skin Barrier',
        strainId: 'JB-L-01',
        description: 'Lactobacillus topical',
        displayOrder: 1,
      );
      expect(ProductVertical.t.tableName, 'product_vertical');
      expect(vertical.strainId, 'JB-L-01');

      final scienceHeader = ScienceHeaderMetric(
        iconKey: 'check_circle',
        value: '10',
        label: 'Pipeline Steps',
        accentColorHex: '#66DD8B',
        displayOrder: 1,
      );
      expect(ScienceHeaderMetric.t.tableName, 'science_header_metric');
      expect(scienceHeader.value, '10');

      final scienceStep = ScienceStep(
        stepNumber: 1,
        title: 'Isolation',
        subtitle: 'Sample acquisition',
        description: 'Acquiring isolates',
        category: 'Discovery',
        iconKey: 'biotech',
        metricValue: '100%',
        metricLabel: 'Purity',
        imageUrl: '/static/science/step_01.webp',
        displayOrder: 1,
      );
      expect(ScienceStep.t.tableName, 'science_step');
      expect(scienceStep.stepNumber, 1);

      final solutionMetric = SolutionMetric(
        iconKey: 'insights',
        value: '4',
        label: 'Commercial Verticals',
        accentColorHex: '#7BD4E2',
        displayOrder: 1,
      );
      expect(SolutionMetric.t.tableName, 'solution_metric');
      expect(solutionMetric.value, '4');

      final solutionCard = SolutionCard(
        solutionId: 'fmcg-gut',
        categoryTag: 'Gut Health',
        title: 'Synbiotic Gut Formulation',
        subtitle: 'Targeted Microbiome Modulation',
        description: 'Clinically validated strains',
        iconKey: 'sanitizer',
        category: 'FMCG & Consumer Health',
        formulationCount: '6 Formulations',
        keyBenefit: 'GI Tract Integrity',
        efficacyMetric: '94% Biomarker Elevation',
        bulletPoints: ['Lactobacillus acidophilus JB-L-01', 'Bifidobacterium'],
        actionCtaText: 'Request Formulation Dossier',
        caseStudyUrl: '/dossier/gut',
        imageUrl: '/static/solutions/gut.webp',
        displayOrder: 1,
      );
      expect(SolutionCard.t.tableName, 'solution_card');
      expect(solutionCard.solutionId, 'fmcg-gut');

      final teamMember = TeamMember(
        memberId: 'elena-rostova',
        name: 'Elena Rostova',
        role: 'Chief Executive Officer',
        categoryTag: 'Executive Leadership',
        category: 'Executive Leadership',
        academicCredential: 'MBA, Harvard · M.S. Biotechnology',
        areaOfExpertise: 'Strategic Operations & Commercialization',
        imageUrl: '/static/team/elena.webp',
        displayOrder: 1,
      );
      expect(TeamMember.t.tableName, 'team_member');
      expect(teamMember.name, 'Elena Rostova');

      final b2b = B2bSampleRequest(
        strainId: 'JB-L-01',
        fullName: 'Dr. Jane Doe',
        email: 'jane@pharma.com',
        company: 'PharmaCorp Inc.',
        formulationFormat: 'Lyophilized Bulk Powder',
        clinicalScope: 'Phase 1 Study',
        trackingId: 'JIN-B2B-TEST',
        submittedAt: DateTime.now(),
        status: 'pending',
      );
      expect(B2bSampleRequest.t.tableName, 'b2b_sample_request');
      expect(b2b.company, 'PharmaCorp Inc.');

      final collab = CollaborationInquiry(
        name: 'Prof. John Smith',
        email: 'john@university.edu',
        organization: 'National Research Lab',
        partnershipTrack: 'Lactic Acid Bacteria CRO',
        message: 'Proposal for joint R&D.',
        trackingId: 'JIN-COL-TEST',
        submittedAt: DateTime.now(),
        status: 'pending',
      );
      expect(CollaborationInquiry.t.tableName, 'collaboration_inquiry');
      expect(collab.partnershipTrack, 'Lactic Acid Bacteria CRO');
    });

    test('Migration files and registry are valid and registered', () {
      final registryFile = File('migrations/migration_registry.txt');
      expect(registryFile.existsSync(), isTrue);

      final registryContent = registryFile.readAsStringSync();
      expect(registryContent.contains('20260925103528334'), isTrue);
      expect(registryContent.contains('complete-postgresql-schema'), isTrue);

      final migrationDir =
          Directory('migrations/20261022041133122-complete-postgresql-schema');
      expect(migrationDir.existsSync(), isTrue);

      final migrationSql =
          File('${migrationDir.path}/migration.sql').readAsStringSync();
      expect(
          migrationSql.contains('CREATE TABLE "b2b_sample_request"'), isTrue);
      expect(migrationSql.contains('CREATE TABLE "collaboration_inquiry"'),
          isTrue);
      expect(migrationSql.contains('CREATE TABLE "science_header_metric"'),
          isTrue);
      expect(migrationSql.contains('CREATE TABLE "science_step"'), isTrue);
      expect(migrationSql.contains('CREATE TABLE "solution_card"'), isTrue);
      expect(migrationSql.contains('CREATE TABLE "solution_metric"'), isTrue);
      expect(migrationSql.contains('CREATE TABLE "team_member"'), isTrue);

      final definitionSql =
          File('${migrationDir.path}/definition.sql').readAsStringSync();
      expect(definitionSql.contains('CREATE TABLE "executive_stat"'), isTrue);
      expect(definitionSql.contains('CREATE TABLE "pillar_item"'), isTrue);
      expect(definitionSql.contains('CREATE TABLE "product_vertical"'), isTrue);
      expect(
          definitionSql.contains('CREATE TABLE "b2b_sample_request"'), isTrue);
      expect(definitionSql.contains('CREATE TABLE "collaboration_inquiry"'),
          isTrue);
      expect(definitionSql.contains('CREATE TABLE "science_header_metric"'),
          isTrue);
      expect(definitionSql.contains('CREATE TABLE "science_step"'), isTrue);
      expect(definitionSql.contains('CREATE TABLE "solution_card"'), isTrue);
      expect(definitionSql.contains('CREATE TABLE "solution_metric"'), isTrue);
      expect(definitionSql.contains('CREATE TABLE "team_member"'), isTrue);
    });
  });
}
