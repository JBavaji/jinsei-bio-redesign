import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

/// Serverpod Endpoint for Strategic Collaborations Screen & Inquiry Flow (JIN-68 / JIN-69)
class CollaborationsEndpoint extends Endpoint {
  /// Fetches complete dynamic collaboration content, partnership tracks, facility info, and compliance standards.
  Future<CollaborationContent> getCollaborationsContent(Session session) async {
    return _defaultContent;
  }

  static final CollaborationContent _defaultContent = CollaborationContent(
    headlineBadge: 'STRATEGIC ALLIANCES & CRO SERVICES',
    heroTitle: 'LOOKING TO COLLABORATE WITH US?',
    heroSubtitle:
        'Partnering with FMCG leaders, bio-pharma enterprises, and academic institutions to co-develop, optimize, and commercialize validated indigenous strain formulations.',
    tracks: [
      CollaborationTrack(
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
      CollaborationTrack(
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
      CollaborationTrack(
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
    contactInfo: CollaborationContactInfo(
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
        CollaborationComplianceStandard(
          title: 'ISO 9001:2015',
          description: 'Quality Management Systems for Laboratory R&D',
          badge: 'Certified',
        ),
        CollaborationComplianceStandard(
          title: 'GMP Certified',
          description:
              'Good Manufacturing Practices for Probiotic Formulations',
          badge: 'Certified',
        ),
        CollaborationComplianceStandard(
          title: 'FSSAI Compliant',
          description: 'Food Safety and Standards Authority of India Standards',
          badge: 'Compliant',
        ),
        CollaborationComplianceStandard(
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
