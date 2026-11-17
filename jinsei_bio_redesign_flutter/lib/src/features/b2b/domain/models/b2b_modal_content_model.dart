import 'package:equatable/equatable.dart';
import 'formulation_format_option_model.dart';
import 'strain_vertical_option_model.dart';

class B2bModalContentModel extends Equatable {
  final String badgeText;
  final String title;
  final String subtitle;
  final List<StrainVerticalOptionModel> strains;
  final List<FormulationFormatOptionModel> formulationFormats;
  final String complianceNote;
  final List<String> certifications;
  final String dispatchNotice;

  const B2bModalContentModel({
    required this.badgeText,
    required this.title,
    required this.subtitle,
    required this.strains,
    required this.formulationFormats,
    required this.complianceNote,
    required this.certifications,
    required this.dispatchNotice,
  });

  factory B2bModalContentModel.fromJson(Map<String, dynamic> json) {
    return B2bModalContentModel(
      badgeText: json['badgeText'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      strains: (json['strains'] is List
          ? (json['strains'] as List<dynamic>)
              .map((e) =>
                  StrainVerticalOptionModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : const <StrainVerticalOptionModel>[]),
      formulationFormats: (json['formulationFormats'] is List
          ? (json['formulationFormats'] as List<dynamic>)
              .map((e) => FormulationFormatOptionModel.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          : const <FormulationFormatOptionModel>[]),
      complianceNote: json['complianceNote'] as String? ?? '',
      certifications: (json['certifications'] is List
          ? (json['certifications'] as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : const <String>[]),
      dispatchNotice: json['dispatchNotice'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'badgeText': badgeText,
      'title': title,
      'subtitle': subtitle,
      'strains': strains.map((e) => e.toJson()).toList(),
      'formulationFormats': formulationFormats.map((e) => e.toJson()).toList(),
      'complianceNote': complianceNote,
      'certifications': certifications,
      'dispatchNotice': dispatchNotice,
    };
  }

  @override
  List<Object?> get props => [
        badgeText,
        title,
        subtitle,
        strains,
        formulationFormats,
        complianceNote,
        certifications,
        dispatchNotice,
      ];
}
