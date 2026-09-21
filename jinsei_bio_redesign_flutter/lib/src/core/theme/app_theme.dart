import 'package:flutter/material.dart';
import 'app_typography.dart';

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
  static const Color cyanInteractive =
      Color(0xFF06B6D4); // Interactive Cyan Accent

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
      textTheme: TextTheme(
        displayLarge:
            AppTypography.displayLarge(color: AppColors.darkTextPrimary),
        displayMedium:
            AppTypography.displayMedium(color: AppColors.darkTextPrimary),
        headlineMedium:
            AppTypography.headlineMedium(color: AppColors.darkTextPrimary),
        bodyLarge: AppTypography.bodyLarge(color: AppColors.darkTextPrimary),
        bodyMedium:
            AppTypography.bodyMedium(color: AppColors.darkTextSecondary),
        bodySmall: AppTypography.bodySmall(color: AppColors.darkTextSecondary),
        labelLarge:
            AppTypography.labelCaps(color: AppColors.bioluminescentGreen),
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
      textTheme: TextTheme(
        displayLarge:
            AppTypography.displayLarge(color: AppColors.lightTextPrimary),
        displayMedium:
            AppTypography.displayMedium(color: AppColors.lightTextPrimary),
        headlineMedium:
            AppTypography.headlineMedium(color: AppColors.lightTextPrimary),
        bodyLarge: AppTypography.bodyLarge(color: AppColors.lightTextPrimary),
        bodyMedium:
            AppTypography.bodyMedium(color: AppColors.lightTextSecondary),
        bodySmall: AppTypography.bodySmall(color: AppColors.lightTextSecondary),
        labelLarge:
            AppTypography.labelCaps(color: AppColors.primaryContainerTeal),
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
