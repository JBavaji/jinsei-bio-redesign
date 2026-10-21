import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_error_state_view.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_footer_bar.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_loading_indicator.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_contact_info_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_inquiry_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_track_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/repositories/i_collaborations_repository.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/bloc/collaborations_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/bloc/collaborations_event.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/collaborations_screen.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_campus_map_card.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_contact_card.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_governance_banner.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_header_section.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/collaboration_inquiry_form.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/presentation/widgets/partnership_tracks_section.dart';

class StubScreenRepository implements ICollaborationsRepository {
  bool shouldThrow = false;
  Completer<CollaborationContentModel>? contentCompleter;

  final CollaborationContentModel stubContent = const CollaborationContentModel(
    headlineBadge: 'STRATEGIC ALLIANCES & CRO SERVICES',
    heroTitle: 'LOOKING TO COLLABORATE WITH US?',
    heroSubtitle: 'Partnering with FMCG leaders and enterprises.',
    tracks: [
      CollaborationTrackModel(
        trackId: 'fmcg_integration',
        title: '1. FMCG Integration',
        badge: 'Pillar 1',
        description: 'Fermentation optimization',
        deliverables: ['Dossiers'],
        iconKey: 'sanitizer',
      ),
      CollaborationTrackModel(
        trackId: 'lab_cro',
        title: '2. LAB CRO Services',
        badge: 'Pillar 2',
        description: 'Contract research',
        deliverables: ['Yields'],
        iconKey: 'science',
      ),
    ],
    contactInfo: CollaborationContactInfoModel(
      supportEmail: 'info@jinseibio.com',
      supportNotice: 'Guaranteed 24h response',
      facilityName: 'NCL Campus',
      facilityAddress: 'Pashan, Pune',
      facilityCoordinates: '18.5362° N, 73.8152° E',
      visitingTimings: 'Mon-Sat: By Appointment',
      visitingStatus: 'By Appointment',
      standards: [
        CollaborationComplianceStandardModel(
          title: 'ISO 9001:2015',
          description: 'Quality Systems',
          badge: 'Certified',
        ),
      ],
    ),
    governanceTitle: 'Scientific Governance & Ethics Assurance',
    governanceDescription: 'ISO 9001:2015 & GMP Certified R&D Standards',
  );

  @override
  Future<CollaborationContentModel> getCollaborationsContent() async {
    if (contentCompleter != null) {
      return contentCompleter!.future;
    }
    if (shouldThrow) throw Exception('Fetch failed');
    return stubContent;
  }

  @override
  Future<String> submitCollaborationInquiry(
          CollaborationInquiryModel inquiry) async =>
      'JIN-COL-2026-TEST';
}

void main() {
  group('CollaborationsScreen Integration Tests (JIN-68 / JIN-73)', () {
    testWidgets('renders loading state initially while content loads',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repository = StubScreenRepository();
      repository.contentCompleter = Completer<CollaborationContentModel>();
      final bloc = CollaborationsBloc(repository: repository);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CollaborationsScreen(bloc: bloc),
          ),
        ),
      );

      bloc.add(const LoadCollaborationsContentEvent());
      await tester.pump();

      expect(find.byType(AppLoadingIndicator), findsOneWidget);

      repository.contentCompleter!.complete(repository.stubContent);
      await tester.pumpAndSettle();
    });

    testWidgets('renders complete loaded view with all sections on desktop',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repository = StubScreenRepository();
      final bloc = CollaborationsBloc(repository: repository);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CollaborationsScreen(bloc: bloc),
          ),
        ),
      );

      bloc.add(const LoadCollaborationsContentEvent());
      await tester.pumpAndSettle();

      expect(find.byType(CollaborationHeaderSection), findsOneWidget);
      expect(find.byType(PartnershipTracksSection), findsOneWidget);
      expect(find.byType(CollaborationInquiryForm), findsOneWidget);
      expect(find.byType(CollaborationContactCard), findsOneWidget);
      expect(find.byType(CollaborationCampusMapCard), findsOneWidget);
      expect(find.byType(CollaborationGovernanceBanner), findsOneWidget);
      expect(find.byType(AppFooterBar), findsOneWidget);

      expect(find.text('STRATEGIC ALLIANCES & CRO SERVICES'), findsOneWidget);
      expect(find.text('LOOKING TO COLLABORATE WITH US?'), findsOneWidget);
      expect(find.text('1. FMCG Integration'), findsOneWidget);
      expect(find.text('2. LAB CRO Services'), findsOneWidget);
    });

    testWidgets('renders cleanly on mobile viewport', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repository = StubScreenRepository();
      final bloc = CollaborationsBloc(repository: repository);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CollaborationsScreen(bloc: bloc),
          ),
        ),
      );

      bloc.add(const LoadCollaborationsContentEvent());
      await tester.pumpAndSettle();

      expect(find.byType(CollaborationHeaderSection), findsOneWidget);
      expect(find.byType(PartnershipTracksSection), findsOneWidget);
      expect(find.byType(CollaborationInquiryForm), findsOneWidget);
      expect(find.byType(CollaborationContactCard), findsOneWidget);
      expect(find.byType(CollaborationCampusMapCard), findsOneWidget);
      expect(find.byType(CollaborationGovernanceBanner), findsOneWidget);
    });

    testWidgets('renders error view when content loading throws error',
        (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final repository = StubScreenRepository()..shouldThrow = true;
      final bloc = CollaborationsBloc(repository: repository);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CollaborationsScreen(bloc: bloc),
          ),
        ),
      );

      bloc.add(const LoadCollaborationsContentEvent());
      await tester.pumpAndSettle();

      expect(find.byType(AppErrorStateView), findsOneWidget);
      expect(find.textContaining('Failed to load collaborations content'),
          findsOneWidget);
    });
  });
}
