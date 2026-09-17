import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary & Accent Brand Tokens from Stitch Project 436455633155776431
  static const Color primaryTeal =
      Color(0xFF7BD4E2); // Deep Science Primary Teal
  static const Color primaryContainerTeal =
      Color(0xFF0F7D8A); // Deep Teal Container
  static const Color bioluminescentGreen =
      Color(0xFF66DD8B); // Secondary Bioluminescent Green
  static const Color secondaryContainerGreen =
      Color(0xFF25A55A); // Secondary Green Container
  static const Color emeraldGreen = Color(0xFF50C878); // Override Emerald Green

  // Dark Mode Tokens (Stitch Theme Mode: DARK #121414)
  static const Color darkObsidianBg = Color(0xFF121414);
  static const Color darkSurfaceCard = Color(0xFF1E2020);
  static const Color darkSurfaceHigh = Color(0xFF282A2B);
  static const Color darkBorder = Color(0xFF3E494A);
  static const Color darkTextPrimary = Color(0xFFE2E2E2);
  static const Color darkTextSecondary = Color(0xFFBDC8CA);

  // Light Mode Tokens (Clinical White #FFFFFF)
  static const Color lightBg = Color(0xFFFFFFFF);
  static const Color lightSurfaceCard = Color(0xFFF8FAFC);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF121414);
  static const Color lightTextSecondary = Color(0xFF475569);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkObsidianBg,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryTeal,
        primaryContainer: AppColors.primaryContainerTeal,
        secondary: AppColors.bioluminescentGreen,
        secondaryContainer: AppColors.secondaryContainerGreen,
        surface: AppColors.darkSurfaceCard,
        onPrimary: Color(0xFF00363D),
        onSecondary: Color(0xFF003919),
        onSurface: AppColors.darkTextPrimary,
        outline: AppColors.darkBorder,
      ),
      textTheme:
          GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.montserrat(
          color: AppColors.darkTextPrimary,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        displayMedium: GoogleFonts.montserrat(
          color: AppColors.darkTextPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.montserrat(
          color: AppColors.darkTextPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge:
            GoogleFonts.inter(color: AppColors.darkTextPrimary, fontSize: 18),
        bodyMedium:
            GoogleFonts.inter(color: AppColors.darkTextSecondary, fontSize: 16),
        labelLarge: GoogleFonts.inter(
          color: AppColors.bioluminescentGreen,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
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
        primary: AppColors.primaryContainerTeal,
        secondary: AppColors.secondaryContainerGreen,
        surface: AppColors.lightSurfaceCard,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.lightTextPrimary,
        outline: AppColors.lightBorder,
      ),
      textTheme:
          GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
        displayLarge: GoogleFonts.montserrat(
          color: AppColors.lightTextPrimary,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        displayMedium: GoogleFonts.montserrat(
          color: AppColors.lightTextPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.montserrat(
          color: AppColors.lightTextPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge:
            GoogleFonts.inter(color: AppColors.lightTextPrimary, fontSize: 18),
        bodyMedium: GoogleFonts.inter(
            color: AppColors.lightTextSecondary, fontSize: 16),
        labelLarge: GoogleFonts.inter(
          color: AppColors.primaryContainerTeal,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
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
