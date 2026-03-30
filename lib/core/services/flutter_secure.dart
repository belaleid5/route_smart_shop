import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  factory SecureStorage() {
    return _storage;
  }

  SecureStorage._internal();
  static final SecureStorage _storage = SecureStorage._internal();

  static late FlutterSecureStorage secureStorage;

  /// Below method is to initialize the SecureStorage instance.
  /// (Secure Storage can be initialized directly, unlike SharedPreferences)
  Future<dynamic> initSecureStorage() async {
    // We provide a consistent configuration here
    secureStorage = const FlutterSecureStorage(
      // Configuration can be added here if needed, like specific Android or iOS options.
      // Example for iOS: options: const IOSOptions(accessibility: KeychainAccessibility.first_unlock)
    );
  }

  /// Below method is to return the SecureStorage instance.
  FlutterSecureStorage getSecureStorageInstance() {
    return secureStorage;
  }

  /// Below method is to set the string value (encrypted) in the SecureStorage.
  Future<void> setString(String key, String stringValue) async {
    await secureStorage.write(key: key, value: stringValue);
  }

  /// Below method is to get the string value (decrypted) from the SecureStorage.
  Future<String?> getString(String key) async {
    return await secureStorage.read(key: key);
  }

  /// Below method is to read all stored values (decrypted).
  Future<Map<String, String>> readAllPreferences() async {
    return await secureStorage.readAll();
  }

  /// Below method is to set a boolean value.
  /// (SecureStorage stores only Strings, so we convert it)
  Future<void> setBoolean(String key, bool booleanValue) async {
    await secureStorage.write(key: key, value: booleanValue.toString());
  }

  /// Below method is to get a boolean value.
  Future<bool?> getBoolean(String key) async {
    final String? stringValue = await secureStorage.read(key: key);
    if (stringValue == null) return null;
    if (stringValue == 'true') return true;
    if (stringValue == 'false') return false;
    return null; // Return null if the value is not a valid boolean string
  }

  /// Below method is to set an int value.
  /// (We convert it to String for storage)
  Future<void> setInt(String key, int intValue) async {
    await secureStorage.write(key: key, value: intValue.toString());
  }

  /// Below method is to get an int value.
  Future<int?> getInt(String key) async {
    final String? stringValue = await secureStorage.read(key: key);
    if (stringValue == null) return null;
    return int.tryParse(stringValue); // Using tryParse is safer
  }

  /// Below method is to remove the received preference.
  Future<void> removePreference(String key) async {
    await secureStorage.delete(key: key);
  }

  /// Below method is to check the availability of the received preference.
  Future<bool> containPreference(String key) async {
    return await secureStorage.containsKey(key: key);
  }

  /// Below method is to clear the SecureStorage.
  Future<void> clearPreferences() async {
    await secureStorage.deleteAll();
  }
}