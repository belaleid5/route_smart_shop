abstract final class PrefKeys {
  PrefKeys._();

  // App Settings
  static const String themeMode = 'theme_mode';
  static const String language = 'language';

  // Auth Tokens
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String verifyToken = 'verify_token';
  static const String tokenExpiry = 'token_expiry';

  // User Data
  static const String userId = 'user_id';
  static const String userName = 'user_name';
  static const String userEmail = 'user_email';
  static const String userPhoto = 'user_photo';

  // Flags
  static const String rememberMe = 'remember_me';
  static const String isFirstLaunch = 'is_first_launch';
}