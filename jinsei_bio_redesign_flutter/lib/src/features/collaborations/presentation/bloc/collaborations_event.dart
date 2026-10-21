import 'package:equatable/equatable.dart';

abstract class CollaborationsEvent extends Equatable {
  const CollaborationsEvent();

  @override
  List<Object?> get props => [];
}

class LoadCollaborationsContentEvent extends CollaborationsEvent {
  const LoadCollaborationsContentEvent();
}

class NameChangedEvent extends CollaborationsEvent {
  final String name;
  const NameChangedEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class EmailChangedEvent extends CollaborationsEvent {
  final String email;
  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class OrganizationChangedEvent extends CollaborationsEvent {
  final String organization;
  const OrganizationChangedEvent(this.organization);

  @override
  List<Object?> get props => [organization];
}

class PartnershipTrackChangedEvent extends CollaborationsEvent {
  final String partnershipTrack;
  const PartnershipTrackChangedEvent(this.partnershipTrack);

  @override
  List<Object?> get props => [partnershipTrack];
}

class MessageChangedEvent extends CollaborationsEvent {
  final String message;
  const MessageChangedEvent(this.message);

  @override
  List<Object?> get props => [message];
}

class SubmitCollaborationInquiryEvent extends CollaborationsEvent {
  const SubmitCollaborationInquiryEvent();
}

class ResetCollaborationInquiryEvent extends CollaborationsEvent {
  const ResetCollaborationInquiryEvent();
}
