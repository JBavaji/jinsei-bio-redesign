class SolutionsQualityAssuranceModel {
  final String title;
  final String description;
  final String badgeText;
  final String complianceStandard;

  const SolutionsQualityAssuranceModel({
    required this.title,
    required this.description,
    required this.badgeText,
    required this.complianceStandard,
  });

  factory SolutionsQualityAssuranceModel.fromJson(Map<String, dynamic> json) {
    return SolutionsQualityAssuranceModel(
      title:
          json['title'] as String? ?? 'Clinical & Commercial Quality Assurance',
      description: json['description'] as String? ?? '',
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
}
