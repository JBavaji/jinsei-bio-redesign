import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_modal_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/b2b_sample_request_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/formulation_format_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/models/strain_vertical_option_model.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/domain/repositories/i_b2b_repository.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/presentation/widgets/b2b_sample_modal.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/widgets/sample_button.dart';

class StubB2bIntegrationRepo implements IB2bRepository {
  B2bSampleRequestModel? lastSubmittedRequest;

  final stubContent = const B2bModalContentModel(
    badgeText: 'COMMERCIAL FORMULATION',
    title: 'Request B2B Formulation Sample',
    subtitle: 'Order certified research-grade batches of proprietary isolates.',
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
        strainId: 'aqua_pure',
        category: 'AQUACULTURE',
        name: 'AquaShield Microbial',
        strainCode: 'B. subtilis AQ-09',
        highlight: 'Ammonia reduction',
        defaultFormat: 'aqueous_concentrate',
      ),
    ],
    formulationFormats: [
      FormulationFormatOptionModel(
        formatId: 'lyophilized_powder',
        label: 'Lyophilized Bulk Powder',
      ),
      FormulationFormatOptionModel(
        formatId: 'aqueous_concentrate',
        label: 'Aqueous Liquid Concentrate',
      ),
    ],
    complianceNote: 'Includes Certificate of Analysis (CoA).',
    certifications: ['GMP Certified'],
    dispatchNotice: 'Protected by scientific NDA.',
  );

  @override
  Future<B2bModalContentModel> getModalContent() async => stubContent;

  @override
  Future<String> submitSampleRequest(B2bSampleRequestModel request) async {
    lastSubmittedRequest = request;
    return 'JIN-REQ-2026-INTG888';
  }
}

void main() {
  testWidgets('Full End-to-End B2B modal integration test (JIN-22)',
      (tester) async {
    tester.view.physicalSize = const Size(1280, 960);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final repo = StubB2bIntegrationRepo();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: SampleButton(
                  onPressed: () {
                    B2bSampleModal.show(
                      context,
                      initialStrainId: 'aqua_pure',
                      repository: repo,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );

    // Initial state: SampleButton visible
    expect(find.byType(SampleButton), findsOneWidget);

    // Click sample button to launch modal
    await tester.tap(find.byType(SampleButton));
    await tester.pumpAndSettle();

    // Verify modal is open with content
    expect(find.text('Request B2B Formulation Sample'), findsOneWidget);
    expect(find.text('AquaShield Microbial'), findsOneWidget);

    // Enter full name, email, company, and clinical scope
    final textFields = find.byType(TextFormField);
    expect(textFields, findsNWidgets(4));

    await tester.enterText(textFields.at(0), 'Dr. Homi Bhabha');
    await tester.enterText(textFields.at(1), 'homi.bhabha@tifr.res.in');
    await tester.enterText(textFields.at(2), 'Tata Institute Research');
    await tester.enterText(textFields.at(3), 'Phase II Commercial Trials');
    await tester.pumpAndSettle();

    // Verify submit button is enabled
    final submitButtonFinder =
        find.widgetWithText(ElevatedButton, 'Submit Sample Request');
    expect(submitButtonFinder, findsOneWidget);
    await tester.ensureVisible(submitButtonFinder);
    await tester.pumpAndSettle();

    // Tap submit button
    await tester.tap(submitButtonFinder);
    await tester.pumpAndSettle();

    // Verify transition to success view
    expect(find.text('Sample Request Dispatched Successfully'), findsOneWidget);
    expect(find.text('Tracking ID: JIN-REQ-2026-INTG888'), findsOneWidget);

    // Verify submitted request payload matches user inputs
    expect(repo.lastSubmittedRequest, isNotNull);
    expect(repo.lastSubmittedRequest!.strainId, 'aqua_pure');
    expect(repo.lastSubmittedRequest!.fullName, 'Dr. Homi Bhabha');
    expect(repo.lastSubmittedRequest!.email, 'homi.bhabha@tifr.res.in');
    expect(repo.lastSubmittedRequest!.company, 'Tata Institute Research');
    expect(
        repo.lastSubmittedRequest!.clinicalScope, 'Phase II Commercial Trials');
  });
}
