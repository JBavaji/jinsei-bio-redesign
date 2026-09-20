import 'package:equatable/equatable.dart';

enum B2bFormStatus { initial, submitting, success, failure }

class B2bFormState extends Equatable {
  final String fullName;
  final String company;
  final String email;
  final String classification;
  final B2bFormStatus status;
  final String? errorMessage;

  const B2bFormState({
    this.fullName = '',
    this.company = '',
    this.email = '',
    this.classification = 'Clinical Research Collaboration',
    this.status = B2bFormStatus.initial,
    this.errorMessage,
  });

  bool get isValid =>
      fullName.trim().isNotEmpty &&
      company.trim().isNotEmpty &&
      email.trim().contains('@');

  B2bFormState copyWith({
    String? fullName,
    String? company,
    String? email,
    String? classification,
    B2bFormStatus? status,
    String? errorMessage,
  }) {
    return B2bFormState(
      fullName: fullName ?? this.fullName,
      company: company ?? this.company,
      email: email ?? this.email,
      classification: classification ?? this.classification,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        fullName,
        company,
        email,
        classification,
        status,
        errorMessage,
      ];
}
