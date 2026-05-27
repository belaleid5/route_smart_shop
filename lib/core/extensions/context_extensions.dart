import 'package:flutter/material.dart';
import 'package:route_smart/core/common/animations/custom_page_route.dart';
import 'package:route_smart/core/language/app_localizations.dart';
import 'package:route_smart/core/styles/app_images.dart';

extension ContextExt on BuildContext {
  AppImages get assets => Theme.of(this).extension<AppImages>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle get textStyle => textTheme.bodyMedium!;

  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;

  String translate(String key) {
    return AppLocalizations.of(this)?.translate(key) ?? key;
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(CustomPageRoute<T>(page: page));
  }

  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.of(this).pushReplacement<T, dynamic>(CustomPageRoute<T>(page: page));
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(CustomPageRoute(page: page), (route) => false);
  }
}