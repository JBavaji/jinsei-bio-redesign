/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class FormulationFormatOption extends _i1.SerializableEntity {
  FormulationFormatOption._({
    required this.formatId,
    required this.label,
    required this.displayOrder,
  });

  factory FormulationFormatOption({
    required String formatId,
    required String label,
    required int displayOrder,
  }) = _FormulationFormatOptionImpl;

  factory FormulationFormatOption.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FormulationFormatOption(
      formatId: serializationManager
          .deserialize<String>(jsonSerialization['formatId']),
      label:
          serializationManager.deserialize<String>(jsonSerialization['label']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  String formatId;

  String label;

  int displayOrder;

  FormulationFormatOption copyWith({
    String? formatId,
    String? label,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'formatId': formatId,
      'label': label,
      'displayOrder': displayOrder,
    };
  }
}

class _FormulationFormatOptionImpl extends FormulationFormatOption {
  _FormulationFormatOptionImpl({
    required String formatId,
    required String label,
    required int displayOrder,
  }) : super._(
          formatId: formatId,
          label: label,
          displayOrder: displayOrder,
        );

  @override
  FormulationFormatOption copyWith({
    String? formatId,
    String? label,
    int? displayOrder,
  }) {
    return FormulationFormatOption(
      formatId: formatId ?? this.formatId,
      label: label ?? this.label,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
