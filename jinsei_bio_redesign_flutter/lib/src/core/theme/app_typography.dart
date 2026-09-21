import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Design System Typography Tokens for Jinsei Bio.
/// Grounded in DESIGN.md typography definitions.
/// Changing font families or scale parameters here updates the entire application.
class AppTypography {
  // Master Font Family Tokens
  static String get brandFontFamily => GoogleFonts.montserrat().fontFamily!;
  static String get bodyFontFamily => GoogleFonts.inter().fontFamily!;

  // Master Display & Heading Tokens (Montserrat)
  static TextStyle displayLarge({
    required Color color,
    double fontSize = 48,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        height: 1.15,
        letterSpacing: -0.5,
      );

  static TextStyle displayMedium({
    required Color color,
    double fontSize = 32,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        height: 1.25,
      );

  static TextStyle headlineMedium({
    required Color color,
    double fontSize = 24,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  static TextStyle headlineSmall({
    required Color color,
    double fontSize = 20,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      );

  // Master Body & Label Tokens (Inter)
  static TextStyle bodyLarge({
    required Color color,
    double fontSize = 18,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle bodyMedium({
    required Color color,
    double fontSize = 16,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle bodySmall({
    required Color color,
    double fontSize = 14,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        height: 1.4,
      );

  static TextStyle labelCaps({
    required Color color,
    double fontSize = 12,
    double letterSpacing = 1.2,
  }) =>
      GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacing,
      );

  // Dedicated Component Typography Tokens
  static TextStyle brandLogoTitle({
    required Color color,
    double fontSize = 16,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      );

  static TextStyle brandLogoSubtitle({
    required Color color,
    double fontSize = 10,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        letterSpacing: 2.5,
      );

  static TextStyle navTabDesktop({
    required Color color,
    required bool isActive,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0,
      );

  static TextStyle navItemMobile({
    required Color color,
    required bool isActive,
  }) =>
      GoogleFonts.montserrat(
        color: color,
        fontSize: 14,
        fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
      );
}
