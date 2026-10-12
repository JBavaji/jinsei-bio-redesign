import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jinsei_bio_redesign_server/src/server/standalone_sandbox_server.dart';
import 'package:test/test.dart';

void main() {
  group('Standalone Sandbox Server Tests (JIN-59)', () {
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
