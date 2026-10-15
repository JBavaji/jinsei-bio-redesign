import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:jinsei_bio_redesign_server/src/endpoints/team_endpoint.dart';

import '../helpers/mock_session.dart';

void main() {
  group('TeamEndpoint Unit Tests (JIN-20)', () {
    late TeamEndpoint endpoint;
    late Session session;

    setUp(() {
      endpoint = TeamEndpoint();
      session = MockSession();
    });

    test('getLeadershipContent returns 8 members, headers, and QA spec',
        () async {
      final content = await endpoint.getLeadershipContent(session);

      expect(content.members.length, equals(8));
      expect(content.headerBadge, equals('ONE TEAM, ONE VISION'));
      expect(content.headline, equals('Leadership & R&D Team'));
      expect(content.emblemTitle, equals('JINSEI BIOSCIENCE'));
      expect(content.governanceAssurance, isNotNull);

      // Verify CEO
      expect(content.members[0].memberId, equals('dr-ria-deshpande'));
      expect(content.members[0].name, equals('Dr. Ria Deshpande, PhD'));
      expect(content.members[0].role, equals('Chief Executive Officer (CEO)'));
      expect(content.members[0].category, equals('executive'));
      expect(content.members[0].categoryTag, equals('EXECUTIVE LEAD'));

      // Verify CSO
      expect(content.members[1].memberId, equals('dr-asha-kembhavi'));
      expect(content.members[1].name, equals('Dr. Asha Kembhavi'));
      expect(content.members[1].role, equals('Chief Scientific Officer (CSO)'));
      expect(content.members[1].category, equals('executive'));

      // Verify Scientists & Product Managers
      expect(content.members[2].name, equals('Dr. Kirankumar Beede'));
      expect(content.members[3].name, equals('Nandita Bal'));
      expect(content.members[4].name, equals('Rucha Karkamkar'));
      expect(content.members[5].name, equals('Sudharani Beede'));
      expect(content.members[6].name, equals('Harshal Kelkar'));
      expect(content.members[7].name, equals('Saloni Koul'));
    });

    test('getTeamMembers returns 8 members in display order', () async {
      final members = await endpoint.getTeamMembers(session);
      expect(members.length, equals(8));
      for (int i = 0; i < members.length; i++) {
        expect(members[i].displayOrder, equals(i + 1));
      }
    });

    test('getTeamMembersByCategory filters correctly by category', () async {
      final executive =
          await endpoint.getTeamMembersByCategory(session, 'executive');
      expect(executive.length, equals(2));
      expect(executive.map((m) => m.name),
          containsAll(['Dr. Ria Deshpande, PhD', 'Dr. Asha Kembhavi']));

      final scientific =
          await endpoint.getTeamMembersByCategory(session, 'scientific');
      expect(scientific.length, equals(3));
      expect(
          scientific.map((m) => m.name),
          containsAll([
            'Dr. Kirankumar Beede',
            'Harshal Kelkar',
            'Saloni Koul',
          ]));

      final product =
          await endpoint.getTeamMembersByCategory(session, 'product');
      expect(product.length, equals(2));
      expect(product.map((m) => m.name),
          containsAll(['Nandita Bal', 'Rucha Karkamkar']));

      final operations =
          await endpoint.getTeamMembersByCategory(session, 'operations');
      expect(operations.length, equals(1));
      expect(operations[0].name, equals('Sudharani Beede'));

      final nonExistent =
          await endpoint.getTeamMembersByCategory(session, 'unknown');
      expect(nonExistent, isEmpty);
    });
  });
}
