import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_contact_info_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_inquiry_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_track_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/repositories/i_collaborations_repository.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/bloc/collaborations_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_campus_map_card.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_contact_card.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_governance_banner.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_header_section.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_inquiry_form.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/partnership_tracks_section.dart';

class StubRepository implements ICollaborationsRepository {
  @override
  Future<CollaborationContentModel> getCollaborationsContent() async =>
      const CollaborationContentModel(
        headlineBadge: 'STRATEGIC ALLIANCES & CRO SERVICES',
        heroTitle: 'LOOKING TO COLLABORATE WITH US?',
        heroSubtitle: 'Partnering with FMCG leaders',
        tracks: [],
        contactInfo: CollaborationContactInfoModel(
          supportEmail: 'info@jinseibio.com',
          supportNotice: '24h',
          facilityName: 'Campus',
          facilityAddress: 'Pashan, Pune',
          facilityCoordinates: '18.5362° N, 73.8152° E',
          visitingTimings: 'Mon-Sat',
          visitingStatus: 'By Appointment',
          standards: [],
        ),
        governanceTitle: 'Ethics',
        governanceDescription: 'ISO',
      );

  @override
  Future<String> submitCollaborationInquiry(
          CollaborationInquiryModel inquiry) async =>
      'JIN-COL-2026-TEST';
}

void main() {
  group('Collaborations Modular Widgets Tests (JIN-68 / JIN-72)', () {
    testWidgets('CollaborationHeaderSection renders badge, title, subtitle',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollaborationHeaderSection(
              badge: 'STRATEGIC ALLIANCES & CRO SERVICES',
              title: 'LOOKING TO COLLABORATE WITH US?',
              subtitle: 'Partnering with FMCG leaders and enterprises.',
            ),
          ),
        ),
      );

      expect(find.text('STRATEGIC ALLIANCES & CRO SERVICES'), findsOneWidget);
      expect(find.text('LOOKING TO COLLABORATE WITH US?'), findsOneWidget);
      expect(find.text('Partnering with FMCG leaders and enterprises.'),
          findsOneWidget);
    });

    testWidgets('PartnershipTracksSection renders 3 tracks responsively',
        (tester) async {
      final tracks = [
        const CollaborationTrackModel(
          trackId: 'fmcg_integration',
          title: '1. FMCG Integration',
          badge: 'Pillar 1',
          description: 'Include indigenous strains for fermentation.',
          deliverables: ['Dossiers'],
          iconKey: 'sanitizer',
        ),
        const CollaborationTrackModel(
          trackId: 'lab_cro',
          title: '2. LAB CRO Services',
          badge: 'Pillar 2',
          description: 'Yield enhancement and contract research.',
          deliverables: ['Yields'],
          iconKey: 'science',
        ),
        const CollaborationTrackModel(
          trackId: 'co_development',
          title: '3. Co-Development',
          badge: 'Pillar 3',
          description: 'Joint R&D for microbial applications.',
          deliverables: ['Consortiums'],
          iconKey: 'biotech',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PartnershipTracksSection(tracks: tracks),
          ),
        ),
      );

      expect(find.text('Partnership Tracks'), findsOneWidget);
      expect(find.text('1. FMCG Integration'), findsOneWidget);
      expect(find.text('2. LAB CRO Services'), findsOneWidget);
      expect(find.text('3. Co-Development'), findsOneWidget);
    });

    testWidgets('CollaborationContactCard renders address, timings, standards',
        (tester) async {
      const contactInfo = CollaborationContactInfoModel(
        supportEmail: 'info@jinseibio.com',
        supportNotice: 'Guaranteed response within 24h',
        facilityName: 'State-of-the-art incubation campus',
        facilityAddress: 'NCL Innovation Park, Pashan, Pune',
        facilityCoordinates: '18.5362° N, 73.8152° E',
        visitingTimings: 'Monday - Saturday: By Appointment',
        visitingStatus: 'By Appointment',
        standards: [
          CollaborationComplianceStandardModel(
            title: 'ISO 9001:2015',
            description: 'Quality Management Systems',
            badge: 'Certified',
          ),
          CollaborationComplianceStandardModel(
            title: 'GMP Certified',
            description: 'Good Manufacturing Practices',
            badge: 'Certified',
          ),
        ],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollaborationContactCard(contactInfo: contactInfo),
          ),
        ),
      );

      expect(find.text('Reach out to us'), findsOneWidget);
      expect(find.text('info@jinseibio.com'), findsOneWidget);
      expect(find.text('Better yet, come visit us!'), findsOneWidget);
      expect(find.text('NCL Innovation Park, Pashan, Pune'), findsOneWidget);
      expect(find.text('Timings'), findsOneWidget);
      expect(find.text('By Appointment'), findsNWidgets(2));
      expect(find.text('ISO 9001:2015'), findsOneWidget);
      expect(find.text('GMP Certified'), findsOneWidget);
    });

    testWidgets('CollaborationCampusMapCard renders map title and action',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollaborationCampusMapCard(),
          ),
        ),
      );

      expect(find.text('NCL Innovation Park Campus Map'), findsOneWidget);
      expect(find.byKey(const Key('get_directions_button')), findsOneWidget);
      expect(find.text('Jinsei Bioscience Pvt. Ltd.'), findsOneWidget);
    });

    testWidgets('CollaborationGovernanceBanner renders governance assurance',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CollaborationGovernanceBanner(
              title: 'Scientific Governance & Ethics Assurance',
              description: 'ISO 9001:2015 & GMP Certified R&D Standards',
            ),
          ),
        ),
      );

      expect(find.text('Scientific Governance & Ethics Assurance'),
          findsOneWidget);
      expect(find.text('ISO 9001:2015 & GMP Certified R&D Standards'),
          findsOneWidget);
      expect(find.text('Pune NCL Innovation Park'), findsOneWidget);
    });

    testWidgets('CollaborationInquiryForm renders inputs and submits',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repository = StubRepository();
      final bloc = CollaborationsBloc(repository: repository);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: BlocProvider.value(
                value: bloc,
                child: const CollaborationInquiryForm(),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Submit Collaboration Inquiry'), findsOneWidget);
      expect(find.byKey(const Key('collab_name_input')), findsOneWidget);
      expect(find.byKey(const Key('collab_email_input')), findsOneWidget);
      expect(find.byKey(const Key('collab_org_input')), findsOneWidget);
      expect(find.byKey(const Key('collab_track_dropdown')), findsOneWidget);
      expect(find.byKey(const Key('collab_message_input')), findsOneWidget);
      expect(find.byKey(const Key('collab_submit_button')), findsOneWidget);

      // Enter valid input
      await tester.enterText(
          find.byKey(const Key('collab_name_input')), 'Dr. Jane Smith');
      await tester.enterText(
          find.byKey(const Key('collab_email_input')), 'jane@smithbio.com');
      await tester.enterText(
          find.byKey(const Key('collab_org_input')), 'Smith Biologics');
      await tester.enterText(find.byKey(const Key('collab_message_input')),
          'We would like to explore licensing and co-development of gut isolates.');
      await tester.pump();

      // Submit
      await tester.tap(find.byKey(const Key('collab_submit_button')));
      await tester.pumpAndSettle();

      expect(find.text('Inquiry Received Successfully'), findsOneWidget);
      expect(find.textContaining('JIN-COL-2026-TEST'), findsOneWidget);
      expect(find.byKey(const Key('submit_another_inquiry_button')),
          findsOneWidget);
    });
  });
}
