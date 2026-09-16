import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Brand Primary & Accent
  static const Color bioluminescentGreen = Color(0xFF66DD8B);
  static const Color emeraldGreen = Color(0xFF10B981);

  // Dark Mode Tokens (Default)
  static const Color darkObsidianBg = Color(0xFF0A0F1E);
  static const Color darkSurfaceCard = Color(0xFF111827);
  static const Color darkBorder = Color(0xFF1F2937);
  static const Color darkTextPrimary = Color(0xFFF9FAFB);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);

  // Light Mode Tokens
  static const Color lightBg = Color(0xFFFFFFFF);
  static const Color lightSurfaceCard = Color(0xFFF8FAFC);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkObsidianBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.bioluminescentGreen,
        secondary: AppColors.emeraldGreen,
        surface: AppColors.darkSurfaceCard,
        background: AppColors.darkObsidianBg,
        onPrimary: Colors.black,
        onSurface: AppColors.darkTextPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: TextStyle(
          color: AppColors.darkTextPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
        bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurfaceCard,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.darkBorder),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.emeraldGreen,
        secondary: AppColors.bioluminescentGreen,
        surface: AppColors.lightSurfaceCard,
        background: AppColors.lightBg,
        onPrimary: Colors.white,
        onSurface: AppColors.lightTextPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
        displayLarge: TextStyle(
          color: AppColors.lightTextPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
        bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurfaceCard,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.lightBorder),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
