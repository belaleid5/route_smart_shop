// lib/core/styles/theme/color_extension.dart
import 'package:flutter/material.dart';
import 'package:route_smart/core/styles/colors/colors_dark.dart';
import 'package:route_smart/core/styles/colors/colors_light.dart';

/// Custom theme extension holding all Route Shop design tokens.
@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.textPrimary,
    required this.textSecondary,
    required this.stroke,
    required this.shades,
    required this.button,
    required this.icon,
    required this.background,
    required this.white,
    required this.black,
    required this.spinKitColor,
    required this.divider,
    required this.rate,
    required this.splashStart,
    required this.splashEnd,
    required this.splashIcon,
    required this.glowColor,
    required this.dotActive,
    required this.dotInactive,
    required this.fieldBackground,
    required this.fieldBorder,
    required this.checkboxActive,
    required this.linkColor,
    required this.validIcon,
    required this.invalidIcon,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color textPrimary;
  final Color textSecondary;
  final Color stroke;
  final Color shades;
  final Color button;
  final Color icon;
  final Color background;
  final Color divider;
  final Color rate;
  final Color white;
  final Color black;
  final Color spinKitColor;
  final Color splashStart;
  final Color splashEnd;
  final Color splashIcon;
  final Color glowColor;
  final Color dotActive;
  final Color dotInactive;
  final Color fieldBackground;
  final Color fieldBorder;
  final Color checkboxActive;
  final Color linkColor;
  final Color validIcon;
  final Color invalidIcon;

  static const MyColors light = MyColors(
    primary:         AppColorsLight.primary,
    secondary:       AppColorsLight.secondary,
    tertiary:        AppColorsLight.tertiary,
    textPrimary:     AppColorsLight.textPrimary,
    textSecondary:   AppColorsLight.textSecondary,
    stroke:          AppColorsLight.stroke,
    shades:          AppColorsLight.shades,
    button:          AppColorsLight.button,
    icon:            AppColorsLight.icon,
    background:      AppColorsLight.background,
    white:           AppColorsLight.white,
    black:           AppColorsLight.black,
    spinKitColor:    AppColorsLight.spinKitColor,
    divider:         AppColorsLight.divider,
    rate:            AppColorsLight.rate,
    splashStart:     AppColorsLight.splashStart,
    splashEnd:       AppColorsLight.splashEnd,
    splashIcon:      AppColorsLight.splashIcon,
    glowColor:       AppColorsLight.glowColor,
    dotActive:       AppColorsLight.dotActive,
    dotInactive:     AppColorsLight.dotInactive,
    fieldBackground: AppColorsLight.fieldBackground,
    fieldBorder:     AppColorsLight.fieldBorder,
    checkboxActive:  AppColorsLight.checkboxActive,
    linkColor:       AppColorsLight.linkColor,
    validIcon:       AppColorsLight.validIcon,
    invalidIcon:     AppColorsLight.invalidIcon,
  );

  static const MyColors dark = MyColors(
    primary:         AppColorsDark.primary,
    secondary:       AppColorsDark.secondary,
    tertiary:        AppColorsDark.tertiary,
    textPrimary:     AppColorsDark.textPrimary,
    textSecondary:   AppColorsDark.textSecondary,
    stroke:          AppColorsDark.stroke,
    shades:          AppColorsDark.shades,
    button:          AppColorsDark.button,
    icon:            AppColorsDark.icon,
    background:      AppColorsDark.background,
    white:           AppColorsDark.white,
    black:           AppColorsDark.black,
    spinKitColor:    AppColorsDark.spinKitColor,
    divider:         AppColorsDark.divider,
    rate:            AppColorsDark.rate,
    splashStart:     AppColorsDark.splashStart,
    splashEnd:       AppColorsDark.splashEnd,
    splashIcon:      AppColorsDark.splashIcon,
    glowColor:       AppColorsDark.glowColor,
    dotActive:       AppColorsDark.dotActive,
    dotInactive:     AppColorsDark.dotInactive,
    fieldBackground: AppColorsDark.fieldBackground,
    fieldBorder:     AppColorsDark.fieldBorder,
    checkboxActive:  AppColorsDark.checkboxActive,
    linkColor:       AppColorsDark.linkColor,
    validIcon:       AppColorsDark.validIcon,
    invalidIcon:     AppColorsDark.invalidIcon,
  );

  @override
  MyColors copyWith({
    Color? primary, Color? secondary, Color? tertiary,
    Color? textPrimary, Color? textSecondary, Color? stroke,
    Color? shades, Color? button, Color? icon, Color? background,
    Color? white, Color? black, Color? spinKitColor, Color? divider,
    Color? rate, Color? splashStart, Color? splashEnd, Color? splashIcon,
    Color? glowColor, Color? dotActive, Color? dotInactive,
    Color? fieldBackground, Color? fieldBorder, Color? checkboxActive,
    Color? linkColor, Color? validIcon, Color? invalidIcon,
  }) =>
      MyColors(
        primary:         primary         ?? this.primary,
        secondary:       secondary       ?? this.secondary,
        tertiary:        tertiary        ?? this.tertiary,
        textPrimary:     textPrimary     ?? this.textPrimary,
        textSecondary:   textSecondary   ?? this.textSecondary,
        stroke:          stroke          ?? this.stroke,
        shades:          shades          ?? this.shades,
        button:          button          ?? this.button,
        icon:            icon            ?? this.icon,
        background:      background      ?? this.background,
        white:           white           ?? this.white,
        black:           black           ?? this.black,
        spinKitColor:    spinKitColor    ?? this.spinKitColor,
        divider:         divider         ?? this.divider,
        rate:            rate            ?? this.rate,
        splashStart:     splashStart     ?? this.splashStart,
        splashEnd:       splashEnd       ?? this.splashEnd,
        splashIcon:      splashIcon      ?? this.splashIcon,
        glowColor:       glowColor       ?? this.glowColor,
        dotActive:       dotActive       ?? this.dotActive,
        dotInactive:     dotInactive     ?? this.dotInactive,
        fieldBackground: fieldBackground ?? this.fieldBackground,
        fieldBorder:     fieldBorder     ?? this.fieldBorder,
        checkboxActive:  checkboxActive  ?? this.checkboxActive,
        linkColor:       linkColor       ?? this.linkColor,
        validIcon:       validIcon       ?? this.validIcon,
        invalidIcon:     invalidIcon     ?? this.invalidIcon,
      );

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      primary:         Color.lerp(primary,         other.primary,         t)!,
      secondary:       Color.lerp(secondary,       other.secondary,       t)!,
      tertiary:        Color.lerp(tertiary,         other.tertiary,        t)!,
      textPrimary:     Color.lerp(textPrimary,     other.textPrimary,     t)!,
      textSecondary:   Color.lerp(textSecondary,   other.textSecondary,   t)!,
      stroke:          Color.lerp(stroke,           other.stroke,          t)!,
      shades:          Color.lerp(shades,           other.shades,          t)!,
      button:          Color.lerp(button,           other.button,          t)!,
      icon:            Color.lerp(icon,             other.icon,            t)!,
      background:      Color.lerp(background,       other.background,      t)!,
      white:           Color.lerp(white,            other.white,           t)!,
      black:           Color.lerp(black,            other.black,           t)!,
      spinKitColor:    Color.lerp(spinKitColor,     other.spinKitColor,    t)!,
      divider:         Color.lerp(divider,          other.divider,         t)!,
      rate:            Color.lerp(rate,             other.rate,            t)!,
      splashStart:     Color.lerp(splashStart,      other.splashStart,     t)!,
      splashEnd:       Color.lerp(splashEnd,        other.splashEnd,       t)!,
      splashIcon:      Color.lerp(splashIcon,       other.splashIcon,      t)!,
      glowColor:       Color.lerp(glowColor,        other.glowColor,       t)!,
      dotActive:       Color.lerp(dotActive,        other.dotActive,       t)!,
      dotInactive:     Color.lerp(dotInactive,      other.dotInactive,     t)!,
      fieldBackground: Color.lerp(fieldBackground,  other.fieldBackground, t)!,
      fieldBorder:     Color.lerp(fieldBorder,      other.fieldBorder,     t)!,
      checkboxActive:  Color.lerp(checkboxActive,   other.checkboxActive,  t)!,
      linkColor:       Color.lerp(linkColor,        other.linkColor,       t)!,
      validIcon:       Color.lerp(validIcon,        other.validIcon,       t)!,
      invalidIcon:     Color.lerp(invalidIcon,      other.invalidIcon,     t)!,
    );
  }
}

extension MyColorsExtension on BuildContext {
  MyColors get colors => Theme.of(this).extension<MyColors>()!;
}

extension MyColorsThemeExtension on ThemeData {
  MyColors get myColors => extension<MyColors>()!;
}