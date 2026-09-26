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

      final path = request.uri.path.toLowerCase();
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
