// core/app/app_cubit/app_state.dart
part of 'app_cubit_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  
  const factory AppState.themeChangeMode({
    required bool isDark,
  }) = _ThemeChangeMode;
  
  const factory AppState.languageChange({
    required String languageCode,
  }) = _LanguageChange;
}
