import 'package:flutter/material.dart';

abstract final class AppColorsLight {
  AppColorsLight._();

  // ========== Main Colors ==========
  static const Color primary = Color(0xFF6155F5);
  static const Color secondary = Color(0xFFF0F2FF);
  static const Color tertiary = Color(0xFF5C6BC0);

  // ========== Text Colors ==========
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF8F95A3);

  // ========== UI Elements ==========
  static const Color stroke = Color(0xFFE8EAF6);
  static const Color shades = Color(0xFFFFFFFF);
  static const Color button = Color(0xFF5C6BC0);
  static const Color icon = Color(0xFF5C6BC0);
  static const Color background = Color(0xFFF5F6FF);
  static const Color divider = Color(0xFFE0E0E0);
  static const Color rate = Color(0xFFFBBF24);

  // ========== Common ==========
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color spinKitColor = Color(0xFFFFFFFF);

  // ========== Semantic & Surfaces ==========
  static Color get surface => white;
  static Color get onPrimary => white;
  static Color get onSurface => textPrimary;
  static Color get onBackground => textPrimary;
  
  static Color get shadowLight => black.withOpacity(0.04);
  static Color get shadowMedium => black.withOpacity(0.08);
  static Color get shadowDark => black.withOpacity(0.15);
  static Color get border => stroke;

  // ========== Feature Specific ==========
  // Splash
  static const Color splashStart = Color(0xFF0D1B6E);
  static const Color splashEnd = Color(0xFF3949AB);
  static const Color splashIcon = Color(0xFF7986CB);

  // Onboarding
  static const Color glowColor = Color(0xFFE8EAF6);
  static const Color dotActive = Color(0xFF5C6BC0);
  static const Color dotInactive = Color(0xFFBBBEF0);

  // Forms
  static const Color fieldBackground = Color(0xFFF2F4FF); 
  static const Color fieldBorder = Color(0xFFE8EAF6);
  static const Color checkboxActive = Color(0xFF5C6BC0);
  static const Color linkColor = Color(0xFF5C6BC0);
  static const Color validIcon = Color(0xFF5C6BC0);
  static const Color invalidIcon = Color(0xFFBDBDBD);

  // Shimmer
  static const Color shimmerBase = fieldBackground;
  static const Color shimmerHighlight = white;
}