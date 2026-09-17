import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages active ThemeMode (Dark default vs Light) with persistent user preference
class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = 'user_theme_mode';

  ThemeCubit() : super(ThemeMode.dark) {
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
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

  Future<void> toggleTheme() async {
    final nextMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(nextMode);
    await _saveThemeToPrefs(nextMode);
  }

  Future<void> setTheme(ThemeMode mode) async {
    emit(mode);
    await _saveThemeToPrefs(mode);
  }

  Future<void> _saveThemeToPrefs(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          _themeKey, mode == ThemeMode.light ? 'light' : 'dark');
    } catch (_) {}
  }
}
