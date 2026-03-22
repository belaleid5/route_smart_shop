// core/styles/colors/app_colors_dark.dart
import 'package:flutter/material.dart';

class AppColorsDark {
  AppColorsDark._();

  // ========== Main Colors ==========
  static const Color primary    = Color(0xFFE8EAF6); // فاتح على dark
  static const Color secondary  = Color(0xFF1A1A2E); // navy للـ containers
  static const Color tertiary   = Color(0xFF7986CB); // أزرق أفتح للـ dark mode

  // ========== Text Colors ==========
  static const Color textPrimary   = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9E9E);

  // ========== Other Colors ==========
  static const Color stroke     = Color(0xFF2A2D4A); // border غامق مع لون أزرق
  static const Color shades     = Color(0xFF12143A); // navy غامق جداً
  static const Color button     = Color(0xFF5C6BC0); // نفس الأزرق
  static const Color icon       = Color(0xFF7986CB); // أزرق فاتح للـ dark
  static const Color background = Color(0xFF0A0C1E); // navy غامق جداً
  static const Color divider    = Color(0xFF2A2D4A);
  static const Color rate       = Color(0xFFFBBF24);

  // ========== Common ==========
  static const Color white        = Color(0xFFFFFFFF);
  static const Color black        = Color(0xFF000000);
  static const Color spinKitColor = Color(0xFFFFFFFF);

  // ========== Semantic ==========
  static const Color surface     = Color(0xFF12143A);
  static Color get onPrimary     => black;
  static Color get onSurface     => textPrimary;
  static Color get onBackground  => textPrimary;
  static Color get shadowLight   => black.withOpacity(0.3);
  static Color get shadowMedium  => black.withOpacity(0.5);
  static Color get shadowDark    => black.withOpacity(0.7);
  static Color get border        => stroke;

  // ========== Splash Specific ==========
  static const Color splashStart = Color(0xFF0A0C1E);
  static const Color splashEnd   = Color(0xFF1A1F6E);
  static const Color splashIcon  = Color(0xFF5C6BC0);

  // ========== Onboarding Specific ==========
  static const Color glowColor   = Color(0xFF1A1F6E);
  static const Color dotActive   = Color(0xFF7986CB);
  static const Color dotInactive = Color(0xFF2A2D4A);

  // ========== Form Specific ==========
  static const Color fieldBackground = Color(0xFF12143A);
  static const Color fieldBorder     = Color(0xFF2A2D4A);
  static const Color checkboxActive  = Color(0xFF7986CB);
  static const Color linkColor       = Color(0xFF7986CB);
  static const Color validIcon       = Color(0xFF7986CB);
  static const Color invalidIcon     = Color(0xFF424242);
}