import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Serverpod Endpoint for Home Screen content & PostgreSQL database pipeline
class HomeEndpoint extends Endpoint {
  Future<HomeContent> getHomeContent(Session session) async {
    try {
      var pillars = await PillarItem.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      var stats = await ExecutiveStat.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );
      var verticals = await ProductVertical.db.find(
        session,
        orderBy: (t) => t.displayOrder,
      );

      if (pillars.isEmpty) {
        pillars = await _seedPillars(session);
      }
      if (stats.isEmpty) {
        stats = await _seedExecutiveStats(session);
      }
      if (verticals.isEmpty) {
        verticals = await _seedProductVerticals(session);
      }

      return HomeContent(
        pillars: pillars,
        executiveStats: stats,
        productVerticals: verticals,
      );
    } catch (_) {
      return HomeContent(
        pillars: _defaultPillars,
        executiveStats: _defaultExecutiveStats,
        productVerticals: _defaultProductVerticals,
      );
    }
  }

  // --- Admin Panel CRUD Operations ---

  Future<PillarItem> createPillar(Session session, PillarItem item) async {
    return await PillarItem.db.insertRow(session, item);
  }

  Future<PillarItem> updatePillar(Session session, PillarItem item) async {
    return await PillarItem.db.updateRow(session, item);
  }

  Future<void> deletePillar(Session session, int id) async {
    await PillarItem.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }

  Future<ExecutiveStat> createExecutiveStat(
      Session session, ExecutiveStat stat) async {
    return await ExecutiveStat.db.insertRow(session, stat);
  }

  Future<ExecutiveStat> updateExecutiveStat(
      Session session, ExecutiveStat stat) async {
    return await ExecutiveStat.db.updateRow(session, stat);
  }

  Future<void> deleteExecutiveStat(Session session, int id) async {
    await ExecutiveStat.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }

  Future<ProductVertical> createProductVertical(
      Session session, ProductVertical vertical) async {
    return await ProductVertical.db.insertRow(session, vertical);
  }

  Future<ProductVertical> updateProductVertical(
      Session session, ProductVertical vertical) async {
    return await ProductVertical.db.updateRow(session, vertical);
  }

  Future<void> deleteProductVertical(Session session, int id) async {
    await ProductVertical.db
        .deleteWhere(session, where: (t) => t.id.equals(id));
  }

  // --- Database Seeders ---

  Future<List<PillarItem>> _seedPillars(Session session) async {
    final items = <PillarItem>[];
    for (final p in _defaultPillars) {
      final inserted = await PillarItem.db.insertRow(session, p);
      items.add(inserted);
    }
    return items;
  }

  Future<List<ExecutiveStat>> _seedExecutiveStats(Session session) async {
    final items = <ExecutiveStat>[];
    for (final s in _defaultExecutiveStats) {
      final inserted = await ExecutiveStat.db.insertRow(session, s);
      items.add(inserted);
    }
    return items;
  }

  Future<List<ProductVertical>> _seedProductVerticals(Session session) async {
    final items = <ProductVertical>[];
    for (final v in _defaultProductVerticals) {
      final inserted = await ProductVertical.db.insertRow(session, v);
      items.add(inserted);
    }
    return items;
  }

  static final List<PillarItem> _defaultPillars = [
    PillarItem(
      iconKey: 'public_rounded',
      title: 'Indigenous Focus',
      description:
          'Sourcing and preserving native microbiomes adapted to specific regional ecosystems.',
      displayOrder: 1,
    ),
    PillarItem(
      iconKey: 'dataset_rounded',
      title: 'Data-Centred',
      description:
          'Advanced bioinformatics pipeline for high-resolution strain characterization and predictive modeling.',
      displayOrder: 2,
    ),
    PillarItem(
      iconKey: 'biotech_rounded',
      title: 'Evidence-Based',
      description:
          'Rigorous double-blind clinical and laboratory validation for every developed bioactive compound.',
      displayOrder: 3,
    ),
    PillarItem(
      iconKey: 'health_and_safety_rounded',
      title: 'Gut Health Emphasis',
      description:
          'Targeting the microbiome-gut-brain axis for holistic systemic wellness and metabolic regulation.',
      displayOrder: 4,
    ),
    PillarItem(
      iconKey: 'layers_rounded',
      title: 'Scalable Platform',
      description:
          'Modular solid-state & liquid fermentation processes designed for rapid industrial-scale manufacturing.',
      displayOrder: 5,
    ),
    PillarItem(
      iconKey: 'diversity_3_rounded',
      title: 'Community Integration',
      description:
          'Partnering with local agricultural & forest populations for ethical, benefit-sharing bio-prospecting.',
      displayOrder: 6,
    ),
    PillarItem(
      iconKey: 'tune_rounded',
      title: 'Customized Solutions',
      description:
          'Tailored consortia formulation engineered for specific food science and therapeutic partner requirements.',
      displayOrder: 7,
    ),
    PillarItem(
      iconKey: 'eco_rounded',
      title: 'Ecologically Informed',
      description:
          'Ensuring all bio-interventions preserve microbiome equilibrium and natural environmental biodiversity.',
      displayOrder: 8,
    ),
  ];

  static final List<ExecutiveStat> _defaultExecutiveStats = [
    ExecutiveStat(
      iconKey: 'military_tech_rounded',
      title: '3+ Global Patents Filed',
      subtitle: 'International IP Protection',
      displayOrder: 1,
    ),
    ExecutiveStat(
      iconKey: 'account_tree_rounded',
      title: '10-Step Proprietary Platform',
      subtitle: 'End-to-end Strain Isolation',
      displayOrder: 2,
    ),
    ExecutiveStat(
      iconKey: 'school_rounded',
      title: '8+ PhD Academic Advisors',
      subtitle: 'UC Irvine, Cambridge, Cornell',
      displayOrder: 3,
    ),
  ];

  static final List<ProductVertical> _defaultProductVerticals = [
    ProductVertical(
      title: 'Jinsei-Gut Pro',
      strainId: 'Strain ID: L. rhamnosus JN-01',
      description:
          'Advanced digestive support matrix utilizing native flora extraction and gastro-resistant spore technology.',
      displayOrder: 1,
    ),
    ProductVertical(
      title: 'FemmeFlora Bio-Shield',
      strainId: 'Strain ID: L. crispatus JN-02',
      description:
          'Targeted microbiome balancing for specialized female wellness, vaginal tract stability, and immune homeostasis.',
      displayOrder: 2,
    ),
    ProductVertical(
      title: 'MetaboliMet Probiotic',
      strainId: 'Strain ID: L. plantarum JN-04',
      description:
          'Metabolic optimization complex developed from isolated indigenous cultures targeting lipid signaling pathways.',
      displayOrder: 3,
    ),
  ];
}
