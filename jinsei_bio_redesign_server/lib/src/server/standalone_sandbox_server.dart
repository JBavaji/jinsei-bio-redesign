import 'dart:convert';
import 'dart:io';

import '../utils/version_service.dart';
import 'security_headers.dart';

/// Fallback Standalone HTTP Server for local development without active PostgreSQL instance
Future<void> startStandaloneLocalServer(int port) async {
  try {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
    print(
        '🚀 Jinsei Bio Redesign Local Server live at http://localhost:$port/');

    server.listen((HttpRequest request) async {
      final response = request.response;
      applyProductionSecurityHeaders(response);

      if (request.method == 'OPTIONS') {
        response.statusCode = HttpStatus.ok;
        await response.close();
        return;
      }

      final rawPath = request.uri.path.toLowerCase();
      // Strip /api prefix if present for unified routing
      final path = rawPath.startsWith('/api')
          ? (rawPath.substring(4).isEmpty ? '/' : rawPath.substring(4))
          : rawPath;

      if (path.startsWith('/static/science/') && path.endsWith('.webp')) {
        final filename = path.split('/').last;
        final file = File('web/science/$filename');
        if (await file.exists()) {
          response.statusCode = HttpStatus.ok;
          response.headers.contentType = ContentType('image', 'webp');
          response.headers.set('Cache-Control', 'public, max-age=86400');
          await response.addStream(file.openRead());
          await response.close();
          return;
        } else {
          response.statusCode = HttpStatus.notFound;
          await response.close();
          return;
        }
      }

      if (path == '/health' ||
          path == '/health/' ||
          path == '/health/ping' ||
          path == '/health/status' ||
          path == '/') {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'status': 'HEALTHY',
          'service': 'jinsei_bio_redesign_server',
          'version': VersionService.version,
          'appMode': 'UNOFFICIAL_DEMO',
          'environment': 'development-sandbox',
          'database': 'PostgreSQL (Local Standalone Sandbox)',
          'timestamp': DateTime.now().toUtc().toIso8601String(),
        }));
      } else if (path.contains('home')) {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'pillars': [
            {
              'iconKey': 'public_rounded',
              'title': 'Indigenous Focus',
              'description':
                  'Sourcing and preserving native microbiomes adapted to specific regional ecosystems.'
            },
            {
              'iconKey': 'dataset_rounded',
              'title': 'Data-Centred',
              'description':
                  'Advanced bioinformatics pipeline for high-resolution strain characterization and predictive modeling.'
            },
            {
              'iconKey': 'biotech_rounded',
              'title': 'Evidence-Based',
              'description':
                  'Rigorous double-blind clinical and laboratory validation for every developed bioactive compound.'
            },
            {
              'iconKey': 'health_and_safety_rounded',
              'title': 'Gut Health Emphasis',
              'description':
                  'Targeting the microbiome-gut-brain axis for holistic systemic wellness and metabolic regulation.'
            },
            {
              'iconKey': 'layers_rounded',
              'title': 'Scalable Platform',
              'description':
                  'Modular solid-state & liquid fermentation processes designed for rapid industrial-scale manufacturing.'
            },
            {
              'iconKey': 'diversity_3_rounded',
              'title': 'Community Integration',
              'description':
                  'Partnering with local agricultural & forest populations for ethical, benefit-sharing bio-prospecting.'
            },
            {
              'iconKey': 'tune_rounded',
              'title': 'Customized Solutions',
              'description':
                  'Tailored consortia formulation engineered for specific food science and therapeutic partner requirements.'
            },
            {
              'iconKey': 'eco_rounded',
              'title': 'Ecologically Informed',
              'description':
                  'Ensuring all bio-interventions preserve microbiome equilibrium and natural environmental biodiversity.'
            }
          ],
          'executiveStats': [
            {
              'iconKey': 'military_tech_rounded',
              'title': '3+ Global Patents Filed',
              'subtitle': 'International IP Protection'
            },
            {
              'iconKey': 'account_tree_rounded',
              'title': '10-Step Proprietary Platform',
              'subtitle': 'End-to-end Strain Isolation'
            },
            {
              'iconKey': 'school_rounded',
              'title': '8+ PhD Academic Advisors',
              'subtitle': 'UC Irvine, Cambridge, Cornell'
            }
          ],
          'productVerticals': [
            {
              'title': 'Jinsei-Gut Pro',
              'strainId': 'Strain ID: L. rhamnosus JN-01',
              'description':
                  'Advanced digestive support matrix utilizing native flora extraction and gastro-resistant spore technology.'
            },
            {
              'title': 'FemmeFlora Bio-Shield',
              'strainId': 'Strain ID: L. crispatus JN-02',
              'description':
                  'Targeted microbiome balancing for specialized female wellness, vaginal tract stability, and immune homeostasis.'
            },
            {
              'title': 'MetaboliMet Probiotic',
              'strainId': 'Strain ID: L. plantarum JN-04',
              'description':
                  'Metabolic optimization complex developed from isolated indigenous cultures targeting lipid signaling pathways.'
            }
          ]
        }));
      } else if (path.contains('science')) {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'headerMetrics': [
            {
              'iconKey': 'science_rounded',
              'value': '10',
              'label': 'Pipeline Milestones',
              'accentColorHex': '#7BD4E2',
              'displayOrder': 1
            },
            {
              'iconKey': 'biotech_rounded',
              'value': '100%',
              'label': 'Sequence Coverage',
              'accentColorHex': '#66DD8B',
              'displayOrder': 2
            },
            {
              'iconKey': 'verified_rounded',
              'value': '3',
              'label': 'Global Patents Filed',
              'accentColorHex': '#7BD4E2',
              'displayOrder': 3
            }
          ],
          'clinicalQa': {
            'title': 'Clinical Validation & Standards',
            'description':
                'Full genome sequencing, in vitro & in vivo toxicological screening, and stability verification under ISO/GMP standards.',
            'badgeText': 'ISO 22000 & GMP Certified',
            'complianceStandard': 'DCGI & US-FDA Compliance Alignment'
          },
          'pipelineSteps': [
            {
              'stepNumber': 1,
              'title': 'Target Consumer Product Identification',
              'subtitle': 'Metagenomic Biomarker Mapping',
              'description':
                  'We begin by working with you to clearly define the target consumer product and its intended benefit. This provides immediate application to a market.',
              'category': 'discovery',
              'iconKey': 'search_rounded',
              'metricValue': '99.4%',
              'metricLabel': 'Target Precision',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_01.webp',
              'displayOrder': 1
            },
            {
              'stepNumber': 2,
              'title':
                  'Application-Specific Strain Identification & Characterization',
              'subtitle': 'Anaerobic Cultivation Protocol',
              'description':
                  'We partner with you to identify, screen and characterize indigenous strains, isolating their functional traits to your specific product requirements.',
              'category': 'discovery',
              'iconKey': 'biotech_rounded',
              'metricValue': '500+',
              'metricLabel': 'Strains Isolated',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_02.webp',
              'displayOrder': 2
            },
            {
              'stepNumber': 3,
              'title': 'Upstream & Downstream Optimization',
              'subtitle': 'Bioinformatics & Fermentation',
              'description':
                  'We optimize microbial fermentation conditions to ensure high biomass density and scalable yield while establishing post-fermentation stability.',
              'category': 'analytics',
              'iconKey': 'analytics_rounded',
              'metricValue': '100%',
              'metricLabel': 'Sequence Coverage',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_03.webp',
              'displayOrder': 3
            },
            {
              'stepNumber': 4,
              'title': 'Pro-Plant Scale Strain Development',
              'subtitle': 'In-Vitro Synergistic Modeling',
              'description':
                  'Our R&D team moves to a pro-plant scale strain development phase including robust strain optimization, scale-up feasibility and product performance testing.',
              'category': 'formulation',
              'iconKey': 'hub_rounded',
              'metricValue': '10M+',
              'metricLabel': 'Pairs Evaluated',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_04.webp',
              'displayOrder': 4
            },
            {
              'stepNumber': 5,
              'title': 'Formulation & Formats',
              'subtitle': 'Fermentation Optimization',
              'description':
                  'We optimize post-processing of candidate ingredients for full compatibility with specific matrix and packaging formats, maintaining a scale-viable workflow.',
              'category': 'formulation',
              'iconKey': 'precision_manufacturing_rounded',
              'metricValue': '10^11',
              'metricLabel': 'CFU/g Yield',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_05.webp',
              'displayOrder': 5
            },
            {
              'stepNumber': 6,
              'title': 'Product-Specific Bioactivity Systemization',
              'subtitle': 'In-Vivo Toxicity Studies',
              'description':
                  'We validate bioactivities and bioactivity data in rigorous clinical frameworks, generating rich numerical evidence to support specific claims.',
              'category': 'clinical',
              'iconKey': 'security_rounded',
              'metricValue': '0',
              'metricLabel': 'Adverse Events',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_06.webp',
              'displayOrder': 6
            },
            {
              'stepNumber': 7,
              'title': 'Scaling for Commercialization',
              'subtitle': 'Randomized Double-Blind Studies',
              'description':
                  'We seamlessly transfer the manufacturing process from pilot to commercial scale, guaranteeing consistent quality and performance for large-volume production.',
              'category': 'clinical',
              'iconKey': 'verified_rounded',
              'metricValue': '88%',
              'metricLabel': 'Efficacy Rate',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_07.webp',
              'displayOrder': 7
            },
            {
              'stepNumber': 8,
              'title': 'Shelf Life Stability & Field Trials',
              'subtitle': 'FDA & DCGI Compliance',
              'description':
                  'Our Formulations are engineered for robust shelf life with proven viability retention, supported by stability testing and real-world field trials.',
              'category': 'clinical',
              'iconKey': 'assignment_rounded',
              'metricValue': '3',
              'metricLabel': 'Patents Filed',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_08.webp',
              'displayOrder': 8
            },
            {
              'stepNumber': 9,
              'title': 'Regulatory Compliance',
              'subtitle': 'cGMP Freeze-Drying Facility',
              'description':
                  'We help navigate complex regulatory standards, ensuring compliance against international accreditation and validation of the final product.',
              'category': 'commercial',
              'iconKey': 'factory_rounded',
              'metricValue': '24 Mo.',
              'metricLabel': 'Shelf Stability',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_09.webp',
              'displayOrder': 9
            },
            {
              'stepNumber': 10,
              'title': 'Continuous Improvement of Strains & Process',
              'subtitle': 'B2B & B2C Distribution',
              'description':
                  'Through data-driven R&D iterations, we refine strains, formulations, and scale-up processes for continuous enhancement of product efficiency.',
              'category': 'commercial',
              'iconKey': 'local_shipping_rounded',
              'metricValue': '4',
              'metricLabel': 'Vertical Markets',
              'imageUrl':
                  'https://storage.googleapis.com/jinsei-bio-public-assets/science/step_10.webp',
              'displayOrder': 10
            }
          ]
        }));
      } else {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'status': 'OK',
          'path': path,
          'message': 'Jinsei Bio Redesign Serverpod Sandbox Live',
          'timestamp': DateTime.now().toUtc().toIso8601String(),
        }));
      }
      await response.close();
    });
  } catch (e) {
    print('⚠️ Port $port fallback binding skipped: $e');
  }
}
