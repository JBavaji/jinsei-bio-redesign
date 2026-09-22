import 'package:flutter/material.dart';

class PillarItemModel {
  final IconData icon;
  final String iconKey;
  final String title;
  final String description;

  const PillarItemModel({
    required this.icon,
    required this.iconKey,
    required this.title,
    required this.description,
  });

  static const Map<String, IconData> _iconMap = {
    'public_rounded': Icons.public_rounded,
    'dataset_rounded': Icons.dataset_rounded,
    'biotech_rounded': Icons.biotech_rounded,
    'health_and_safety_rounded': Icons.health_and_safety_rounded,
    'layers_rounded': Icons.layers_rounded,
    'diversity_3_rounded': Icons.diversity_3_rounded,
    'tune_rounded': Icons.tune_rounded,
    'eco_rounded': Icons.eco_rounded,
  };

  factory PillarItemModel.fromJson(Map<String, dynamic> json) {
    final key = json['iconKey'] as String? ?? 'public_rounded';
    final iconData = _iconMap[key] ?? Icons.public_rounded;

    return PillarItemModel(
      icon: iconData,
      iconKey: key,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iconKey': iconKey,
      'title': title,
      'description': description,
    };
  }

  static const List<PillarItemModel> defaultPillars = [
    PillarItemModel(
      icon: Icons.public_rounded,
      iconKey: 'public_rounded',
      title: 'Indigenous Focus',
      description:
          'Sourcing and preserving native microbiomes adapted to specific regional ecosystems.',
    ),
    PillarItemModel(
      icon: Icons.dataset_rounded,
      iconKey: 'dataset_rounded',
      title: 'Data-Centred',
      description:
          'Advanced bioinformatics pipeline for high-resolution strain characterization and predictive modeling.',
    ),
    PillarItemModel(
      icon: Icons.biotech_rounded,
      iconKey: 'biotech_rounded',
      title: 'Evidence-Based',
      description:
          'Rigorous double-blind clinical and laboratory validation for every developed bioactive compound.',
    ),
    PillarItemModel(
      icon: Icons.health_and_safety_rounded,
      iconKey: 'health_and_safety_rounded',
      title: 'Gut Health Emphasis',
      description:
          'Targeting the microbiome-gut-brain axis for holistic systemic wellness and metabolic regulation.',
    ),
    PillarItemModel(
      icon: Icons.layers_rounded,
      iconKey: 'layers_rounded',
      title: 'Scalable Platform',
      description:
          'Modular solid-state & liquid fermentation processes designed for rapid industrial-scale manufacturing.',
    ),
    PillarItemModel(
      icon: Icons.diversity_3_rounded,
      iconKey: 'diversity_3_rounded',
      title: 'Community Integration',
      description:
          'Partnering with local agricultural & forest populations for ethical, benefit-sharing bio-prospecting.',
    ),
    PillarItemModel(
      icon: Icons.tune_rounded,
      iconKey: 'tune_rounded',
      title: 'Customized Solutions',
      description:
          'Tailored consortia formulation engineered for specific food science and therapeutic partner requirements.',
    ),
    PillarItemModel(
      icon: Icons.eco_rounded,
      iconKey: 'eco_rounded',
      title: 'Ecologically Informed',
      description:
          'Ensuring all bio-interventions preserve microbiome equilibrium and natural environmental biodiversity.',
    ),
  ];
}
