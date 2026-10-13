import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Serverpod Endpoint for Commercial Solutions & Formulation Matrix
class SolutionsEndpoint extends Endpoint {
  /// Fetches the complete Solutions Matrix content payload including metrics, cards, and QA standards.
  Future<SolutionsContent> getSolutionsContent(Session session) async {
    try {
      var metrics = await SolutionMetric.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      var solutions = await SolutionCard.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );

      if (metrics.isEmpty) {
        metrics = await _seedMetrics(session);
      }
      if (solutions.isEmpty) {
        solutions = await _seedSolutions(session);
      }

      return SolutionsContent(
        metrics: metrics,
        solutions: solutions,
        qualityAssurance: _defaultClinicalQa,
      );
    } catch (_) {
      return SolutionsContent(
        metrics: _defaultMetrics,
        solutions: _defaultSolutions,
        qualityAssurance: _defaultClinicalQa,
      );
    }
  }

  /// Fetches all 4 commercial solution cards.
  Future<List<SolutionCard>> getSolutions(Session session) async {
    try {
      var solutions = await SolutionCard.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      if (solutions.isEmpty) {
        solutions = await _seedSolutions(session);
      }
      return solutions;
    } catch (_) {
      return _defaultSolutions;
    }
  }

  /// Fetches solutions filtered by category (human-health, food-tech, dermo-biotics, agri-tech).
  Future<List<SolutionCard>> getSolutionsByCategory(
    Session session,
    String category,
  ) async {
    try {
      var solutions = await SolutionCard.db.find(
        session,
        where: (t) => t.category.equals(category),
        orderBy: (t) => t.displayOrder,
      );
      if (solutions.isEmpty) {
        return _defaultSolutions.where((s) => s.category == category).toList();
      }
      return solutions;
    } catch (_) {
      return _defaultSolutions.where((s) => s.category == category).toList();
    }
  }

  /// Fetches top summary KPI metrics.
  Future<List<SolutionMetric>> getSolutionMetrics(Session session) async {
    try {
      var metrics = await SolutionMetric.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      if (metrics.isEmpty) {
        metrics = await _seedMetrics(session);
      }
      return metrics;
    } catch (_) {
      return _defaultMetrics;
    }
  }

  // --- Seed Database Helper Methods ---

  static Future<List<SolutionMetric>> _seedMetrics(Session session) async {
    for (var m in _defaultMetrics) {
      await SolutionMetric.db.insertRow(session, m);
    }
    return await SolutionMetric.db.find(
      session,
      orderBy: (t) => t.displayOrder,
    );
  }

  static Future<List<SolutionCard>> _seedSolutions(Session session) async {
    for (var s in _defaultSolutions) {
      await SolutionCard.db.insertRow(session, s);
    }
    return await SolutionCard.db.find(
      session,
      orderBy: (t) => t.displayOrder,
    );
  }

  // --- Static Defaults & Contracts ---

  static final ClinicalQualityAssurance _defaultClinicalQa =
      ClinicalQualityAssurance(
    title: 'Clinical & Commercial Quality Assurance',
    description:
        'ISO 9001:2015 & GMP Certified Production Standards • Custom Strains & Blends',
    badgeText: 'Pune NCL Innovation Park',
    complianceStandard: 'Bio-Prospecting Ethics Compliant',
  );

  static final List<SolutionMetric> _defaultMetrics = [
    SolutionMetric(
      iconKey: 'hub_rounded',
      value: '4',
      label: 'Commercial Verticals',
      accentColorHex: '#7BD4E2',
      displayOrder: 1,
    ),
    SolutionMetric(
      iconKey: 'biotech_rounded',
      value: '54+',
      label: 'Bio-Formulations',
      accentColorHex: '#66DD8B',
      displayOrder: 2,
    ),
    SolutionMetric(
      iconKey: 'verified_rounded',
      value: '100%',
      label: 'Non-GMO Indigenous',
      accentColorHex: '#7BD4E2',
      displayOrder: 3,
    ),
  ];

  static const String cdnBaseUrl =
      'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions';

  static final List<SolutionCard> _defaultSolutions = [
    SolutionCard(
      solutionId: 'human-health',
      categoryTag: 'PRECISION WELLNESS',
      title: 'Human Health: Precision Wellness',
      subtitle: 'Targeted Micro-Flora Therapeutics',
      description:
          'Clinical-grade strain formulations targeting gut, vaginal, and metabolic micro-biomes with high-viability spore technology.',
      iconKey: 'health_and_safety_rounded',
      category: 'human-health',
      formulationCount: '18 Formulations',
      keyBenefit: 'Targeted Micro-Flora',
      efficacyMetric: '88% Clinical Efficacy',
      bulletPoints: [
        'Gastrointestinal Homeostasis: Targeted IBS, IBD, and gut-barrier integrity restore protocols.',
        'Urogenital Health: L. crispatus consortia for protective acidification and pathogen exclusion.',
        'Metabolic Signalling: Precision bile salt hydrolase activity regulating glucose & lipid absorption.',
      ],
      actionCtaText: 'Explore Human Health Range',
      caseStudyUrl:
          'https://jinseibioscience.com/docs/human_health_clinical_trial.pdf',
      imageUrl: '$cdnBaseUrl/solution_01_human_health.webp',
      darkImageUrl: '$cdnBaseUrl/solution_01_human_health_dark.webp',
      lightImageUrl: '$cdnBaseUrl/solution_01_human_health_light.webp',
      displayOrder: 1,
    ),
    SolutionCard(
      solutionId: 'food-tech',
      categoryTag: 'CLEAN LABEL PROTECTION',
      title: 'Food Tech & Clean Label Preservation',
      subtitle: 'Bio-Protective Cultures',
      description:
          'Next-gen microbial bio-protective cultures replacing chemical preservatives naturally.',
      iconKey: 'restaurant_rounded',
      category: 'food-tech',
      formulationCount: '12 Formulations',
      keyBenefit: 'Clean Label Bio-Preservation',
      efficacyMetric: '24 Mo. Shelf Extension',
      bulletPoints: [
        'Shelf-Life Extension: Antimicrobial bacteriocins naturally suppress spoilage organisms.',
        'Clean Label Solutions: Eliminate artificial benzoates, sorbates, and nitrates.',
        'Fermentation Starters: Accelerated acidification with consistent organoleptic quality.',
      ],
      actionCtaText: 'Explore Food Tech Range',
      caseStudyUrl:
          'https://jinseibioscience.com/docs/food_tech_clean_label_dossier.pdf',
      imageUrl: '$cdnBaseUrl/solution_02_food_tech.webp',
      darkImageUrl: '$cdnBaseUrl/solution_02_food_tech_dark.webp',
      lightImageUrl: '$cdnBaseUrl/solution_02_food_tech_light.webp',
      displayOrder: 2,
    ),
    SolutionCard(
      solutionId: 'dermo-biotics',
      categoryTag: 'CUTANEOUS BIOTICS',
      title: 'Dermo-Biotics & Bio-Hygiene',
      subtitle: 'Cutaneous Barrier Biotics',
      description:
          'Live-biome topical ferments and postbiotic solutions for barrier health and antimicrobial shielding.',
      iconKey: 'face_3_rounded',
      category: 'dermo-biotics',
      formulationCount: '9 Formulations',
      keyBenefit: 'Topical Barrier Health',
      efficacyMetric: '+42% Ceramide Synthesis',
      bulletPoints: [
        'Acne Pathogen Mitigation: Selective inhibition of C. acnes phylotypes without skin irritation.',
        'Barrier Lipid Synthesis: Upregulation of natural ceramide production by 42%.',
        'Probiotic Cleaning: Self-replenishing surface defenses for clinical bio-hygiene.',
      ],
      actionCtaText: 'Explore Dermo-Biotics Range',
      caseStudyUrl:
          'https://jinseibioscience.com/docs/dermo_biotics_safety_study.pdf',
      imageUrl: '$cdnBaseUrl/solution_03_dermo_biotics.webp',
      darkImageUrl: '$cdnBaseUrl/solution_03_dermo_biotics_dark.webp',
      lightImageUrl: '$cdnBaseUrl/solution_03_dermo_biotics_light.webp',
      displayOrder: 3,
    ),
    SolutionCard(
      solutionId: 'agri-tech',
      categoryTag: 'REGENERATIVE AGRI',
      title: 'Agri-Tech & Environmental Security',
      subtitle: 'Bio-Inoculants & Remediation',
      description:
          'Specialized microbial consortia engineered to rejuvenate exhausted soil and accelerate remediation.',
      iconKey: 'eco_rounded',
      category: 'agri-tech',
      formulationCount: '15 Formulations',
      keyBenefit: 'Regenerative Soil Consortia',
      efficacyMetric: '+35% Root Bio-Mass',
      bulletPoints: [
        'Nitrogen Fixing & P-Solubilizing: Strains that unlock bound soil minerals for root uptake.',
        'Crop Immunity Priming: Triggering systemic acquired resistance (SAR) against blight.',
        'Effluent Bioremediation: High-efficiency degradation of industrial hydrocarbons.',
      ],
      actionCtaText: 'Explore Agri-Tech Solutions',
      caseStudyUrl:
          'https://jinseibioscience.com/docs/agri_tech_field_trial.pdf',
      imageUrl: '$cdnBaseUrl/solution_04_agri_tech.webp',
      darkImageUrl: '$cdnBaseUrl/solution_04_agri_tech_dark.webp',
      lightImageUrl: '$cdnBaseUrl/solution_04_agri_tech_light.webp',
      displayOrder: 4,
    ),
  ];
}
