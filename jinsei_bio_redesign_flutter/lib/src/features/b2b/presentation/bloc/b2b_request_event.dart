import 'package:equatable/equatable.dart';

abstract class B2bRequestEvent extends Equatable {
  const B2bRequestEvent();

  @override
  List<Object?> get props => [];
}

class LoadB2bModalContentEvent extends B2bRequestEvent {
  final String? initialStrainId;
  const LoadB2bModalContentEvent({this.initialStrainId});

  @override
  List<Object?> get props => [initialStrainId];
}

class SelectStrainVerticalEvent extends B2bRequestEvent {
  final String strainId;
  const SelectStrainVerticalEvent(this.strainId);

  @override
  List<Object?> get props => [strainId];
}

class FullNameChangedEvent extends B2bRequestEvent {
  final String fullName;
  const FullNameChangedEvent(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

class EmailChangedEvent extends B2bRequestEvent {
  final String email;
  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class CompanyChangedEvent extends B2bRequestEvent {
  final String company;
  const CompanyChangedEvent(this.company);

  @override
  List<Object?> get props => [company];
}

class FormulationFormatChangedEvent extends B2bRequestEvent {
  final String formatId;
  const FormulationFormatChangedEvent(this.formatId);

  @override
  List<Object?> get props => [formatId];
}

class ClinicalScopeChangedEvent extends B2bRequestEvent {
  final String scope;
  const ClinicalScopeChangedEvent(this.scope);

  @override
  List<Object?> get props => [scope];
}

class SubmitB2bSampleRequestEvent extends B2bRequestEvent {
  const SubmitB2bSampleRequestEvent();
}

class ResetB2bRequestFormEvent extends B2bRequestEvent {
  const ResetB2bRequestFormEvent();
}
