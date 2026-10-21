import '../../domain/models/collaboration_contact_info_model.dart';
import '../../domain/models/collaboration_content_model.dart';
import '../../domain/models/collaboration_inquiry_model.dart';
import '../../domain/models/collaboration_track_model.dart';
import '../../domain/repositories/i_collaborations_repository.dart';
import '../datasources/collaborations_local_data_source.dart';
import '../datasources/collaborations_remote_data_source.dart';

class CollaborationsRepositoryImpl implements ICollaborationsRepository {
  final ICollaborationsLocalDataSource _localDataSource;
  final ICollaborationsRemoteDataSource _remoteDataSource;

  CollaborationsRepositoryImpl({
    ICollaborationsLocalDataSource? localDataSource,
    ICollaborationsRemoteDataSource? remoteDataSource,
  })  : _localDataSource = localDataSource ?? CollaborationsLocalDataSource(),
        _remoteDataSource =
            remoteDataSource ?? CollaborationsRemoteDataSource();

  @override
  Future<CollaborationContentModel> getCollaborationsContent() async {
    try {
      // 1. Attempt remote Serverpod endpoint first
      final remoteData = await _remoteDataSource.getCollaborationsContent();
      if (remoteData != null) {
        return remoteData;
      }
    } catch (_) {
      // Graceful fallback to local asset data
    }

    try {
      // 2. Fall back gracefully to bundled asset JSON on error / offline / timeout
      return await _localDataSource.fetchCollaborationsContent();
    } catch (_) {
      // 3. Fall back to in-memory default model if asset loading fails
      return _inMemoryFallbackContent;
    }
  }

  @override
  Future<String> submitCollaborationInquiry(
    CollaborationInquiryModel inquiry,
  ) async {
    try {
      // 1. Attempt remote Serverpod submission first
      final remoteTrackingId =
          await _remoteDataSource.submitCollaborationInquiry(inquiry);
      if (remoteTrackingId != null && remoteTrackingId.isNotEmpty) {
        return remoteTrackingId;
      }
    } catch (_) {
      // Graceful fallback to local sandbox persistence
    }

    // 2. Fall back to local sandbox mock persistence
    return await _localDataSource.saveOfflineInquiry(inquiry);
  }

  static const CollaborationContentModel _inMemoryFallbackContent =
      CollaborationContentModel(
    headlineBadge: 'STRATEGIC ALLIANCES & CRO SERVICES',
    heroTitle: 'LOOKING TO COLLABORATE WITH US?',
    heroSubtitle:
        'Partnering with FMCG leaders, bio-pharma enterprises, and academic institutions to co-develop, optimize, and commercialize validated indigenous strain formulations.',
    tracks: [
      CollaborationTrackModel(
        trackId: 'fmcg_integration',
        title: '1. FMCG Integration',
        badge: 'Pillar 1',
        description:
            'Include indigenous strains for fermentation, biopreservation, functional foods, or probiotic enrichment.',
        deliverables: [
          'Fermentation optimization',
          'Biopreservation dossiers',
          'Probiotic enrichment',
        ],
        iconKey: 'sanitizer',
      ),
      CollaborationTrackModel(
        trackId: 'lab_cro',
        title: '2. LAB CRO Services',
        badge: 'Pillar 2',
        description:
            'Process development, yield optimization, and contract research for lactic acid bacteria strains.',
        deliverables: [
          'Yield enhancement',
          'Pilot bioreactor runs',
          'Phenotypic screening',
        ],
        iconKey: 'science',
      ),
      CollaborationTrackModel(
        trackId: 'co_development',
        title: '3. Co-Development',
        badge: 'Pillar 3',
        description:
            'Joint R&D with enterprises or academic pioneers to build healthier microbial applications.',
        deliverables: [
          'Joint IP development',
          'Clinical protocol design',
          'Multi-strain consortiums',
        ],
        iconKey: 'biotech',
      ),
    ],
    contactInfo: CollaborationContactInfoModel(
      supportEmail: 'info@jinseibio.com',
      supportNotice:
          'Guaranteed response within 24 business hours from our R&D secretariat.',
      facilityName: 'State-of-the-art incubation campus',
      facilityAddress:
          'NCL Innovation Park, Doctor Homi Bhabha Road, Ward No. 8, NCL Colony, Pashan, Pune, Maharashtra, India',
      facilityCoordinates: '18.5362° N, 73.8152° E',
      visitingTimings: 'Monday - Saturday: By Appointment | Sunday: Closed',
      visitingStatus: 'By Appointment',
      standards: [
        CollaborationComplianceStandardModel(
          title: 'ISO 9001:2015',
          description: 'Quality Management Systems for Laboratory R&D',
          badge: 'Certified',
        ),
        CollaborationComplianceStandardModel(
          title: 'GMP Certified',
          description:
              'Good Manufacturing Practices for Probiotic Formulations',
          badge: 'Certified',
        ),
        CollaborationComplianceStandardModel(
          title: 'FSSAI Compliant',
          description: 'Food Safety and Standards Authority of India Standards',
          badge: 'Compliant',
        ),
        CollaborationComplianceStandardModel(
          title: 'Bio-Prospecting Ethics',
          description: 'Adherence to National Biodiversity Authority Protocols',
          badge: 'Compliant',
        ),
      ],
    ),
    governanceTitle: 'Scientific Governance & Ethics Assurance',
    governanceDescription:
        'ISO 9001:2015 & GMP Certified R&D Standards • Ethical Bio-Prospecting',
  );
}
