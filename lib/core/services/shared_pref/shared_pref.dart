import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // Private Constructor
  SharedPref._();

  // Singleton Instance
  static final SharedPref _instance = SharedPref._();
  factory SharedPref() => _instance;

  // Backing field
  SharedPreferences? _prefs;

  /// ✅ Initialization Method (Call this in main())
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Getter with safety check
  SharedPreferences get _preferences {
    if (_prefs == null) {
      throw Exception('SharedPref not initialized! Call SharedPref().init() in main().');
    }
    return _prefs!;
  }

  // ================== String ==================
  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String? getString(String key) => _preferences.getString(key);

  // ================== Boolean ==================
  Future<void> setBoolean(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  bool? getBoolean(String key) => _preferences.getBool(key);

  // ================== Int ==================
  Future<void> setInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  int? getInt(String key) => _preferences.getInt(key);

  // ================== Double ==================
  Future<void> setDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  double? getDouble(String key) => _preferences.getDouble(key);

  // ================== Utilities ==================
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  Future<bool> containsKey(String key) async {
    return _preferences.containsKey(key);
  }

  Future<void> clear() async {
    await _preferences.clear();
  }
}