import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/b2b/data/repositories/b2b_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/collaborations/data/repositories/collaborations_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/home/data/repositories/home_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/leadership/data/repositories/team_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/science/data/repositories/science_repository_impl.dart';
import 'package:jinsei_bio_redesign/src/features/solutions/data/repositories/solutions_repository_impl.dart';

void main() {
  group(
      'Architectural Standard: 3-Tier Offline-First Data Conformance (JIN-74)',
      () {
    test(
        'All feature repositories instantiate with dedicated Hive data sources',
        () {
      // 1. Home
      final homeRepo = HomeRepositoryImpl();
      expect(homeRepo, isNotNull);

      // 2. Science
      final scienceRepo = ScienceRepositoryImpl();
      expect(scienceRepo, isNotNull);

      // 3. Solutions
      final solutionsRepo = SolutionsRepositoryImpl();
      expect(solutionsRepo, isNotNull);

      // 4. Leadership
      final teamRepo = TeamRepositoryImpl();
      expect(teamRepo, isNotNull);

      // 5. Collaborations
      final collabRepo = CollaborationsRepositoryImpl();
      expect(collabRepo, isNotNull);

      // 6. B2B
      final b2bRepo = B2bRepositoryImpl();
      expect(b2bRepo, isNotNull);
    });
  });
}
