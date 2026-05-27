import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/styles/fonts/font_family_helper.dart';
import 'package:route_smart/core/styles/fonts/font_weight_helper.dart';

/// Centralized theme configuration for Route Shop.
class AppTheme {
  AppTheme._();

  static ThemeData buildLight(String langCode) => _buildTheme(
        brightness: Brightness.light,
        colors: MyColors.light,
        langCode: langCode,
      );

  static ThemeData buildDark(String langCode) => _buildTheme(
        brightness: Brightness.dark,
        colors: MyColors.dark,
        langCode: langCode,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required MyColors colors,
    required String langCode,
  }) {
    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.tertiary,
        brightness: brightness,
      ),
      extensions: [colors],
      textTheme: _buildTextTheme(colors, langCode),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: _buildInputTheme(colors),
      elevatedButtonTheme: _buildButtonTheme(colors, langCode),
      checkboxTheme: _buildCheckboxTheme(colors),
      scaffoldBackgroundColor: colors.background,
    );
  }

  static TextTheme _buildTextTheme(MyColors colors, String langCode) {
    final fontFamily = FontFamilyHelper.getFontFamily(langCode);
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: FontWeightHelper.extraBold,
        color: colors.textPrimary,
        height: 1.2,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeightHelper.bold,
        color: colors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeightHelper.semiBold,
        color: colors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeightHelper.regular,
        color: colors.textPrimary,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeightHelper.regular,
        color: colors.textSecondary,
        height: 1.4,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 11,
        fontWeight: FontWeightHelper.medium,
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

  static ElevatedButtonThemeData _buildButtonTheme(
    MyColors colors,
    String langCode,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.button,
        foregroundColor: colors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 0,
        textStyle: TextStyle(
          fontFamily: FontFamilyHelper.getFontFamily(langCode),
          fontSize: 16,
          fontWeight: FontWeightHelper.semiBold,
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