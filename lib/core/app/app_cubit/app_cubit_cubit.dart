import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_state.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/core/services/shared_pref/shared_pref.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState(isDark: false, languageCode: 'ar', tabIndex: 0));

  bool get isDark => state.isDark;
  String get currentLangCode => state.languageCode;
  int get currentTabIndex => state.tabIndex;

  void init() {
    final savedTheme = SharedPref().getBoolean(PrefKeys.themeMode) ?? false;
    final savedLang = SharedPref().getString(PrefKeys.language) ?? 'ar';

    emit(state.copyWith(
      isDark: savedTheme,
      languageCode: savedLang,
    ));
  }

  Future<void> toggleTheme() async {
    final newTheme = !state.isDark;
    await SharedPref().setBoolean(PrefKeys.themeMode, newTheme);
    
    emit(state.copyWith(isDark: newTheme));
  }

  Future<void> changeLanguage(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    
    emit(state.copyWith(languageCode: langCode));
  }

  void changeTab(int index) {
    emit(state.copyWith(tabIndex: index));
  }
}