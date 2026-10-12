import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/home_endpoint.dart';
import 'package:jinsei_bio_redesign_server/src/generated/protocol.dart';

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
      for (var i = 0; i < 8; i++) {
        final pillar = content.pillars[i];
        expect(pillar.title, isNotEmpty);
        expect(pillar.description, isNotEmpty);
        expect(pillar.iconKey, isNotEmpty);
        expect(pillar.displayOrder, equals(i + 1));
      }

      expect(content.pillars[0].title, equals('Indigenous Focus'));
      expect(content.pillars[0].iconKey, equals('public_rounded'));
      expect(content.pillars[7].title, equals('Ecologically Informed'));
      expect(content.pillars[7].iconKey, equals('eco_rounded'));

      // Verify Executive Stats
      expect(content.executiveStats.length, equals(3));
      expect(
          content.executiveStats[0].title, equals('3+ Global Patents Filed'));
      expect(content.executiveStats[0].subtitle,
          equals('International IP Protection'));
      expect(content.executiveStats[1].title,
          equals('10-Step Proprietary Platform'));
      expect(content.executiveStats[1].subtitle,
          equals('End-to-end Strain Isolation'));
      expect(
          content.executiveStats[2].title, equals('8+ PhD Academic Advisors'));
      expect(content.executiveStats[2].subtitle,
          equals('UC Irvine, Cambridge, Cornell'));

      // Verify Product Verticals
      expect(content.productVerticals.length, equals(3));
      expect(content.productVerticals[0].title, equals('Jinsei-Gut Pro'));
      expect(
          content.productVerticals[0].strainId, contains('L. rhamnosus JN-01'));
      expect(content.productVerticals[0].description, isNotEmpty);

      expect(
          content.productVerticals[1].title, equals('FemmeFlora Bio-Shield'));
      expect(
          content.productVerticals[1].strainId, contains('L. crispatus JN-02'));
      expect(content.productVerticals[1].description, isNotEmpty);

      expect(
          content.productVerticals[2].title, equals('MetaboliMet Probiotic'));
      expect(
          content.productVerticals[2].strainId, contains('L. plantarum JN-04'));
      expect(content.productVerticals[2].description, isNotEmpty);
    });

    test('Pillar CRUD operations throw on unconfigured database session',
        () async {
      final testPillar = PillarItem(
        iconKey: 'test_icon',
        title: 'Test Pillar',
        description: 'Test description',
        displayOrder: 99,
      );

      expect(
        () => endpoint.createPillar(session, testPillar),
        throwsA(anything),
      );
      expect(
        () => endpoint.updatePillar(session, testPillar),
        throwsA(anything),
      );
      expect(
        () => endpoint.deletePillar(session, 1),
        throwsA(anything),
      );
    });

    test('ExecutiveStat CRUD operations throw on unconfigured database session',
        () async {
      final testStat = ExecutiveStat(
        iconKey: 'test_icon',
        title: 'Test Stat',
        subtitle: 'Test Subtitle',
        displayOrder: 99,
      );

      expect(
        () => endpoint.createExecutiveStat(session, testStat),
        throwsA(anything),
      );
      expect(
        () => endpoint.updateExecutiveStat(session, testStat),
        throwsA(anything),
      );
      expect(
        () => endpoint.deleteExecutiveStat(session, 1),
        throwsA(anything),
      );
    });

    test(
        'ProductVertical CRUD operations throw on unconfigured database session',
        () async {
      final testVertical = ProductVertical(
        title: 'Test Vertical',
        strainId: 'Strain Test',
        description: 'Test Description',
        displayOrder: 99,
      );

      expect(
        () => endpoint.createProductVertical(session, testVertical),
        throwsA(anything),
      );
      expect(
        () => endpoint.updateProductVertical(session, testVertical),
        throwsA(anything),
      );
      expect(
        () => endpoint.deleteProductVertical(session, 1),
        throwsA(anything),
      );
    });
  });
}
