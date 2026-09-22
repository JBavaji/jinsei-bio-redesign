import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ScienceHeaderMetricModel {
  final IconData icon;
  final String iconKey;
  final String value;
  final String label;
  final Color accentColor;
  final String accentColorHex;

  const ScienceHeaderMetricModel({
    required this.icon,
    required this.iconKey,
    required this.value,
    required this.label,
    required this.accentColor,
    required this.accentColorHex,
  });

  static const Map<String, IconData> _iconMap = {
    'science_rounded': Icons.science_rounded,
    'biotech_rounded': Icons.biotech_rounded,
    'verified_rounded': Icons.verified_rounded,
  };

  factory ScienceHeaderMetricModel.fromJson(Map<String, dynamic> json) {
    final key = json['iconKey'] as String? ?? 'science_rounded';
    final iconData = _iconMap[key] ?? Icons.science_rounded;
    final hexStr = json['accentColorHex'] as String? ?? '#7BD4E2';

    Color color;
    if (hexStr == '#66DD8B') {
      color = AppColors.emeraldAccent;
    } else {
      color = AppColors.cyanInteractive;
    }

    return ScienceHeaderMetricModel(
      icon: iconData,
      iconKey: key,
      value: json['value'] as String? ?? '',
      label: json['label'] as String? ?? '',
      accentColor: color,
      accentColorHex: hexStr,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iconKey': iconKey,
      'value': value,
      'label': label,
      'accentColorHex': accentColorHex,
    };
  }
}
