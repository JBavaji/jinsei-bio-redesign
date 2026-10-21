/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class B2bModalContent extends _i1.SerializableEntity {
  B2bModalContent._({
    required this.badgeText,
    required this.title,
    required this.subtitle,
    required this.strains,
    required this.formulationFormats,
    required this.complianceNote,
    required this.certifications,
    required this.dispatchNotice,
  });

  factory B2bModalContent({
    required String badgeText,
    required String title,
    required String subtitle,
    required List<_i2.StrainVerticalOption> strains,
    required List<_i2.FormulationFormatOption> formulationFormats,
    required String complianceNote,
    required List<String> certifications,
    required String dispatchNotice,
  }) = _B2bModalContentImpl;

  factory B2bModalContent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return B2bModalContent(
      badgeText: serializationManager
          .deserialize<String>(jsonSerialization['badgeText']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
      strains: serializationManager.deserialize<List<_i2.StrainVerticalOption>>(
          jsonSerialization['strains']),
      formulationFormats:
          serializationManager.deserialize<List<_i2.FormulationFormatOption>>(
              jsonSerialization['formulationFormats']),
      complianceNote: serializationManager
          .deserialize<String>(jsonSerialization['complianceNote']),
      certifications: serializationManager
          .deserialize<List<String>>(jsonSerialization['certifications']),
      dispatchNotice: serializationManager
          .deserialize<String>(jsonSerialization['dispatchNotice']),
    );
  }

  String badgeText;

  String title;

  String subtitle;

  List<_i2.StrainVerticalOption> strains;

  List<_i2.FormulationFormatOption> formulationFormats;

  String complianceNote;

  List<String> certifications;

  String dispatchNotice;

  B2bModalContent copyWith({
    String? badgeText,
    String? title,
    String? subtitle,
    List<_i2.StrainVerticalOption>? strains,
    List<_i2.FormulationFormatOption>? formulationFormats,
    String? complianceNote,
    List<String>? certifications,
    String? dispatchNotice,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'badgeText': badgeText,
      'title': title,
      'subtitle': subtitle,
      'strains': strains.toJson(valueToJson: (v) => v.toJson()),
      'formulationFormats':
          formulationFormats.toJson(valueToJson: (v) => v.toJson()),
      'complianceNote': complianceNote,
      'certifications': certifications.toJson(),
      'dispatchNotice': dispatchNotice,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'badgeText': badgeText,
      'title': title,
      'subtitle': subtitle,
      'strains': strains.toJson(valueToJson: (v) => v.allToJson()),
      'formulationFormats':
          formulationFormats.toJson(valueToJson: (v) => v.allToJson()),
      'complianceNote': complianceNote,
      'certifications': certifications.toJson(),
      'dispatchNotice': dispatchNotice,
    };
  }
}

class _B2bModalContentImpl extends B2bModalContent {
  _B2bModalContentImpl({
    required String badgeText,
    required String title,
    required String subtitle,
    required List<_i2.StrainVerticalOption> strains,
    required List<_i2.FormulationFormatOption> formulationFormats,
    required String complianceNote,
    required List<String> certifications,
    required String dispatchNotice,
  }) : super._(
          badgeText: badgeText,
          title: title,
          subtitle: subtitle,
          strains: strains,
          formulationFormats: formulationFormats,
          complianceNote: complianceNote,
          certifications: certifications,
          dispatchNotice: dispatchNotice,
        );

  @override
  B2bModalContent copyWith({
    String? badgeText,
    String? title,
    String? subtitle,
    List<_i2.StrainVerticalOption>? strains,
    List<_i2.FormulationFormatOption>? formulationFormats,
    String? complianceNote,
    List<String>? certifications,
    String? dispatchNotice,
  }) {
    return B2bModalContent(
      badgeText: badgeText ?? this.badgeText,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      strains: strains ?? this.strains.clone(),
      formulationFormats: formulationFormats ?? this.formulationFormats.clone(),
      complianceNote: complianceNote ?? this.complianceNote,
      certifications: certifications ?? this.certifications.clone(),
      dispatchNotice: dispatchNotice ?? this.dispatchNotice,
    );
  }
}
