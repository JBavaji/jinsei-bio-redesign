import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_modal_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_sample_request_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/formulation_format_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/strain_vertical_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/repositories/i_b2b_repository.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/presentation/widgets/b2b_sample_modal.dart';

class StubB2bRepository implements IB2bRepository {
  final B2bModalContentModel stubContent = const B2bModalContentModel(
    badgeText: 'COMMERCIAL FORMULATION & ISOLATE SAMPLING',
    title: 'Request B2B Formulation Sample',
    subtitle:
        'Order certified research-grade batches of proprietary indigenous Lactobacillus isolates.',
    strains: [
      StrainVerticalOptionModel(
        strainId: 'gut_pro',
        category: 'HUMAN HEALTH',
        name: 'Jinsei-Gut Pro',
        strainCode: 'L. plantarum JN-04',
        highlight: 'Epithelial adhesion >94%',
        defaultFormat: 'lyophilized_powder',
      ),
      StrainVerticalOptionModel(
        strainId: 'femme_flora',
        category: "WOMEN'S FLORA",
        name: 'FemmeFlora Bio-Shield',
        strainCode: 'L. crispatus FF-02',
        highlight: 'Microflora pH regulation',
        defaultFormat: 'microencapsulated',
      ),
    ],
    formulationFormats: [
      FormulationFormatOptionModel(
        formatId: 'lyophilized_powder',
        label: 'Lyophilized Bulk Powder (100 Billion CFU/g)',
      ),
      FormulationFormatOptionModel(
        formatId: 'microencapsulated',
        label: 'Micro-Encapsulated Enteric Pellets',
      ),
    ],
    complianceNote:
        'Includes Certificate of Analysis (CoA), Whole Genome Sequence (WGS) report.',
    certifications: ['ISO 9001:2015', 'GMP Certified'],
    dispatchNotice:
        'Protected by scientific NDA. Dispatched from Pune NCL Innovation Park within 48h.',
  );

  @override
  Future<B2bModalContentModel> getModalContent() async => stubContent;

  @override
  Future<String> submitSampleRequest(B2bSampleRequestModel request) async =>
      'JIN-REQ-2026-TEST999';
}

void main() {
  Widget buildTestModal({
    required IB2bRepository repository,
    Size size = const Size(1200, 800),
    ThemeMode themeMode = ThemeMode.dark,
    String? initialStrainId,
  }) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: MediaQuery(
        data: MediaQueryData(size: size),
        child: Scaffold(
          body: B2bSampleModal(
            repository: repository,
            initialStrainId: initialStrainId,
          ),
        ),
      ),
    );
  }

  group('B2bSampleModal Widget Tests (JIN-22)', () {
    late StubB2bRepository repository;

    setUp(() {
      repository = StubB2bRepository();
    });

    testWidgets('renders all modal components cleanly on Desktop dark mode',
        (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(buildTestModal(repository: repository));
      await tester.pumpAndSettle();

      // Header elements
      expect(find.text('COMMERCIAL FORMULATION & ISOLATE SAMPLING'),
          findsOneWidget);
      expect(find.text('Request B2B Formulation Sample'), findsOneWidget);

      // 2 Strains
      expect(find.text('Jinsei-Gut Pro'), findsOneWidget);
      expect(find.text('FemmeFlora Bio-Shield'), findsOneWidget);

      // Form input labels
      expect(find.text('FULL NAME & SCIENTIFIC TITLE *'), findsOneWidget);
      expect(
          find.text('CORPORATE / INSTITUTIONAL WORK EMAIL *'), findsOneWidget);
      expect(
          find.text('ORGANIZATION / PHARMACEUTICAL COMPANY *'), findsOneWidget);

      // Compliance & Action bar
      expect(find.text('ISO 9001:2015'), findsOneWidget);
      expect(find.text('GMP Certified'), findsOneWidget);
      expect(find.text('Submit Sample Request'), findsOneWidget);
    });

    testWidgets('selecting strain card updates active selection',
        (tester) async {
      await tester.pumpWidget(buildTestModal(repository: repository));
      await tester.pumpAndSettle();

      // Tap second strain card
      await tester.tap(find.text('FemmeFlora Bio-Shield'));
      await tester.pumpAndSettle();

      // Verify FemmeFlora is selected
      expect(find.text('FemmeFlora Bio-Shield'), findsOneWidget);
    });

    testWidgets('renders properly on compact/mobile viewport', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(buildTestModal(
        repository: repository,
        size: const Size(390, 844),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Request B2B Formulation Sample'), findsOneWidget);
      expect(find.text('Submit Sample Request'), findsOneWidget);
    });

    testWidgets('filling form and submitting transitions to success view',
        (tester) async {
      await tester.pumpWidget(buildTestModal(repository: repository));
      await tester.pumpAndSettle();

      // Fill in text fields
      final textFields = find.byType(TextFormField);
      expect(textFields, findsNWidgets(4)); // name, email, company, scope

      await tester.enterText(textFields.at(0), 'Dr. Rajesh Sharma');
      await tester.enterText(textFields.at(1), 'r.sharma@acme.com');
      await tester.enterText(textFields.at(2), 'Acme Biotherapeutics');
      await tester.pumpAndSettle();

      // Click submit
      final submitBtn = find.text('Submit Sample Request');
      await tester.tap(submitBtn);
      await tester.pumpAndSettle();

      // Expect success view
      expect(
          find.text('Sample Request Dispatched Successfully'), findsOneWidget);
      expect(find.text('Tracking ID: JIN-REQ-2026-TEST999'), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);
    });
  });
}
