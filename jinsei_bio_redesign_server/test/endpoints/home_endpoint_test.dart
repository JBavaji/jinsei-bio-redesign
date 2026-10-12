import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/home_endpoint.dart';

import '../helpers/mock_session.dart';

void main() {
  group('HomeEndpoint Unit Tests', () {
    late HomeEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = HomeEndpoint();
      session = MockSession();
    });

    test(
        'getHomeContent returns default pillars, stats, and verticals when DB is offline',
        () async {
      final content = await endpoint.getHomeContent(session);

      // Verify Pillars
      expect(content.pillars.length, equals(8));
      expect(content.pillars[0].title, equals('Indigenous Focus'));
      expect(content.pillars[0].iconKey, equals('public_rounded'));
      expect(content.pillars[0].displayOrder, equals(1));

      expect(content.pillars[7].title, equals('Ecologically Informed'));
      expect(content.pillars[7].iconKey, equals('eco_rounded'));
      expect(content.pillars[7].displayOrder, equals(8));

      // Verify Executive Stats
      expect(content.executiveStats.length, equals(3));
      expect(
          content.executiveStats[0].title, equals('3+ Global Patents Filed'));
      expect(content.executiveStats[1].title,
          equals('10-Step Proprietary Platform'));
      expect(
          content.executiveStats[2].title, equals('8+ PhD Academic Advisors'));

      // Verify Product Verticals
      expect(content.productVerticals.length, equals(3));
      expect(content.productVerticals[0].title, equals('Jinsei-Gut Pro'));
      expect(
          content.productVerticals[0].strainId, contains('L. rhamnosus JN-01'));
      expect(
          content.productVerticals[1].title, equals('FemmeFlora Bio-Shield'));
      expect(
          content.productVerticals[2].title, equals('MetaboliMet Probiotic'));
    });
  });
}
