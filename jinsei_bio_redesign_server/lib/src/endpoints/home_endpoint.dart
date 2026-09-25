import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Serverpod Endpoint for Home Screen content & data pipeline
class HomeEndpoint extends Endpoint {
  Future<HomeContent> getHomeContent(Session session) async {
    return HomeContent(
      pillars: [
        PillarItem(
          iconKey: 'public_rounded',
          title: 'Indigenous Focus',
          description:
              'Sourcing and preserving native microbiomes adapted to specific regional ecosystems.',
        ),
        PillarItem(
          iconKey: 'dataset_rounded',
          title: 'Data-Centred',
          description:
              'Advanced bioinformatics pipeline for high-resolution strain characterization and predictive modeling.',
        ),
        PillarItem(
          iconKey: 'biotech_rounded',
          title: 'Evidence-Based',
          description:
              'Rigorous double-blind clinical and laboratory validation for every developed bioactive compound.',
        ),
        PillarItem(
          iconKey: 'health_and_safety_rounded',
          title: 'Gut Health Emphasis',
          description:
              'Targeting the microbiome-gut-brain axis for holistic systemic wellness and metabolic regulation.',
        ),
        PillarItem(
          iconKey: 'layers_rounded',
          title: 'Scalable Platform',
          description:
              'Modular solid-state & liquid fermentation processes designed for rapid industrial-scale manufacturing.',
        ),
        PillarItem(
          iconKey: 'diversity_3_rounded',
          title: 'Community Integration',
          description:
              'Partnering with local agricultural & forest populations for ethical, benefit-sharing bio-prospecting.',
        ),
        PillarItem(
          iconKey: 'tune_rounded',
          title: 'Customized Solutions',
          description:
              'Tailored consortia formulation engineered for specific food science and therapeutic partner requirements.',
        ),
        PillarItem(
          iconKey: 'eco_rounded',
          title: 'Ecologically Informed',
          description:
              'Ensuring all bio-interventions preserve microbiome equilibrium and natural environmental biodiversity.',
        ),
      ],
      executiveStats: [
        ExecutiveStat(
          iconKey: 'military_tech_rounded',
          title: '3+ Global Patents Filed',
          subtitle: 'International IP Protection',
        ),
        ExecutiveStat(
          iconKey: 'account_tree_rounded',
          title: '10-Step Proprietary Platform',
          subtitle: 'End-to-end Strain Isolation',
        ),
        ExecutiveStat(
          iconKey: 'school_rounded',
          title: '8+ PhD Academic Advisors',
          subtitle: 'UC Irvine, Cambridge, Cornell',
        ),
      ],
      productVerticals: [
        ProductVertical(
          title: 'Jinsei-Gut Pro',
          strainId: 'Strain ID: L. rhamnosus JN-01',
          description:
              'Advanced digestive support matrix utilizing native flora extraction and gastro-resistant spore technology.',
        ),
        ProductVertical(
          title: 'FemmeFlora Bio-Shield',
          strainId: 'Strain ID: L. crispatus JN-02',
          description:
              'Targeted microbiome balancing for specialized female wellness, vaginal tract stability, and immune homeostasis.',
        ),
        ProductVertical(
          title: 'MetaboliMet Probiotic',
          strainId: 'Strain ID: L. plantarum JN-04',
          description:
              'Metabolic optimization complex developed from isolated indigenous cultures targeting lipid signaling pathways.',
        ),
      ],
    );
  }
}
