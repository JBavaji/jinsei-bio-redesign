import 'package:equatable/equatable.dart';

class GovernanceAssuranceModel extends Equatable {
  final String title;
  final String description;
  final String badgeText;
  final String complianceStandard;

  const GovernanceAssuranceModel({
    required this.title,
    required this.description,
    required this.badgeText,
    required this.complianceStandard,
  });

  factory GovernanceAssuranceModel.fromJson(Map<String, dynamic> json) {
    return GovernanceAssuranceModel(
      title: json['title'] as String? ??
          'Scientific Governance & Ethics Assurance',
      description: json['description'] as String? ??
          'ISO 9001:2015 & GMP Certified R&D Standards • Ethical Bio-Prospecting',
      badgeText: json['badgeText'] as String? ?? 'Pune NCL Innovation Park',
      complianceStandard: json['complianceStandard'] as String? ??
          'Bio-Prospecting Ethics Compliant',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'badgeText': badgeText,
      'complianceStandard': complianceStandard,
    };
  }

  @override
  List<Object?> get props =>
      [title, description, badgeText, complianceStandard];
}
