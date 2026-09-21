import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/data/models/nav_item_model.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_event.dart';
import 'package:jinsei_bio_redesign/src/features/navigation/presentation/bloc/navigation_state.dart';

void main() {
  group('NavigationBloc Tests', () {
    late NavigationBloc navigationBloc;

    setUp(() {
      navigationBloc = NavigationBloc();
    });

    tearDown(() {
      navigationBloc.close();
    });

    test('initial state has root activeRoute and empty items', () {
      expect(navigationBloc.state.activeRoute, '/');
      expect(navigationBloc.state.items, isEmpty);
    });

    test(
        'LoadNavigationItemsEvent emits NavigationLoaded with fallback or JSON items',
        () async {
      navigationBloc.add(const LoadNavigationItemsEvent());
      await expectLater(
        navigationBloc.stream,
        emitsInOrder([
          isA<NavigationLoading>(),
          isA<NavigationLoaded>(),
        ]),
      );
      expect(navigationBloc.state.items, isNotEmpty);
    });

    test('SelectNavItemEvent updates activeRoute', () async {
      navigationBloc.add(const SelectNavItemEvent('/science'));
      await expectLater(
        navigationBloc.stream,
        emits(
          isA<NavigationLoaded>()
              .having((s) => s.activeRoute, 'activeRoute', '/science'),
        ),
      );
    });

    test('SyncActiveRouteEvent updates route if changed', () async {
      navigationBloc.add(const SyncActiveRouteEvent('/solutions'));
      await expectLater(
        navigationBloc.stream,
        emits(
          isA<NavigationLoaded>()
              .having((s) => s.activeRoute, 'activeRoute', '/solutions'),
        ),
      );
    });
  });

  group('NavItemModel Tests', () {
    test('NavItemModel parses JSON correctly', () {
      final json = {
        'id': 'science',
        'title': 'SCIENCE & TECH',
        'route': '/science',
        'iconKey': 'biotech_rounded',
        'isDesktopVisible': true,
        'isMobileVisible': true,
      };

      final model = NavItemModel.fromJson(json);
      expect(model.id, 'science');
      expect(model.title, 'SCIENCE & TECH');
      expect(model.route, '/science');
      expect(model.iconKey, 'biotech_rounded');
      expect(model.isDesktopVisible, isTrue);
      expect(model.isMobileVisible, isTrue);
    });
  });
}
