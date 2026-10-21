import 'package:equatable/equatable.dart';

class FormulationFormatOptionModel extends Equatable {
  final String formatId;
  final String label;
  final int displayOrder;

  const FormulationFormatOptionModel({
    required this.formatId,
    required this.label,
    this.displayOrder = 0,
  });

  factory FormulationFormatOptionModel.fromJson(Map<String, dynamic> json) {
    return FormulationFormatOptionModel(
      formatId: json['formatId'] as String? ?? '',
      label: json['label'] as String? ?? '',
      displayOrder: json['displayOrder'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'formatId': formatId,
      'label': label,
      'displayOrder': displayOrder,
    };
  }

  @override
  List<Object?> get props => [formatId, label, displayOrder];
}
