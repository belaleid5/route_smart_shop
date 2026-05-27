import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_smart/core/language/app_localizations_delegate.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  late final Map<String, String> _localizedStrings;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Future<void> load() async {
    try {
      final jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      _localizedStrings = jsonMap.map<String, String>((key, value) {
        return MapEntry(key, value.toString());
      });
    } catch (e) {
      _localizedStrings = {};
    }
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  bool get isEnLocale => locale.languageCode == 'en';
  bool get isArLocale => locale.languageCode == 'ar';
}