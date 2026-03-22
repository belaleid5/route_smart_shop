// lib/core/styles/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:route_smart/core/app/theme/my_colors.dart';

/// Centralized theme configuration for Route Shop.
class AppTheme {
  AppTheme._();

  static ThemeData get light => _buildTheme(
        brightness: Brightness.light,
        colors: MyColors.light,
      );

  static ThemeData get dark => _buildTheme(
        brightness: Brightness.dark,
        colors: MyColors.dark,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required MyColors colors,
  }) {
    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.tertiary,
        brightness: brightness,
      ),
      extensions: [colors],
      textTheme: _buildTextTheme(colors),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: _buildInputTheme(colors),
      elevatedButtonTheme: _buildButtonTheme(colors),
      checkboxTheme: _buildCheckboxTheme(colors),
      scaffoldBackgroundColor: colors.background,
    );
  }

  static TextTheme _buildTextTheme(MyColors colors) {
    return TextTheme(
      displayLarge: GoogleFonts.plusJakartaSans(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: colors.textPrimary,
        height: 1.2,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
        height: 1.4,
      ),
      labelSmall: GoogleFonts.plusJakartaSans(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
        letterSpacing: 1.2,
      ),
    );
  }

  static InputDecorationTheme _buildInputTheme(MyColors colors) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.fieldBackground,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.fieldBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.fieldBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.tertiary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      prefixIconColor: colors.icon,
      suffixIconColor: colors.icon,
    );
  }

  static ElevatedButtonThemeData _buildButtonTheme(MyColors colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.button,
        foregroundColor: colors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 0,
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static CheckboxThemeData _buildCheckboxTheme(MyColors colors) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colors.checkboxActive;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(color: colors.checkboxActive, width: 1.5),
    );
  }
}