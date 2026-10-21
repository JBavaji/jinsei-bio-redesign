import 'package:equatable/equatable.dart';

class StrainVerticalOptionModel extends Equatable {
  final String strainId;
  final String category;
  final String name;
  final String strainCode;
  final String highlight;
  final String defaultFormat;
  final int displayOrder;

  const StrainVerticalOptionModel({
    required this.strainId,
    required this.category,
    required this.name,
    required this.strainCode,
    required this.highlight,
    required this.defaultFormat,
    this.displayOrder = 0,
  });

  factory StrainVerticalOptionModel.fromJson(Map<String, dynamic> json) {
    return StrainVerticalOptionModel(
      strainId: json['strainId'] as String? ?? '',
      category: json['category'] as String? ?? '',
      name: json['name'] as String? ?? '',
      strainCode: json['strainCode'] as String? ?? '',
      highlight: json['highlight'] as String? ?? '',
      defaultFormat: json['defaultFormat'] as String? ?? 'lyophilized_powder',
      displayOrder: json['displayOrder'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strainId': strainId,
      'category': category,
      'name': name,
      'strainCode': strainCode,
      'highlight': highlight,
      'defaultFormat': defaultFormat,
      'displayOrder': displayOrder,
    };
  }

  @override
  List<Object?> get props => [
        strainId,
        category,
        name,
        strainCode,
        highlight,
        defaultFormat,
        displayOrder,
      ];
}
