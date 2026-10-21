import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Serverpod Endpoint for B2B Sample Request Flow (JIN-22)
class B2bEndpoint extends Endpoint {
  /// Fetches complete dynamic modal content, commercial strains, formulation formats, and compliance metadata.
  Future<B2bModalContent> getModalContent(Session session) async {
    return _defaultModalContent;
  }

  static final B2bModalContent _defaultModalContent = B2bModalContent(
    badgeText: 'COMMERCIAL FORMULATION & ISOLATE SAMPLING',
    title: 'Request B2B Formulation Sample',
    subtitle:
        'Order certified research-grade batches of proprietary indigenous Lactobacillus isolates. Formulated for pharmaceutical trial pipelines and FMCG product developers.',
    strains: [
      StrainVerticalOption(
        strainId: 'gut_pro',
        category: 'HUMAN HEALTH',
        name: 'Jinsei-Gut Pro',
        strainCode: 'L. plantarum JN-04',
        highlight: 'Epithelial adhesion >94%',
        defaultFormat: 'lyophilized_powder',
        displayOrder: 1,
      ),
      StrainVerticalOption(
        strainId: 'femme_flora',
        category: "WOMEN'S FLORA",
        name: 'FemmeFlora Bio-Shield',
        strainCode: 'L. crispatus FF-02',
        highlight: 'Microflora pH regulation',
        defaultFormat: 'lyophilized_powder',
        displayOrder: 2,
      ),
      StrainVerticalOption(
        strainId: 'metabolimet',
        category: 'METABOLIC AXIS',
        name: 'MetaboliMet Probiotic',
        strainCode: 'L. gasseri JN-08',
        highlight: 'SCFA signalling pathways',
        defaultFormat: 'lyophilized_powder',
        displayOrder: 3,
      ),
      StrainVerticalOption(
        strainId: 'custom_cro',
        category: 'CUSTOM ISOLATE',
        name: 'Custom LAB Isolate',
        strainCode: 'CRO Co-Development',
        highlight: 'Screened native library',
        defaultFormat: 'slurry_concentrate',
        displayOrder: 4,
      ),
    ],
    formulationFormats: [
      FormulationFormatOption(
        formatId: 'lyophilized_powder',
        label: 'Lyophilized Bulk Powder (100 Billion CFU/g)',
        displayOrder: 1,
      ),
      FormulationFormatOption(
        formatId: 'microencapsulated',
        label: 'Micro-Encapsulated Enteric Pellets',
        displayOrder: 2,
      ),
      FormulationFormatOption(
        formatId: 'slurry_concentrate',
        label: 'Active Ferment Slurry (Cold-Chain)',
        displayOrder: 3,
      ),
      FormulationFormatOption(
        formatId: 'oral_sachet',
        label: 'Pre-formulated Sachet Prototypes (2g)',
        displayOrder: 4,
      ),
    ],
    complianceNote:
        'Includes Certificate of Analysis (CoA), Whole Genome Sequence (WGS) report & Material Safety Data Sheet.',
    certifications: [
      'ISO 9001:2015',
      'GMP Certified',
    ],
    dispatchNotice:
        'Protected by scientific NDA. Dispatched from Pune NCL Innovation Park within 48h.',
  );
}
