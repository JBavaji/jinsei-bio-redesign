import 'package:flutter/material.dart';

class SolutionMetricModel {
  final String iconKey;
  final String value;
  final String label;
  final String accentColorHex;
  final int displayOrder;
  final IconData icon;

  const SolutionMetricModel({
    required this.iconKey,
    required this.value,
    required this.label,
    required this.accentColorHex,
    required this.displayOrder,
    required this.icon,
  });

  static const Map<String, IconData> _iconMap = {
    'hub_rounded': Icons.hub_rounded,
    'biotech_rounded': Icons.biotech_rounded,
    'verified_rounded': Icons.verified_rounded,
    'science_rounded': Icons.science_rounded,
    'eco_rounded': Icons.eco_rounded,
  };

  factory SolutionMetricModel.fromJson(Map<String, dynamic> json) {
    final key = json['iconKey'] as String? ?? 'hub_rounded';
    return SolutionMetricModel(
      iconKey: key,
      value: json['value'] as String? ?? '',
      label: json['label'] as String? ?? '',
      accentColorHex: json['accentColorHex'] as String? ?? '#7BD4E2',
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 1,
      icon: _iconMap[key] ?? Icons.hub_rounded,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iconKey': iconKey,
      'value': value,
      'label': label,
      'accentColorHex': accentColorHex,
      'displayOrder': displayOrder,
    };
  }
}
