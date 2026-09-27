import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jinsei_bio_redesign/src/core/theme/theme_bloc.dart';

void main() {
  group('ThemeBloc QA Tests (Dark Mode Default per ADR-010)', () {
    late ThemeBloc themeBloc;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      themeBloc = ThemeBloc();
    });

    tearDown(() {
      themeBloc.close();
    });

    test('initial state must default to ThemeMode.dark per ADR-010', () {
      expect(themeBloc.state, equals(ThemeMode.dark));
    });

    test('ToggleThemeEvent switches state between Dark Mode and Light Mode',
        () async {
      themeBloc.add(const ToggleThemeEvent());

      await expectLater(
        themeBloc.stream,
        emits(ThemeMode.light),
      );

      themeBloc.add(const ToggleThemeEvent());

      await expectLater(
        themeBloc.stream,
        emits(ThemeMode.dark),
      );
    });

    test('SetThemeEvent explicitly updates theme mode', () async {
      themeBloc.add(const SetThemeEvent(ThemeMode.light));

      await expectLater(
        themeBloc.stream,
        emits(ThemeMode.light),
      );
    });
  });
}
