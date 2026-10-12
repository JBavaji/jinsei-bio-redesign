import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Serverpod Endpoint for Science Screen content & 10-step R&D stepper pipeline
class ScienceEndpoint extends Endpoint {
  /// Fetches complete Science Content payload with header metrics, 10 pipeline steps, and clinical QA.
  Future<ScienceContent> getScienceContent(Session session) async {
    try {
      var metrics = await ScienceHeaderMetric.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      var steps = await ScienceStep.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );

      if (metrics.isEmpty) {
        metrics = await _seedHeaderMetrics(session);
      }
      if (steps.isEmpty) {
        steps = await _seedScienceSteps(session);
      }

      return ScienceContent(
        headerMetrics: metrics,
        pipelineSteps: steps,
        clinicalQa: _defaultClinicalQa,
      );
    } catch (_) {
      return ScienceContent(
        headerMetrics: _defaultHeaderMetrics,
        pipelineSteps: _defaultScienceSteps,
        clinicalQa: _defaultClinicalQa,
      );
    }
  }

  /// Fetches only the 10-step R&D pipeline stepper items.
  Future<List<ScienceStep>> getScienceSteps(Session session) async {
    try {
      var steps = await ScienceStep.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      if (steps.isEmpty) {
        steps = await _seedScienceSteps(session);
      }
      return steps;
    } catch (_) {
      return _defaultScienceSteps;
    }
  }

  /// Fetches the science header metrics (milestones, coverage, patents).
  Future<List<ScienceHeaderMetric>> getHeaderMetrics(Session session) async {
    try {
      var metrics = await ScienceHeaderMetric.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      if (metrics.isEmpty) {
        metrics = await _seedHeaderMetrics(session);
      }
      return metrics;
    } catch (_) {
      return _defaultHeaderMetrics;
    }
  }

  /// Fetches the clinical QA standards.
  Future<ClinicalQualityAssurance> getClinicalQa(Session session) async {
    return _defaultClinicalQa;
  }

  // --- Admin Panel CRUD Operations ---

  Future<ScienceStep> createScienceStep(
      Session session, ScienceStep step) async {
    return await ScienceStep.db.insertRow(session, step);
  }

  Future<ScienceStep> updateScienceStep(
      Session session, ScienceStep step) async {
    return await ScienceStep.db.updateRow(session, step);
  }

  Future<void> deleteScienceStep(Session session, int id) async {
    await ScienceStep.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }

  Future<ScienceHeaderMetric> createHeaderMetric(
      Session session, ScienceHeaderMetric metric) async {
    return await ScienceHeaderMetric.db.insertRow(session, metric);
  }

  Future<ScienceHeaderMetric> updateHeaderMetric(
      Session session, ScienceHeaderMetric metric) async {
    return await ScienceHeaderMetric.db.updateRow(session, metric);
  }

  Future<void> deleteHeaderMetric(Session session, int id) async {
    await ScienceHeaderMetric.db
        .deleteWhere(session, where: (t) => t.id.equals(id));
  }

  // --- Database Seeders ---

  Future<List<ScienceHeaderMetric>> _seedHeaderMetrics(Session session) async {
    final items = <ScienceHeaderMetric>[];
    for (final m in _defaultHeaderMetrics) {
      final inserted = await ScienceHeaderMetric.db.insertRow(session, m);
      items.add(inserted);
    }
    return items;
  }

  Future<List<ScienceStep>> _seedScienceSteps(Session session) async {
    final items = <ScienceStep>[];
    for (final s in _defaultScienceSteps) {
      final inserted = await ScienceStep.db.insertRow(session, s);
      items.add(inserted);
    }
    return items;
  }

  // --- Default Content Fallbacks ---

  static final List<ScienceHeaderMetric> _defaultHeaderMetrics = [
    ScienceHeaderMetric(
      iconKey: 'science_rounded',
      value: '10',
      label: 'Pipeline Milestones',
      accentColorHex: '#7BD4E2',
      displayOrder: 1,
    ),
    ScienceHeaderMetric(
      iconKey: 'biotech_rounded',
      value: '100%',
      label: 'Sequence Coverage',
      accentColorHex: '#66DD8B',
      displayOrder: 2,
    ),
    ScienceHeaderMetric(
      iconKey: 'verified_rounded',
      value: '3',
      label: 'Global Patents Filed',
      accentColorHex: '#7BD4E2',
      displayOrder: 3,
    ),
  ];

  static const String cdnBaseUrl =
      'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science';

  static final ClinicalQualityAssurance _defaultClinicalQa =
      ClinicalQualityAssurance(
    title: 'Clinical Validation & Standards',
    description:
        'Full genome sequencing, in vitro & in vivo toxicological screening, and stability verification under ISO/GMP standards.',
    badgeText: 'ISO 22000 & GMP Certified',
    complianceStandard: 'DCGI & US-FDA Compliance Alignment',
  );

  static final List<ScienceStep> _defaultScienceSteps = [
    ScienceStep(
      stepNumber: 1,
      title: 'Target Consumer Product Identification',
      subtitle: 'Metagenomic Biomarker Mapping',
      description:
          'We begin by working with you to clearly define the target consumer product and its intended benefit. This provides immediate application to a market.',
      category: 'discovery',
      iconKey: 'search_rounded',
      metricValue: '99.4%',
      metricLabel: 'Target Precision',
      imageUrl: '$cdnBaseUrl/step_01.webp',
      displayOrder: 1,
    ),
    ScienceStep(
      stepNumber: 2,
      title: 'Application-Specific Strain Identification & Characterization',
      subtitle: 'Anaerobic Cultivation Protocol',
      description:
          'We partner with you to identify, screen and characterize indigenous strains, isolating their functional traits to your specific product requirements.',
      category: 'discovery',
      iconKey: 'biotech_rounded',
      metricValue: '500+',
      metricLabel: 'Strains Isolated',
      imageUrl: '$cdnBaseUrl/step_02.webp',
      displayOrder: 2,
    ),
    ScienceStep(
      stepNumber: 3,
      title: 'Upstream & Downstream Optimization',
      subtitle: 'Bioinformatics & Fermentation',
      description:
          'We optimize microbial fermentation conditions to ensure high biomass density and scalable yield while establishing post-fermentation stability.',
      category: 'analytics',
      iconKey: 'analytics_rounded',
      metricValue: '100%',
      metricLabel: 'Sequence Coverage',
      imageUrl: '$cdnBaseUrl/step_03.webp',
      displayOrder: 3,
    ),
    ScienceStep(
      stepNumber: 4,
      title: 'Pro-Plant Scale Strain Development',
      subtitle: 'In-Vitro Synergistic Modeling',
      description:
          'Our R&D team moves to a pro-plant scale strain development phase including robust strain optimization, scale-up feasibility and product performance testing.',
      category: 'formulation',
      iconKey: 'hub_rounded',
      metricValue: '10M+',
      metricLabel: 'Pairs Evaluated',
      imageUrl: '$cdnBaseUrl/step_04.webp',
      displayOrder: 4,
    ),
    ScienceStep(
      stepNumber: 5,
      title: 'Formulation & Formats',
      subtitle: 'Fermentation Optimization',
      description:
          'We optimize post-processing of candidate ingredients for full compatibility with specific matrix and packaging formats, maintaining a scale-viable workflow.',
      category: 'formulation',
      iconKey: 'precision_manufacturing_rounded',
      metricValue: '10^11',
      metricLabel: 'CFU/g Yield',
      imageUrl: '$cdnBaseUrl/step_05.webp',
      displayOrder: 5,
    ),
    ScienceStep(
      stepNumber: 6,
      title: 'Product-Specific Bioactivity Systemization',
      subtitle: 'In-Vivo Toxicity Studies',
      description:
          'We validate bioactivities and bioactivity data in rigorous clinical frameworks, generating rich numerical evidence to support specific claims.',
      category: 'clinical',
      iconKey: 'security_rounded',
      metricValue: '0',
      metricLabel: 'Adverse Events',
      imageUrl: '$cdnBaseUrl/step_06.webp',
      displayOrder: 6,
    ),
    ScienceStep(
      stepNumber: 7,
      title: 'Scaling for Commercialization',
      subtitle: 'Randomized Double-Blind Studies',
      description:
          'We seamlessly transfer the manufacturing process from pilot to commercial scale, guaranteeing consistent quality and performance for large-volume production.',
      category: 'clinical',
      iconKey: 'verified_rounded',
      metricValue: '88%',
      metricLabel: 'Efficacy Rate',
      imageUrl: '$cdnBaseUrl/step_07.webp',
      displayOrder: 7,
    ),
    ScienceStep(
      stepNumber: 8,
      title: 'Shelf Life Stability & Field Trials',
      subtitle: 'FDA & DCGI Compliance',
      description:
          'Our Formulations are engineered for robust shelf life with proven viability retention, supported by stability testing and real-world field trials.',
      category: 'clinical',
      iconKey: 'assignment_rounded',
      metricValue: '3',
      metricLabel: 'Patents Filed',
      imageUrl: '$cdnBaseUrl/step_08.webp',
      displayOrder: 8,
    ),
    ScienceStep(
      stepNumber: 9,
      title: 'Regulatory Compliance',
      subtitle: 'cGMP Freeze-Drying Facility',
      description:
          'We help navigate complex regulatory standards, ensuring compliance against international accreditation and validation of the final product.',
      category: 'commercial',
      iconKey: 'factory_rounded',
      metricValue: '24 Mo.',
      metricLabel: 'Shelf Stability',
      imageUrl: '$cdnBaseUrl/step_09.webp',
      displayOrder: 9,
    ),
    ScienceStep(
      stepNumber: 10,
      title: 'Continuous Improvement of Strains & Process',
      subtitle: 'B2B & B2C Distribution',
      description:
          'Through data-driven R&D iterations, we refine strains, formulations, and scale-up processes for continuous enhancement of product efficiency.',
      category: 'commercial',
      iconKey: 'local_shipping_rounded',
      metricValue: '4',
      metricLabel: 'Vertical Markets',
      imageUrl: '$cdnBaseUrl/step_10.webp',
      displayOrder: 10,
    ),
  ];
}
