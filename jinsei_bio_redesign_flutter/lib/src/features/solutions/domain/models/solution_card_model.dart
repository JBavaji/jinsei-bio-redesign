import 'package:flutter/material.dart';

enum SolutionCategory {
  all,
  humanHealth,
  foodTech,
  dermoBiotics,
  agriTech,
}

extension SolutionCategoryExtension on SolutionCategory {
  String get id {
    switch (this) {
      case SolutionCategory.all:
        return 'all';
      case SolutionCategory.humanHealth:
        return 'human-health';
      case SolutionCategory.foodTech:
        return 'food-tech';
      case SolutionCategory.dermoBiotics:
        return 'dermo-biotics';
      case SolutionCategory.agriTech:
        return 'agri-tech';
    }
  }

  String get label {
    switch (this) {
      case SolutionCategory.all:
        return 'All Verticals (4)';
      case SolutionCategory.humanHealth:
        return 'Human Health';
      case SolutionCategory.foodTech:
        return 'Food Tech';
      case SolutionCategory.dermoBiotics:
        return 'Dermo-Biotics';
      case SolutionCategory.agriTech:
        return 'Agri-Tech';
    }
  }
}

class SolutionCardModel {
  final String solutionId;
  final String categoryTag;
  final String title;
  final String subtitle;
  final String description;
  final String iconKey;
  final IconData icon;
  final String category;
  final String formulationCount;
  final String keyBenefit;
  final String efficacyMetric;
  final List<String> bulletPoints;
  final String actionCtaText;
  final String caseStudyUrl;
  final int displayOrder;

  const SolutionCardModel({
    required this.solutionId,
    required this.categoryTag,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconKey,
    required this.icon,
    required this.category,
    required this.formulationCount,
    required this.keyBenefit,
    required this.efficacyMetric,
    required this.bulletPoints,
    required this.actionCtaText,
    required this.caseStudyUrl,
    required this.displayOrder,
  });

  static const Map<String, IconData> _iconMap = {
    'health_and_safety_rounded': Icons.health_and_safety_rounded,
    'restaurant_rounded': Icons.restaurant_rounded,
    'face_3_rounded': Icons.face_3_rounded,
    'eco_rounded': Icons.eco_rounded,
    'biotech_rounded': Icons.biotech_rounded,
    'hub_rounded': Icons.hub_rounded,
  };

  factory SolutionCardModel.fromJson(Map<String, dynamic> json) {
    final key = json['iconKey'] as String? ?? 'biotech_rounded';
    final rawBullets = json['bulletPoints'] as List<dynamic>? ?? [];
    final bullets = rawBullets.map((b) => b.toString()).toList();

    return SolutionCardModel(
      solutionId: json['solutionId'] as String? ?? '',
      categoryTag: json['categoryTag'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      iconKey: key,
      icon: _iconMap[key] ?? Icons.biotech_rounded,
      category: json['category'] as String? ?? '',
      formulationCount: json['formulationCount'] as String? ?? '',
      keyBenefit: json['keyBenefit'] as String? ?? '',
      efficacyMetric: json['efficacyMetric'] as String? ?? '',
      bulletPoints: bullets,
      actionCtaText: json['actionCtaText'] as String? ?? 'Explore Vertical',
      caseStudyUrl: json['caseStudyUrl'] as String? ?? '',
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'solutionId': solutionId,
      'categoryTag': categoryTag,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'iconKey': iconKey,
      'category': category,
      'formulationCount': formulationCount,
      'keyBenefit': keyBenefit,
      'efficacyMetric': efficacyMetric,
      'bulletPoints': bulletPoints,
      'actionCtaText': actionCtaText,
      'caseStudyUrl': caseStudyUrl,
      'displayOrder': displayOrder,
    };
  }
}
