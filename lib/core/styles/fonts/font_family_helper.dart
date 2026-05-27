
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/core/services/shared_pref/shared_pref.dart';

abstract final class FontFamilyHelper {
  FontFamilyHelper._();

  static const String cairo = 'Cairo';
  static const String poppins = 'Poppins';

  static String getFontFamily([String? langCode]) {
    if (langCode != null) {
      return langCode == 'ar' ? cairo : poppins;
    }

    final storedLang = SharedPref().getString(PrefKeys.language);
    final lang = storedLang ?? 'ar';
    
    return lang == 'ar' ? cairo : poppins;
  }
}