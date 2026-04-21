import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/animations/custom_page_route.dart';
import 'package:route_smart/core/language/app_localizations.dart';
import 'package:route_smart/core/styles/app_images.dart';

extension ContextExt on BuildContext {
  // color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // images
  AppImages get assets => Theme.of(this).extension<AppImages>()!;

  // style
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  String translate(String langkey) {
    return AppLocalizations.of(this)?.translate(langkey) ?? langkey;
  }

  // Named Navigation
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();

  // Custom Transition Navigation
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(
      CustomPageRoute<T>(page: page),
    );
  }

  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.of(this).pushReplacement<T, dynamic>(
      CustomPageRoute<T>(page: page),
    );
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      CustomPageRoute(page: page),
      (route) => false,
    );
  }
}