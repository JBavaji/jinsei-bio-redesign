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
      return const [];
    }
  }
}
