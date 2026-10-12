import 'dart:convert';

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
    });

    test('GET /home returns pillars, stats, and verticals', () async {
      final response =
          await http.get(Uri.parse('http://localhost:$testPort/home'));
      expect(response.statusCode, equals(200));

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      expect(data['pillars'], isList);
      expect((data['pillars'] as List).length, equals(8));
      expect(data['executiveStats'], isList);
      expect(data['productVerticals'], isList);
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
  });
}
