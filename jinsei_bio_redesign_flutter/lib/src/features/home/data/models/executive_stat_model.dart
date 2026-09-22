import 'package:flutter/material.dart';

class ExecutiveStatModel {
  final IconData icon;
  final String iconKey;
  final String title;
  final String subtitle;

  const ExecutiveStatModel({
    required this.icon,
    required this.iconKey,
    required this.title,
    required this.subtitle,
  });

  static const Map<String, IconData> _iconMap = {
    'military_tech_rounded': Icons.military_tech_rounded,
    'account_tree_rounded': Icons.account_tree_rounded,
    'school_rounded': Icons.school_rounded,
  };

  factory ExecutiveStatModel.fromJson(Map<String, dynamic> json) {
    final key = json['iconKey'] as String? ?? 'military_tech_rounded';
    final iconData = _iconMap[key] ?? Icons.military_tech_rounded;

    return ExecutiveStatModel(
      icon: iconData,
      iconKey: key,
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iconKey': iconKey,
      'title': title,
      'subtitle': subtitle,
    };
  }

  static const List<ExecutiveStatModel> defaultStats = [
    ExecutiveStatModel(
      icon: Icons.military_tech_rounded,
      iconKey: 'military_tech_rounded',
      title: '3+ Global Patents Filed',
      subtitle: 'International IP Protection',
    ),
    ExecutiveStatModel(
      icon: Icons.account_tree_rounded,
      iconKey: 'account_tree_rounded',
      title: '10-Step Proprietary Platform',
      subtitle: 'End-to-end Strain Isolation',
    ),
    ExecutiveStatModel(
      icon: Icons.school_rounded,
      iconKey: 'school_rounded',
      title: '8+ PhD Academic Advisors',
      subtitle: 'UC Irvine, Cambridge, Cornell',
    ),
  ];
}
