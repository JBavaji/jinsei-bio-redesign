import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jinsei_bio_redesign_server/src/server/standalone_sandbox_server.dart';
import 'package:test/test.dart';

void main() {
  group('Standalone Sandbox Server Tests (JIN-59 & JIN-67)', () {
    const testPort = 8899;

    setUpAll(() async {
      await startStandaloneLocalServer(testPort);
    });

    test('GET /health returns healthy status payload', () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/health'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['status'], equals('HEALTHY'));
      expect(data['appMode'], equals('UNOFFICIAL_DEMO'));
      expect(data['service'], equals('jinsei_bio_redesign_server'));
    });

    test('GET /home returns pillars, stats, and verticals', () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/home'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['pillars'], isList);
      expect((data['pillars'] as List).length, equals(8));
      expect(data['executiveStats'], isList);
      expect((data['executiveStats'] as List).length, equals(3));
      expect(data['productVerticals'], isList);
      expect((data['productVerticals'] as List).length, equals(3));
    });

    test('GET /science returns headerMetrics, pipelineSteps, and clinicalQa',
        () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/science'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['headerMetrics'], isList);
      expect((data['headerMetrics'] as List).length, equals(3));

      expect(data['pipelineSteps'], isList);
      expect((data['pipelineSteps'] as List).length, equals(10));

      final firstStep = (data['pipelineSteps'] as List).first;
      expect(
          firstStep['imageUrl'],
          contains(
              'https://cdn.jsdelivr.net/gh/JBavaji/jinsei-bio-redesign@develop/jinsei_bio_redesign_server/web/science/step_01.webp'));

      expect(data['clinicalQa'], isMap);
      expect((data['clinicalQa'] as Map)['badgeText'],
          equals('ISO 22000 & GMP Certified'));
    });

    test('GET /api/science returns unified routing science payload', () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/api/science'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['pipelineSteps'], isList);
      expect((data['pipelineSteps'] as List).length, equals(10));
    });

    test('GET /static/science/step_01.webp serves static WebP image', () async {
      final response = await http.get(
          Uri.parse('http://localhost:$testPort/static/science/step_01.webp'));
      expect(response.statusCode, equals(200));
      expect(response.headers['content-type'], contains('image/webp'));
      expect(response.bodyBytes.length, greaterThan(1000));
    });

    test(
        'GET /solutions returns metrics, 4 commercial solutions with image URLs',
        () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/solutions'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['metrics'], isList);
      expect(data['solutions'], isList);
      expect((data['solutions'] as List).length, equals(4));

      final firstSolution = (data['solutions'] as List).first;
      expect(firstSolution['solutionId'], equals('human-health'));
      expect(
          firstSolution['imageUrl'], contains('solution_01_human_health.webp'));
      expect(firstSolution['darkImageUrl'],
          contains('solution_01_human_health_dark.webp'));
      expect(firstSolution['lightImageUrl'],
          contains('solution_01_human_health_light.webp'));
    });

    test(
        'GET /static/solutions/solution_01_human_health.webp serves static WebP image',
        () async {
      final response = await http.get(Uri.parse(
          'http://localhost:$testPort/static/solutions/solution_01_human_health.webp'));
      expect(response.statusCode, equals(200));
      expect(response.headers['content-type'], contains('image/webp'));
      expect(response.bodyBytes.length, greaterThan(1000));
    });

    test('GET /leadership returns 8 members, headers, and emblem metadata',
        () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/leadership'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['headerBadge'], equals('ONE TEAM, ONE VISION'));
      expect(data['headline'], equals('Leadership & R&D Team'));
      expect(data['members'], isList);
      expect((data['members'] as List).length, equals(8));

      final firstMember = (data['members'] as List).first;
      expect(firstMember['memberId'], equals('dr-ria-deshpande'));
      expect(firstMember['name'], equals('Dr. Ria Deshpande, PhD'));
      expect(firstMember['role'], contains('Chief Executive Officer'));
      expect(
          firstMember['imageUrl'], contains('member_01_dr_ria_deshpande.webp'));
    });

    test(
        'GET /static/team/member_01_dr_ria_deshpande.webp serves static WebP image',
        () async {
      final response = await http.get(Uri.parse(
          'http://localhost:$testPort/static/team/member_01_dr_ria_deshpande.webp'));
      expect(response.statusCode, equals(200));
      expect(response.headers['content-type'], contains('image/webp'));
      expect(response.bodyBytes.length, greaterThan(1000));
    });

    test('OPTIONS request returns CORS 200 with OWASP security headers',
        () async {
      final client = HttpClient();
      final request = await client.openUrl(
          'OPTIONS', Uri.parse('http://localhost:$testPort/home'));
      final response = await request.close();

      expect(response.statusCode, equals(200));
      expect(
          response.headers.value('Access-Control-Allow-Origin'), equals('*'));
      expect(
          response.headers.value('X-Content-Type-Options'), equals('nosniff'));
      expect(response.headers.value('X-Frame-Options'), equals('DENY'));
      client.close();
    });

    test('GET /collaborations returns headline, tracks, and contactInfo',
        () async {
      final response = await http
          .get(Uri.parse('http://localhost:$testPort/collaborations'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(
          data['headlineBadge'], equals('STRATEGIC ALLIANCES & CRO SERVICES'));
      expect(data['tracks'], isList);
      expect((data['tracks'] as List).length, equals(3));
      expect(data['contactInfo'], isMap);
      expect((data['contactInfo'] as Map)['standards'], isList);
    });

    test(
        'POST /collaborations with submitCollaborationInquiry returns generated tracking ID',
        () async {
      final response = await http.post(
        Uri.parse('http://localhost:$testPort/collaborations'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'method': 'submitCollaborationInquiry',
          'name': 'Dr. Test Partner',
          'email': 'partner@sandbox.com',
          'partnershipTrack': 'fmcg_integration',
          'message': 'Sandbox integration test',
        }),
      );
      expect(response.statusCode, equals(200));
      final trackingId = jsonDecode(response.body) as String;
      expect(trackingId, startsWith('JIN-COL-2026-'));
    });

    test('GET /b2b returns badgeText, strains, and formulationFormats',
        () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/b2b'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['badgeText'],
          equals('COMMERCIAL FORMULATION & ISOLATE SAMPLING'));
      expect(data['strains'], isList);
      expect((data['strains'] as List).length, equals(4));
      expect(data['formulationFormats'], isList);
      expect((data['formulationFormats'] as List).length, equals(4));
    });

    test('POST /b2b with submitSampleRequest returns generated tracking ID',
        () async {
      final response = await http.post(
        Uri.parse('http://localhost:$testPort/b2b'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'method': 'submitSampleRequest',
          'fullName': 'Dr. Pharma Researcher',
          'email': 'researcher@sandbox.com',
          'company': 'Sandbox Pharma',
          'strainId': 'gut_pro',
          'formulationFormat': 'lyophilized_powder',
        }),
      );
      expect(response.statusCode, equals(200));
      final trackingId = jsonDecode(response.body) as String;
      expect(trackingId, startsWith('JIN-REQ-2026-'));
    });

    test('GET unrecognized path returns fallback OK status payload', () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/unknown/route'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['status'], equals('OK'));
      expect(data['message'], contains('Serverpod Sandbox Live'));
    });
  });
}
