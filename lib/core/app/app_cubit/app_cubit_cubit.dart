// core/app/app_cubit/app_cubit_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_smart/core/services/shared_pref/shared_keys.dart';
import 'package:route_smart/core/services/shared_pref/shared_pref.dart';

part 'app_cubit_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  bool isDark = true;
  String currentLangCode = 'en';

  // Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }

  // Language Change
  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'ar';
    currentLangCode = result!;
    emit(AppState.languageChange(languageCode: currentLangCode));
  }
}
