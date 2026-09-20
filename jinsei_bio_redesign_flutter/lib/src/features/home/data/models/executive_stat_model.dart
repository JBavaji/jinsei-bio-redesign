import 'package:flutter/material.dart';

class ExecutiveStatModel {
  final IconData icon;
  final String title;
  final String subtitle;

  const ExecutiveStatModel({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  static const List<ExecutiveStatModel> defaultStats = [
    ExecutiveStatModel(
      icon: Icons.military_tech_rounded,
      title: '3+ Global Patents Filed',
      subtitle: 'International IP Protection',
    ),
    ExecutiveStatModel(
      icon: Icons.account_tree_rounded,
      title: '10-Step Proprietary Platform',
      subtitle: 'End-to-end Strain Isolation',
    ),
    ExecutiveStatModel(
      icon: Icons.school_rounded,
      title: '8+ PhD Academic Advisors',
      subtitle: 'UC Irvine, Cambridge, Cornell',
    ),
  ];
}
