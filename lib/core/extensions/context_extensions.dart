
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/language/app_localizations.dart';
import 'package:route_smart/core/styles/app_images.dart';

extension ContextExt on BuildContext {
  //color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // images
  AppImages get assets => Theme.of(this).extension<AppImages>()!;

  // style
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

//Language
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }

  //Navigation

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
}
