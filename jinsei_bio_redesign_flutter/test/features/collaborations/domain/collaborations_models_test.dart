import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_contact_info_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_content_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_inquiry_model.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/domain/models/collaboration_track_model.dart';

void main() {
  group('Collaborations Domain Models Tests (JIN-68 / JIN-70)', () {
    test('CollaborationTrackModel serializes and deserializes correctly', () {
      const model = CollaborationTrackModel(
        trackId: 'fmcg_integration',
        title: '1. FMCG Integration',
        badge: 'Pillar 1',
        description: 'Include indigenous strains for fermentation.',
        deliverables: ['Fermentation optimization', 'Biopreservation'],
        iconKey: 'sanitizer',
      );

      final json = model.toJson();
      final fromJson = CollaborationTrackModel.fromJson(json);

      expect(fromJson, equals(model));
      expect(fromJson.trackId, equals('fmcg_integration'));
      expect(fromJson.deliverables.length, equals(2));
      expect(fromJson.iconKey, equals('sanitizer'));
    });

    test('CollaborationContactInfoModel serializes and deserializes correctly',
        () {
      const model = CollaborationContactInfoModel(
        supportEmail: 'info@jinseibio.com',
        supportNotice: 'Guaranteed response within 24h',
        facilityName: 'State-of-the-art incubation campus',
        facilityAddress: 'NCL Innovation Park, Pune',
        facilityCoordinates: '18.5362° N, 73.8152° E',
        visitingTimings: 'Monday - Saturday: By Appointment',
        visitingStatus: 'By Appointment',
        standards: [
          CollaborationComplianceStandardModel(
            title: 'ISO 9001:2015',
            description: 'Quality Management Systems',
            badge: 'Certified',
          ),
          CollaborationComplianceStandardModel(
            title: 'GMP Certified',
            description: 'Good Manufacturing Practices',
            badge: 'Certified',
          ),
        ],
      );

      final json = model.toJson();
      final fromJson = CollaborationContactInfoModel.fromJson(json);

      expect(fromJson, equals(model));
      expect(fromJson.supportEmail, equals('info@jinseibio.com'));
      expect(fromJson.standards.length, equals(2));
      expect(fromJson.standards[0].title, equals('ISO 9001:2015'));
    });

    test('CollaborationContentModel serializes and deserializes full hierarchy',
        () {
      const model = CollaborationContentModel(
        headlineBadge: 'STRATEGIC ALLIANCES',
        heroTitle: 'COLLABORATE WITH US',
        heroSubtitle: 'Partnering with FMCG leaders',
        tracks: [
          CollaborationTrackModel(
            trackId: 'lab_cro',
            title: '2. LAB CRO Services',
            badge: 'Pillar 2',
            description: 'Process development',
            deliverables: ['Yield enhancement'],
            iconKey: 'science',
          ),
        ],
        contactInfo: CollaborationContactInfoModel(
          supportEmail: 'contact@jinseibio.com',
          supportNotice: '24h notice',
          facilityName: 'Campus',
          facilityAddress: 'Address',
          facilityCoordinates: '0, 0',
          visitingTimings: 'Timings',
          visitingStatus: 'Open',
          standards: [],
        ),
        governanceTitle: 'Ethics Assurance',
        governanceDescription: 'ISO 9001 standards',
      );

      final json = model.toJson();
      final fromJson = CollaborationContentModel.fromJson(json);

      expect(fromJson, equals(model));
      expect(fromJson.tracks.length, equals(1));
      expect(
          fromJson.contactInfo.supportEmail, equals('contact@jinseibio.com'));
      expect(fromJson.governanceTitle, equals('Ethics Assurance'));
    });

    test('CollaborationInquiryModel copyWith and JSON roundtrip', () {
      final now = DateTime.now();
      final inquiry = CollaborationInquiryModel(
        name: 'Dr. Jane Foster',
        email: 'j.foster@bioresearch.org',
        organization: 'Foster Biotics Ltd',
        partnershipTrack: 'Co-Development',
        message: 'Exploring joint IP pipeline for gut microbiome isolates.',
        trackingId: 'JIN-COL-2026-TEST99',
        submittedAt: now,
        status: 'pending_review',
      );

      final json = inquiry.toJson();
      final fromJson = CollaborationInquiryModel.fromJson(json);

      expect(fromJson.name, equals('Dr. Jane Foster'));
      expect(fromJson.email, equals('j.foster@bioresearch.org'));
      expect(fromJson.partnershipTrack, equals('Co-Development'));
      expect(fromJson.trackingId, equals('JIN-COL-2026-TEST99'));

      final modified = inquiry.copyWith(status: 'reviewed');
      expect(modified.status, equals('reviewed'));
      expect(modified.name, equals('Dr. Jane Foster'));
    });

    test(
        'Models safely handle null or missing tracks/standards/deliverables without TypeError',
        () {
      // Empty or unexpected map (such as server error response)
      final emptyContent = CollaborationContentModel.fromJson(const {
        'status': 'OK',
        'path': '/collaborations',
      });
      expect(emptyContent.headlineBadge, equals(''));
      expect(emptyContent.tracks, isEmpty);
      expect(emptyContent.contactInfo.standards, isEmpty);

      final emptyContact = CollaborationContactInfoModel.fromJson(const {
        'standards': null,
      });
      expect(emptyContact.standards, isEmpty);

      final emptyTrack = CollaborationTrackModel.fromJson(const {
        'deliverables': null,
      });
      expect(emptyTrack.deliverables, isEmpty);
    });
  });
}
