import 'package:flutter/material.dart';

class PillarItemModel {
  final IconData icon;
  final String title;
  final String description;

  const PillarItemModel({
    required this.icon,
    required this.title,
    required this.description,
  });

  static const List<PillarItemModel> defaultPillars = [
    PillarItemModel(
      icon: Icons.public_rounded,
      title: 'Indigenous Focus',
      description:
          'Sourcing and preserving native microbiomes adapted to specific regional ecosystems.',
    ),
    PillarItemModel(
      icon: Icons.dataset_rounded,
      title: 'Data-Centred',
      description:
          'Advanced bioinformatics pipeline for high-resolution strain characterization and predictive modeling.',
    ),
    PillarItemModel(
      icon: Icons.biotech_rounded,
      title: 'Evidence-Based',
      description:
          'Rigorous double-blind clinical and laboratory validation for every developed bioactive compound.',
    ),
    PillarItemModel(
      icon: Icons.health_and_safety_rounded,
      title: 'Gut Health Emphasis',
      description:
          'Targeting the microbiome-gut-brain axis for holistic systemic wellness and metabolic regulation.',
    ),
    PillarItemModel(
      icon: Icons.layers_rounded,
      title: 'Scalable Platform',
      description:
          'Modular solid-state & liquid fermentation processes designed for rapid industrial-scale manufacturing.',
    ),
    PillarItemModel(
      icon: Icons.diversity_3_rounded,
      title: 'Community Integration',
      description:
          'Partnering with local agricultural & forest populations for ethical, benefit-sharing bio-prospecting.',
    ),
    PillarItemModel(
      icon: Icons.tune_rounded,
      title: 'Customized Solutions',
      description:
          'Tailored consortia formulation engineered for specific food science and therapeutic partner requirements.',
    ),
    PillarItemModel(
      icon: Icons.eco_rounded,
      title: 'Ecologically Informed',
      description:
          'Ensuring all bio-interventions preserve microbiome equilibrium and natural environmental biodiversity.',
    ),
  ];
}
