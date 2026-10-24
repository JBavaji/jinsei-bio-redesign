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

      String requestBody = '';
      if (request.method == 'POST') {
        try {
          requestBody = await utf8.decoder.bind(request).join();
        } catch (_) {}
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

      if (path.startsWith('/static/solutions/') && path.endsWith('.webp')) {
        final filename = path.split('/').last;
        final file = File('web/solutions/$filename');
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

      if (path.startsWith('/static/team/') && path.endsWith('.webp')) {
        final filename = path.split('/').last;
        final file = File('web/team/$filename');
        if (await file.exists()) {
          response.statusCode = HttpStatus.ok;
          response.headers.contentType = ContentType('image', 'webp');
          response.headers.set('Cache-Control', 'public, max-age=86400');
          response.headers.set('Access-Control-Allow-Origin', '*');
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
        if (request.method == 'POST') {
          response.write('"PONG"');
        } else {
          response.write(jsonEncode({
            'status': 'HEALTHY',
            'service': 'jinsei_bio_redesign_server',
            'version': VersionService.version,
            'appMode': 'UNOFFICIAL_DEMO',
            'environment': 'development-sandbox',
            'database': 'PostgreSQL (Local Standalone Sandbox)',
            'timestamp': DateTime.now().toUtc().toIso8601String(),
          }));
        }
      } else if (path.contains('home')) {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'pillars': [
            {
              'iconKey': 'public_rounded',
              'title': 'Indigenous Focus',
              'description':
                  'Sourcing and preserving native microbiomes adapted to specific regional ecosystems.',
              'displayOrder': 1,
            },
            {
              'iconKey': 'dataset_rounded',
              'title': 'Data-Centred',
              'description':
                  'Advanced bioinformatics pipeline for high-resolution strain characterization and predictive modeling.',
              'displayOrder': 2,
            },
            {
              'iconKey': 'biotech_rounded',
              'title': 'Evidence-Based',
              'description':
                  'Rigorous double-blind clinical and laboratory validation for every developed bioactive compound.',
              'displayOrder': 3,
            },
            {
              'iconKey': 'health_and_safety_rounded',
              'title': 'Gut Health Emphasis',
              'description':
                  'Targeting the microbiome-gut-brain axis for holistic systemic wellness and metabolic regulation.',
              'displayOrder': 4,
            },
            {
              'iconKey': 'layers_rounded',
              'title': 'Scalable Platform',
              'description':
                  'Modular solid-state & liquid fermentation processes designed for rapid industrial-scale manufacturing.',
              'displayOrder': 5,
            },
            {
              'iconKey': 'diversity_3_rounded',
              'title': 'Community Integration',
              'description':
                  'Partnering with local agricultural & forest populations for ethical, benefit-sharing bio-prospecting.',
              'displayOrder': 6,
            },
            {
              'iconKey': 'tune_rounded',
              'title': 'Customized Solutions',
              'description':
                  'Tailored consortia formulation engineered for specific food science and therapeutic partner requirements.',
              'displayOrder': 7,
            },
            {
              'iconKey': 'eco_rounded',
              'title': 'Ecologically Informed',
              'description':
                  'Ensuring all bio-interventions preserve microbiome equilibrium and natural environmental biodiversity.',
              'displayOrder': 8,
            }
          ],
          'executiveStats': [
            {
              'iconKey': 'military_tech_rounded',
              'title': '3+ Global Patents Filed',
              'subtitle': 'International IP Protection',
              'displayOrder': 1,
            },
            {
              'iconKey': 'account_tree_rounded',
              'title': '10-Step Proprietary Platform',
              'subtitle': 'End-to-end Strain Isolation',
              'displayOrder': 2,
            },
            {
              'iconKey': 'school_rounded',
              'title': '8+ PhD Academic Advisors',
              'subtitle': 'UC Irvine, Cambridge, Cornell',
              'displayOrder': 3,
            }
          ],
          'productVerticals': [
            {
              'title': 'Jinsei-Gut Pro',
              'strainId': 'Strain ID: L. rhamnosus JN-01',
              'description':
                  'Advanced digestive support matrix utilizing native flora extraction and gastro-resistant spore technology.',
              'displayOrder': 1,
            },
            {
              'title': 'FemmeFlora Bio-Shield',
              'strainId': 'Strain ID: L. crispatus JN-02',
              'description':
                  'Targeted microbiome balancing for specialized female wellness, vaginal tract stability, and immune homeostasis.',
              'displayOrder': 2,
            },
            {
              'title': 'MetaboliMet Probiotic',
              'strainId': 'Strain ID: L. plantarum JN-04',
              'description':
                  'Metabolic optimization complex developed from isolated indigenous cultures targeting lipid signaling pathways.',
              'displayOrder': 3,
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_01.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_02.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_03.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_04.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_05.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_06.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_07.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_08.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_09.webp',
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
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_10.webp',
              'displayOrder': 10
            }
          ]
        }));
      } else if (path.contains('solutions')) {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'metrics': [
            {
              'iconKey': 'hub_rounded',
              'value': '4',
              'label': 'Commercial Verticals',
              'accentColorHex': '#7BD4E2',
              'displayOrder': 1
            },
            {
              'iconKey': 'biotech_rounded',
              'value': '54+',
              'label': 'Bio-Formulations',
              'accentColorHex': '#66DD8B',
              'displayOrder': 2
            },
            {
              'iconKey': 'verified_rounded',
              'value': '100%',
              'label': 'Non-GMO Indigenous',
              'accentColorHex': '#7BD4E2',
              'displayOrder': 3
            }
          ],
          'qualityAssurance': {
            'title': 'Clinical & Commercial Quality Assurance',
            'description':
                'ISO 9001:2015 & GMP Certified Production Standards • Custom Strains & Blends',
            'badgeText': 'Pune NCL Innovation Park',
            'complianceStandard': 'Bio-Prospecting Ethics Compliant'
          },
          'solutions': [
            {
              'solutionId': 'human-health',
              'categoryTag': 'PRECISION WELLNESS',
              'title': 'Human Health: Precision Wellness',
              'subtitle': 'Targeted Micro-Flora Therapeutics',
              'description':
                  'Clinical-grade strain formulations targeting gut, vaginal, and metabolic micro-biomes with high-viability spore technology.',
              'iconKey': 'health_and_safety_rounded',
              'category': 'human-health',
              'formulationCount': '18 Formulations',
              'keyBenefit': 'Targeted Micro-Flora',
              'efficacyMetric': '88% Clinical Efficacy',
              'bulletPoints': [
                'Gastrointestinal Homeostasis: Targeted IBS, IBD, and gut-barrier integrity restore protocols.',
                'Urogenital Health: L. crispatus consortia for protective acidification and pathogen exclusion.',
                'Metabolic Signalling: Precision bile salt hydrolase activity regulating glucose & lipid absorption.'
              ],
              'actionCtaText': 'Explore Human Health Range',
              'caseStudyUrl':
                  'https://jinseibioscience.com/docs/human_health_clinical_trial.pdf',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_01_human_health.webp',
              'darkImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_01_human_health_dark.webp',
              'lightImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_01_human_health_light.webp',
              'displayOrder': 1
            },
            {
              'solutionId': 'food-tech',
              'categoryTag': 'CLEAN LABEL PROTECTION',
              'title': 'Food Tech & Clean Label Preservation',
              'subtitle': 'Bio-Protective Cultures',
              'description':
                  'Next-gen microbial bio-protective cultures replacing chemical preservatives naturally.',
              'iconKey': 'restaurant_rounded',
              'category': 'food-tech',
              'formulationCount': '12 Formulations',
              'keyBenefit': 'Clean Label Bio-Preservation',
              'efficacyMetric': '24 Mo. Shelf Extension',
              'bulletPoints': [
                'Shelf-Life Extension: Antimicrobial bacteriocins naturally suppress spoilage organisms.',
                'Clean Label Solutions: Eliminate artificial benzoates, sorbates, and nitrates.',
                'Fermentation Starters: Accelerated acidification with consistent organoleptic quality.'
              ],
              'actionCtaText': 'Explore Food Tech Range',
              'caseStudyUrl':
                  'https://jinseibioscience.com/docs/food_tech_clean_label_dossier.pdf',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_02_food_tech.webp',
              'darkImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_02_food_tech_dark.webp',
              'lightImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_02_food_tech_light.webp',
              'displayOrder': 2
            },
            {
              'solutionId': 'dermo-biotics',
              'categoryTag': 'CUTANEOUS BIOTICS',
              'title': 'Dermo-Biotics & Bio-Hygiene',
              'subtitle': 'Cutaneous Barrier Biotics',
              'description':
                  'Live-biome topical ferments and postbiotic solutions for barrier health and antimicrobial shielding.',
              'iconKey': 'face_3_rounded',
              'category': 'dermo-biotics',
              'formulationCount': '9 Formulations',
              'keyBenefit': 'Topical Barrier Health',
              'efficacyMetric': '+42% Ceramide Synthesis',
              'bulletPoints': [
                'Acne Pathogen Mitigation: Selective inhibition of C. acnes phylotypes without skin irritation.',
                'Barrier Lipid Synthesis: Upregulation of natural ceramide production by 42%.',
                'Probiotic Cleaning: Self-replenishing surface defenses for clinical bio-hygiene.'
              ],
              'actionCtaText': 'Explore Dermo-Biotics Range',
              'caseStudyUrl':
                  'https://jinseibioscience.com/docs/dermo_biotics_safety_study.pdf',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_03_dermo_biotics.webp',
              'darkImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_03_dermo_biotics_dark.webp',
              'lightImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_03_dermo_biotics_light.webp',
              'displayOrder': 3
            },
            {
              'solutionId': 'agri-tech',
              'categoryTag': 'REGENERATIVE AGRI',
              'title': 'Agri-Tech & Environmental Security',
              'subtitle': 'Bio-Inoculants & Remediation',
              'description':
                  'Specialized microbial consortia engineered to rejuvenate exhausted soil and accelerate remediation.',
              'iconKey': 'eco_rounded',
              'category': 'agri-tech',
              'formulationCount': '15 Formulations',
              'keyBenefit': 'Regenerative Soil Consortia',
              'efficacyMetric': '+35% Root Bio-Mass',
              'bulletPoints': [
                'Nitrogen Fixing & P-Solubilizing: Strains that unlock bound soil minerals for root uptake.',
                'Crop Immunity Priming: Triggering systemic acquired resistance (SAR) against blight.',
                'Effluent Bioremediation: High-efficiency degradation of industrial hydrocarbons.'
              ],
              'actionCtaText': 'Explore Agri-Tech Solutions',
              'caseStudyUrl':
                  'https://jinseibioscience.com/docs/agri_tech_field_trial.pdf',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_04_agri_tech.webp',
              'darkImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_04_agri_tech_dark.webp',
              'lightImageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/solutions/solution_04_agri_tech_light.webp',
              'displayOrder': 4
            }
          ]
        }));
      } else if (path.contains('leadership') || path.contains('team')) {
        response.statusCode = HttpStatus.ok;
        response.write(jsonEncode({
          'headerBadge': 'ONE TEAM, ONE VISION',
          'headline': 'Leadership & R&D Team',
          'subhead':
              'Pioneering microbiologists, computational biologists, and growth strategists translating indigenous human microbial isolates into validated therapeutic solutions.',
          'emblemTitle': 'JINSEI BIOSCIENCE',
          'emblemSubtitle': 'Translational Microbial Discovery Engine',
          'governanceAssurance': {
            'title': 'Scientific Governance & Ethics Assurance',
            'description':
                'ISO 9001:2015 & GMP Certified R&D Standards • Ethical Bio-Prospecting',
            'badgeText': 'Pune NCL Innovation Park',
            'complianceStandard': 'Bio-Prospecting Ethics Compliant'
          },
          'members': [
            {
              'memberId': 'dr-ria-deshpande',
              'name': 'Dr. Ria Deshpande, PhD',
              'role': 'Chief Executive Officer (CEO)',
              'categoryTag': 'EXECUTIVE LEAD',
              'category': 'executive',
              'academicCredential':
                  'PhD in Mathematical, Computational and Systems Biology from University of California, Irvine',
              'areaOfExpertise':
                  'Overseeing all aspects of business, finance, regulatory compliance, and daily operations.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_01_dr_ria_deshpande.webp',
              'displayOrder': 1
            },
            {
              'memberId': 'dr-asha-kembhavi',
              'name': 'Dr. Asha Kembhavi',
              'role': 'Chief Scientific Officer (CSO)',
              'categoryTag': 'SCIENTIFIC LEADERSHIP',
              'category': 'executive',
              'academicCredential':
                  'PhD in Applied Biology from Cambridge University',
              'areaOfExpertise':
                  'Overseeing all aspects of R&D operations and long-term scientific strategy.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_02_dr_asha_kembhavi.webp',
              'displayOrder': 2
            },
            {
              'memberId': 'dr-kirankumar-beede',
              'name': 'Dr. Kirankumar Beede',
              'role': 'Principal Scientist',
              'categoryTag': 'PRINCIPAL SCIENTIST',
              'category': 'scientific',
              'academicCredential': 'PhD in Biochemistry',
              'areaOfExpertise':
                  'Characterization, upstream and downstream optimization, pre-pilot development, formulations, bioactivity optimization, scaling for commercialization.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_03_dr_kirankumar_beede.webp',
              'displayOrder': 3
            },
            {
              'memberId': 'nandita-bal',
              'name': 'Nandita Bal',
              'role': 'Scientist & Growth Strategist',
              'categoryTag': 'GROWTH & REGULATORY',
              'category': 'product',
              'academicCredential':
                  'Master\'s in Biomedical Engg (Cornell University) & Master\'s in Chemical Engg (Northeastern University)',
              'areaOfExpertise':
                  'Target consumer product identification, regulatory compliance, IP strategy, business development and finance.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_04_nandita_bal.webp',
              'displayOrder': 4
            },
            {
              'memberId': 'rucha-karkamkar',
              'name': 'Rucha Karkamkar',
              'role': 'Scientist & Product Manager',
              'categoryTag': 'PRODUCT MANAGEMENT',
              'category': 'product',
              'academicCredential':
                  'Master\'s in Biotechnology (Pune University)',
              'areaOfExpertise':
                  'Characterization, product development, formulation and formats, shelf life and stability, scaling for commercialization.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_05_rucha_karkamkar.webp',
              'displayOrder': 5
            },
            {
              'memberId': 'sudharani-beede',
              'name': 'Sudharani Beede',
              'role': 'Lab Manager',
              'categoryTag': 'OPERATIONS & LAB',
              'category': 'operations',
              'academicCredential': 'B.Sc (CBZ) and MBA (Karnataka)',
              'areaOfExpertise':
                  'Lab inventory management, vendor relationships, procurement management.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_06_sudharani_beede.webp',
              'displayOrder': 6
            },
            {
              'memberId': 'harshal-kelkar',
              'name': 'Harshal Kelkar',
              'role': 'Associate Scientist',
              'categoryTag': 'UPSTREAM OPTIMIZATION',
              'category': 'scientific',
              'academicCredential': 'M.Sc. Biotechnology (Lund University)',
              'areaOfExpertise':
                  'Upstream optimization, strain characterization.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_07_harshal_kelkar.webp',
              'displayOrder': 7
            },
            {
              'memberId': 'saloni-koul',
              'name': 'Saloni Koul',
              'role': 'Associate Scientist',
              'categoryTag': 'BIO-FUNCTIONAL ASSAYS',
              'category': 'scientific',
              'academicCredential':
                  'Integrated Master of Science (M.Sc.) in Biotechnology (IBB, SPPU)',
              'areaOfExpertise':
                  'Strain characterization, assay development, application studies.',
              'imageUrl':
                  'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/team/member_08_saloni_koul.webp',
              'displayOrder': 8
            }
          ]
        }));
      } else if (path.contains('collaborations')) {
        response.statusCode = HttpStatus.ok;
        final isSubmit = requestBody.contains('submitCollaborationInquiry') ||
            request.uri.queryParameters['method'] ==
                'submitCollaborationInquiry';
        if (isSubmit) {
          final trackingId =
              'JIN-COL-2026-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
          response.write(jsonEncode(trackingId));
        } else {
          response.write(jsonEncode({
            'headlineBadge': 'STRATEGIC ALLIANCES & CRO SERVICES',
            'heroTitle': 'LOOKING TO COLLABORATE WITH US?',
            'heroSubtitle':
                'Partnering with FMCG leaders, bio-pharma enterprises, and academic institutions to co-develop, optimize, and commercialize validated indigenous strain formulations.',
            'tracks': [
              {
                'trackId': 'fmcg_integration',
                'title': '1. FMCG Integration',
                'badge': 'Pillar 1',
                'description':
                    'Include indigenous strains for fermentation, biopreservation, functional foods, or probiotic enrichment.',
                'deliverables': [
                  'Fermentation optimization',
                  'Biopreservation dossiers',
                  'Probiotic enrichment',
                ],
                'iconKey': 'sanitizer',
              },
              {
                'trackId': 'lab_cro',
                'title': '2. LAB CRO Services',
                'badge': 'Pillar 2',
                'description':
                    'Process development, yield optimization, and contract research for lactic acid bacteria strains.',
                'deliverables': [
                  'Yield enhancement',
                  'Pilot bioreactor runs',
                  'Phenotypic screening',
                ],
                'iconKey': 'science',
              },
              {
                'trackId': 'co_development',
                'title': '3. Co-Development',
                'badge': 'Pillar 3',
                'description':
                    'Joint R&D with enterprises or academic pioneers to build healthier microbial applications.',
                'deliverables': [
                  'Joint IP development',
                  'Clinical protocol design',
                  'Multi-strain consortiums',
                ],
                'iconKey': 'biotech',
              },
            ],
            'contactInfo': {
              'supportEmail': 'info@jinseibio.com',
              'supportNotice':
                  'Guaranteed response within 24 business hours from our R&D secretariat.',
              'facilityName': 'State-of-the-art incubation campus',
              'facilityAddress':
                  'NCL Innovation Park, Doctor Homi Bhabha Road, Ward No. 8, NCL Colony, Pashan, Pune, Maharashtra, India',
              'facilityCoordinates': '18.5362° N, 73.8152° E',
              'visitingTimings':
                  'Monday - Saturday: By Appointment | Sunday: Closed',
              'visitingStatus': 'By Appointment',
              'standards': [
                {
                  'title': 'ISO 9001:2015',
                  'description':
                      'Quality Management Systems for Laboratory R&D',
                  'badge': 'Certified',
                },
                {
                  'title': 'GMP Certified',
                  'description':
                      'Good Manufacturing Practices for Probiotic Formulations',
                  'badge': 'Certified',
                },
                {
                  'title': 'FSSAI Compliant',
                  'description':
                      'Food Safety and Standards Authority of India Standards',
                  'badge': 'Compliant',
                },
                {
                  'title': 'Bio-Prospecting Ethics',
                  'description':
                      'Adherence to National Biodiversity Authority Protocols',
                  'badge': 'Compliant',
                },
              ],
            },
            'governanceTitle': 'Scientific Governance & Ethics Assurance',
            'governanceDescription':
                'ISO 9001:2015 & GMP Certified R&D Standards • Ethical Bio-Prospecting',
          }));
        }
      } else if (path.contains('b2b')) {
        response.statusCode = HttpStatus.ok;
        final isSubmit = requestBody.contains('submitSampleRequest') ||
            request.uri.queryParameters['method'] == 'submitSampleRequest';
        if (isSubmit) {
          final trackingId =
              'JIN-REQ-2026-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
          response.write(jsonEncode(trackingId));
        } else {
          response.write(jsonEncode({
            'badgeText': 'COMMERCIAL FORMULATION & ISOLATE SAMPLING',
            'title': 'Request B2B Formulation Sample',
            'subtitle':
                'Order certified research-grade batches of proprietary indigenous Lactobacillus isolates. Formulated for pharmaceutical trial pipelines and FMCG product developers.',
            'strains': [
              {
                'strainId': 'gut_pro',
                'category': 'HUMAN HEALTH',
                'name': 'Jinsei-Gut Pro',
                'strainCode': 'L. plantarum JN-04',
                'highlight': 'Epithelial adhesion >94%',
                'defaultFormat': 'lyophilized_powder',
                'displayOrder': 1,
              },
              {
                'strainId': 'femme_flora',
                'category': "WOMEN'S FLORA",
                'name': 'FemmeFlora Bio-Shield',
                'strainCode': 'L. crispatus FF-02',
                'highlight': 'Microflora pH regulation',
                'defaultFormat': 'lyophilized_powder',
                'displayOrder': 2,
              },
              {
                'strainId': 'metabolimet',
                'category': 'METABOLIC AXIS',
                'name': 'MetaboliMet Probiotic',
                'strainCode': 'L. gasseri JN-08',
                'highlight': 'SCFA signalling pathways',
                'defaultFormat': 'lyophilized_powder',
                'displayOrder': 3,
              },
              {
                'strainId': 'custom_cro',
                'category': 'CUSTOM ISOLATE',
                'name': 'Custom LAB Isolate',
                'strainCode': 'CRO Co-Development',
                'highlight': 'Screened native library',
                'defaultFormat': 'slurry_concentrate',
                'displayOrder': 4,
              },
            ],
            'formulationFormats': [
              {
                'formatId': 'lyophilized_powder',
                'label': 'Lyophilized Bulk Powder (100 Billion CFU/g)',
                'displayOrder': 1,
              },
              {
                'formatId': 'microencapsulated',
                'label': 'Micro-Encapsulated Enteric Pellets',
                'displayOrder': 2,
              },
              {
                'formatId': 'slurry_concentrate',
                'label': 'Active Ferment Slurry (Cold-Chain)',
                'displayOrder': 3,
              },
              {
                'formatId': 'oral_sachet',
                'label': 'Pre-formulated Sachet Prototypes (2g)',
                'displayOrder': 4,
              },
            ],
            'complianceNote':
                'Includes Certificate of Analysis (CoA), Whole Genome Sequence (WGS) report & Material Safety Data Sheet.',
            'certifications': [
              'ISO 9001:2015',
              'GMP Certified',
            ],
            'dispatchNotice':
                'Protected by scientific NDA. Dispatched from Pune NCL Innovation Park within 48h.',
          }));
        }
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
