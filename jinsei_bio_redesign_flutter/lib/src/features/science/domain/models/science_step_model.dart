import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ScienceStepCategory {
  discovery,
  analytics,
  formulation,
  clinical,
  commercial,
}

class ScienceStepModel {
  final int stepNumber;
  final String title;
  final String subtitle;
  final String description;
  final ScienceStepCategory category;
  final IconData icon;
  final String metricValue;
  final String metricLabel;
  final String imageUrl;
  final String? iconKey;

  const ScienceStepModel({
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.icon,
    required this.metricValue,
    required this.metricLabel,
    required this.imageUrl,
    this.iconKey,
  });

  static const Map<String, IconData> _iconMap = {
    'search_rounded': Icons.search_rounded,
    'biotech_rounded': Icons.biotech_rounded,
    'analytics_rounded': Icons.analytics_rounded,
    'hub_rounded': Icons.hub_rounded,
    'precision_manufacturing_rounded': Icons.precision_manufacturing_rounded,
    'security_rounded': Icons.security_rounded,
    'verified_rounded': Icons.verified_rounded,
    'assignment_rounded': Icons.assignment_rounded,
    'factory_rounded': Icons.factory_rounded,
    'local_shipping_rounded': Icons.local_shipping_rounded,
  };

  factory ScienceStepModel.fromJson(Map<String, dynamic> json) {
    final categoryStr = json['category'] as String? ?? 'discovery';
    final category = ScienceStepCategory.values.firstWhere(
      (c) => c.name.toLowerCase() == categoryStr.toLowerCase(),
      orElse: () => ScienceStepCategory.discovery,
    );

    final key = json['iconKey'] as String?;
    final iconData = _iconMap[key] ?? Icons.biotech_rounded;

    return ScienceStepModel(
      stepNumber: (json['stepNumber'] as num?)?.toInt() ?? 1,
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: category,
      icon: iconData,
      metricValue: json['metricValue'] as String? ?? '',
      metricLabel: json['metricLabel'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      iconKey: key,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stepNumber': stepNumber,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'category': category.name,
      'iconKey': iconKey ?? _resolveIconKey(icon),
      'metricValue': metricValue,
      'metricLabel': metricLabel,
      'imageUrl': imageUrl,
    };
  }

  static String _resolveIconKey(IconData icon) {
    for (final entry in _iconMap.entries) {
      if (entry.value.codePoint == icon.codePoint) {
        return entry.key;
      }
    }
    return 'biotech_rounded';
  }

  static Future<List<ScienceStepModel>> loadFromAsset({
    AssetBundle? bundle,
    String path = 'assets/config/science_steps.json',
  }) async {
    try {
      final assetBundle = bundle ?? rootBundle;
      final jsonString = await assetBundle.loadString(path);
      final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((e) => ScienceStepModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return defaultSteps;
    }
  }

  static List<ScienceStepModel> get defaultSteps => const [
        ScienceStepModel(
          stepNumber: 1,
          title: 'Target Consumer Product Identification',
          subtitle: 'Metagenomic Biomarker Mapping',
          description:
              'We begin by working with you to clearly define the target consumer product and its intended benefit. This provides immediate application to a market.',
          category: ScienceStepCategory.discovery,
          icon: Icons.search_rounded,
          iconKey: 'search_rounded',
          metricValue: '99.4%',
          metricLabel: 'Target Precision',
          imageUrl: 'assets/images/science/step_01.jpg',
        ),
        ScienceStepModel(
          stepNumber: 2,
          title:
              'Application-Specific Strain Identification & Characterization',
          subtitle: 'Anaerobic Cultivation Protocol',
          description:
              'We partner with you to identify, screen and characterize indigenous strains, isolating their functional traits to your specific product requirements.',
          category: ScienceStepCategory.discovery,
          icon: Icons.biotech_rounded,
          iconKey: 'biotech_rounded',
          metricValue: '500+',
          metricLabel: 'Strains Isolated',
          imageUrl: 'assets/images/science/step_02.jpg',
        ),
        ScienceStepModel(
          stepNumber: 3,
          title: 'Upstream & Downstream Optimization',
          subtitle: 'Bioinformatics & Fermentation',
          description:
              'We optimize microbial fermentation conditions to ensure high biomass density and scalable yield while establishing post-fermentation stability.',
          category: ScienceStepCategory.analytics,
          icon: Icons.analytics_rounded,
          iconKey: 'analytics_rounded',
          metricValue: '100%',
          metricLabel: 'Sequence Coverage',
          imageUrl: 'assets/images/science/step_03.jpg',
        ),
        ScienceStepModel(
          stepNumber: 4,
          title: 'Pro-Plant Scale Strain Development',
          subtitle: 'In-Vitro Synergistic Modeling',
          description:
              'Our R&D team moves to a pro-plant scale strain development phase including robust strain optimization, scale-up feasibility and product performance testing.',
          category: ScienceStepCategory.formulation,
          icon: Icons.hub_rounded,
          iconKey: 'hub_rounded',
          metricValue: '10M+',
          metricLabel: 'Pairs Evaluated',
          imageUrl: 'assets/images/science/step_04.jpg',
        ),
        ScienceStepModel(
          stepNumber: 5,
          title: 'Formulation & Formats',
          subtitle: 'Fermentation Optimization',
          description:
              'We optimize post-processing of candidate ingredients for full compatibility with specific matrix and packaging formats, maintaining a scale-viable workflow.',
          category: ScienceStepCategory.formulation,
          icon: Icons.precision_manufacturing_rounded,
          iconKey: 'precision_manufacturing_rounded',
          metricValue: '10^11',
          metricLabel: 'CFU/g Yield',
          imageUrl: 'assets/images/science/step_05.jpg',
        ),
        ScienceStepModel(
          stepNumber: 6,
          title: 'Product-Specific Bioactivity Systemization',
          subtitle: 'In-Vivo Toxicity Studies',
          description:
              'We validate bioactivities and bioactivity data in rigorous clinical frameworks, generating rich numerical evidence to support specific claims.',
          category: ScienceStepCategory.clinical,
          icon: Icons.security_rounded,
          iconKey: 'security_rounded',
          metricValue: '0',
          metricLabel: 'Adverse Events',
          imageUrl: 'assets/images/science/step_06.jpg',
        ),
        ScienceStepModel(
          stepNumber: 7,
          title: 'Scaling for Commercialization',
          subtitle: 'Randomized Double-Blind Studies',
          description:
              'We seamlessly transfer the manufacturing process from pilot to commercial scale, guaranteeing consistent quality and performance for large-volume production.',
          category: ScienceStepCategory.clinical,
          icon: Icons.verified_rounded,
          iconKey: 'verified_rounded',
          metricValue: '88%',
          metricLabel: 'Efficacy Rate',
          imageUrl: 'assets/images/science/step_07.jpg',
        ),
        ScienceStepModel(
          stepNumber: 8,
          title: 'Shelf Life Stability & Field Trials',
          subtitle: 'FDA & DCGI Compliance',
          description:
              'Our Formulations are engineered for robust shelf life with proven viability retention, supported by stability testing and real-world field trials.',
          category: ScienceStepCategory.clinical,
          icon: Icons.assignment_rounded,
          iconKey: 'assignment_rounded',
          metricValue: '3',
          metricLabel: 'Patents Filed',
          imageUrl: 'assets/images/science/step_08.jpg',
        ),
        ScienceStepModel(
          stepNumber: 9,
          title: 'Regulatory Compliance',
          subtitle: 'cGMP Freeze-Drying Facility',
          description:
              'We help navigate complex regulatory standards, ensuring compliance against international accreditation and validation of the final product.',
          category: ScienceStepCategory.commercial,
          icon: Icons.factory_rounded,
          iconKey: 'factory_rounded',
          metricValue: '24 Mo.',
          metricLabel: 'Shelf Stability',
          imageUrl: 'assets/images/science/step_09.jpg',
        ),
        ScienceStepModel(
          stepNumber: 10,
          title: 'Continuous Improvement of Strains & Process',
          subtitle: 'B2B & B2C Distribution',
          description:
              'Through data-driven R&D iterations, we refine strains, formulations, and scale-up processes for continuous enhancement of product efficiency.',
          category: ScienceStepCategory.commercial,
          icon: Icons.local_shipping_rounded,
          iconKey: 'local_shipping_rounded',
          metricValue: '4',
          metricLabel: 'Vertical Markets',
          imageUrl: 'assets/images/science/step_10.jpg',
        ),
      ];
}

