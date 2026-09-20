import 'package:equatable/equatable.dart';

abstract class B2bFormEvent extends Equatable {
  const B2bFormEvent();

  @override
  List<Object?> get props => [];
}

class FullNameChangedEvent extends B2bFormEvent {
  final String fullName;
  const FullNameChangedEvent(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

class CompanyChangedEvent extends B2bFormEvent {
  final String company;
  const CompanyChangedEvent(this.company);

  @override
  List<Object?> get props => [company];
}

class EmailChangedEvent extends B2bFormEvent {
  final String email;
  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class InquiryClassificationChangedEvent extends B2bFormEvent {
  final String classification;
  const InquiryClassificationChangedEvent(this.classification);

  @override
  List<Object?> get props => [classification];
}

class SubmitB2bFormEvent extends B2bFormEvent {
  const SubmitB2bFormEvent();
}

class ResetB2bFormEvent extends B2bFormEvent {
  const ResetB2bFormEvent();
}
