class AppState {
  const AppState({
    required this.isDark,
    required this.languageCode,
    required this.tabIndex,
  });

  final bool isDark;
  final String languageCode;
  final int tabIndex;

  AppState copyWith({
    bool? isDark,
    String? languageCode,
    int? tabIndex,
  }) {
    return AppState(
      isDark: isDark ?? this.isDark,
      languageCode: languageCode ?? this.languageCode,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppState &&
        other.isDark == isDark &&
        other.languageCode == languageCode &&
        other.tabIndex == tabIndex;
  }

  @override
  int get hashCode => Object.hash(isDark, languageCode, tabIndex);
}