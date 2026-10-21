import 'dart:async';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import '../../../../core/config/app_config.dart';
import '../../domain/models/collaboration_contact_info_model.dart';
import '../../domain/models/collaboration_content_model.dart';
import '../../domain/models/collaboration_inquiry_model.dart';
import '../../domain/models/collaboration_track_model.dart';

abstract class ICollaborationsRemoteDataSource {
  Future<CollaborationContentModel?> getCollaborationsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  });
  Future<String?> submitCollaborationInquiry(
    CollaborationInquiryModel inquiry, {
    Duration timeout = const Duration(milliseconds: 5000),
  });
}

class CollaborationsRemoteDataSource
    implements ICollaborationsRemoteDataSource {
  final Client _client;

  CollaborationsRemoteDataSource({Client? client})
      : _client = client ?? Client(AppConfig.serverpodUrl);

  @override
  Future<CollaborationContentModel?> getCollaborationsContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final response = await _client.collaborations
          .getCollaborationsContent()
          .timeout(timeout);

      final tracks = response.tracks
          .map((t) => CollaborationTrackModel(
                trackId: t.trackId,
                title: t.title,
                badge: t.badge,
                description: t.description,
                deliverables: t.deliverables,
                iconKey: t.iconKey,
              ))
          .toList();

      final standards = response.contactInfo.standards
          .map((s) => CollaborationComplianceStandardModel(
                title: s.title,
                description: s.description,
                badge: s.badge,
              ))
          .toList();

      final contactInfo = CollaborationContactInfoModel(
        supportEmail: response.contactInfo.supportEmail,
        supportNotice: response.contactInfo.supportNotice,
        facilityName: response.contactInfo.facilityName,
        facilityAddress: response.contactInfo.facilityAddress,
        facilityCoordinates: response.contactInfo.facilityCoordinates,
        visitingTimings: response.contactInfo.visitingTimings,
        visitingStatus: response.contactInfo.visitingStatus,
        standards: standards,
      );

      return CollaborationContentModel(
        headlineBadge: response.headlineBadge,
        heroTitle: response.heroTitle,
        heroSubtitle: response.heroSubtitle,
        tracks: tracks,
        contactInfo: contactInfo,
        governanceTitle: response.governanceTitle,
        governanceDescription: response.governanceDescription,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<String?> submitCollaborationInquiry(
    CollaborationInquiryModel inquiry, {
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final serverInquiry = CollaborationInquiry(
        name: inquiry.name,
        email: inquiry.email,
        organization: inquiry.organization,
        partnershipTrack: inquiry.partnershipTrack,
        message: inquiry.message,
        trackingId: inquiry.trackingId,
        submittedAt: inquiry.submittedAt ?? DateTime.now(),
        status: inquiry.status,
      );

      final trackingId = await _client.collaborations
          .submitCollaborationInquiry(serverInquiry)
          .timeout(timeout);
      return trackingId;
    } catch (_) {
      return null;
    }
  }
}
