// core/styles/colors/app_colors_light.dart
import 'package:flutter/material.dart';

class AppColorsLight {
  AppColorsLight._();

  // ========== Main Colors ==========
  static const Color primary    = Color(0xFF1A1A2E); // dark navy للنصوص
  static const Color secondary  = Color(0xFFF0F2FF); // أزرق فاتح جداً للخلفيات
  static const Color tertiary   = Color(0xFF5C6BC0); // أزرق الـ button والـ accent

  // ========== Text Colors ==========
  static const Color textPrimary   = Color(0xFF1A1A2E); // navy غامق
  static const Color textSecondary = Color(0xFF8F95A3); // رمادي متوسط

  // ========== Other Colors ==========
  static const Color stroke     = Color(0xFFE8EAF6); // border فاتح مع لون أزرق
  static const Color shades     = Color(0xFFFFFFFF); // أبيض
  static const Color button     = Color(0xFF5C6BC0); // أزرق الـ Sign Up button
  static const Color icon       = Color(0xFF5C6BC0); // أيقونات زرقاء
  static const Color background = Color(0xFFF5F6FF); // خلفية الـ register
  static const Color divider    = Color(0xFFE0E0E0);
  static const Color rate       = Color(0xFFFBBF24);

  // ========== Common ==========
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color spinKitColor = Color(0xFFFFFFFF);

  // ========== Semantic ==========
  static Color get surface       => white;
  static Color get onPrimary     => white;
  static Color get onSurface     => textPrimary;
  static Color get onBackground  => textPrimary;
  static Color get shadowLight   => black.withOpacity(0.04);
  static Color get shadowMedium  => black.withOpacity(0.08);
  static Color get shadowDark    => black.withOpacity(0.15);
  static Color get border        => stroke;

  // ========== Splash Specific ==========
  // الـ splash عنده gradient من navy لـ blue
  static const Color splashStart = Color(0xFF0D1B6E); // أزرق غامق جداً
  static const Color splashEnd   = Color(0xFF3949AB); // أزرق متوسط
  static const Color splashIcon  = Color(0xFF7986CB); // أيقونة فاتحة على الـ splash

  // ========== Onboarding Specific ==========
  static const Color glowColor   = Color(0xFFE8EAF6); // الـ glow الأزرق الفاتح
  static const Color dotActive   = Color(0xFF5C6BC0); // النقطة النشطة
  static const Color dotInactive = Color(0xFFBBBEF0); // النقاط الغير نشطة

  // ========== Form Specific ==========
  static const Color fieldBackground = Color(0xFFF0F2FF); // خلفية الـ input fields
  static const Color fieldBorder     = Color(0xFFE8EAF6); // border الـ fields
  static const Color checkboxActive  = Color(0xFF5C6BC0); // الـ checkbox المفعل
  static const Color linkColor       = Color(0xFF5C6BC0); // Terms & Login links
  static const Color validIcon       = Color(0xFF5C6BC0); // أيقونة الـ validation
  static const Color invalidIcon     = Color(0xFFBDBDBD); // أيقونة مش مكتملة
}