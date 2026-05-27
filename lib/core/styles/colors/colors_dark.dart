import 'package:flutter/material.dart';

abstract final class AppColorsDark {
  AppColorsDark._();

  // ========== Main Colors ==========
  static const Color primary = Color(0xFF8B7CF6);
  static const Color secondary = Color(0xFF171929);
  static const Color tertiary = Color(0xFF6C63FF);

  // ========== Text Colors ==========
  static const Color textPrimary = Color(0xFFEEEDF5);
  static const Color textSecondary = Color(0xFF7E7C93);

  // ========== UI Elements ==========
  static const Color stroke = Color(0xFF252742);
  static const Color shades = Color(0xFF111325);
  static const Color button = Color(0xFF6C63FF);
  static const Color icon = Color(0xFF8B7CF6);
  static const Color background = Color(0xFF0D0F1C);
  static const Color divider = Color(0xFF252742);
  static const Color rate = Color(0xFFFBBF24);

  // ========== Common ==========
  static const Color white = Color(0xFFEEEDF5);
  static const Color black = Color(0xFF000000);
  static const Color spinKitColor = Color(0xFF8B7CF6);

  // ========== Semantic & Surfaces ==========
  static Color get surface => const Color(0xFF151728);
  static Color get onPrimary => black;
  static Color get onSurface => textPrimary;
  static Color get onBackground => textPrimary;
  
  static Color get shadowLight => black.withOpacity(0.2);
  static Color get shadowMedium => black.withOpacity(0.4);
  static Color get shadowDark => black.withOpacity(0.6);
  static Color get border => stroke;

  // ========== Feature Specific ==========
  // Splash
  static const Color splashStart = Color(0xFF0D0F1C);
  static const Color splashEnd = Color(0xFF1A1F6E);
  static const Color splashIcon = Color(0xFF8B7CF6);

  // Onboarding
  static const Color glowColor = Color(0xFF1A1F6E);
  static const Color dotActive = Color(0xFF6C63FF);
  static const Color dotInactive = Color(0xFF252742);

  // Forms
  static const Color fieldBackground = Color(0xFF151728);
  static const Color fieldBorder = Color(0xFF252742);
  static const Color checkboxActive = Color(0xFF6C63FF);
  static const Color linkColor = Color(0xFF8B7CF6);
  static const Color validIcon = Color(0xFF6C63FF);
  static const Color invalidIcon = Color(0xFF3A3A50);

  // Shimmer
  static const Color shimmerBase = fieldBackground;
  static const Color shimmerHighlight = stroke;
}