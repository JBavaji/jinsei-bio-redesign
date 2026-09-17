import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';

export 'theme_event.dart';

/// Manages active ThemeMode (Dark default vs Light) via Event-Driven Bloc (ADR-005)
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  static const String _themeKey = 'user_theme_mode';

  ThemeBloc() : super(ThemeMode.dark) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<ToggleThemeEvent>(_onToggleTheme);
    on<SetThemeEvent>(_onSetTheme);

    add(const LoadThemeEvent());
  }

  Future<void> _onLoadTheme(
    LoadThemeEvent event,
    Emitter<ThemeMode> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getString(_themeKey);
      if (savedTheme == 'light') {
        emit(ThemeMode.light);
      } else if (savedTheme == 'dark') {
        emit(ThemeMode.dark);
      }
    } catch (_) {}
  }

  Future<void> _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<ThemeMode> emit,
  ) async {
    final nextMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(nextMode);
    await _saveThemeToPrefs(nextMode);
  }

  Future<void> _onSetTheme(
    SetThemeEvent event,
    Emitter<ThemeMode> emit,
  ) async {
    emit(event.mode);
    await _saveThemeToPrefs(event.mode);
  }

  Future<void> _saveThemeToPrefs(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _themeKey,
        mode == ThemeMode.light ? 'light' : 'dark',
      );
    } catch (_) {}
  }
}
