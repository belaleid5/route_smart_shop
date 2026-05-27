import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static final SecureStorage _instance = SecureStorage._();
  factory SecureStorage() => _instance;

  static const _androidOptions = AndroidOptions(
    // ignore: deprecated_member_use
    encryptedSharedPreferences: true,
  );

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: _androidOptions,
  );

  // ================== String ==================
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage write error: $e');
    }
  }

  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage read error: $e');
      return null;
    }
  }

  Future<String?> getString(String key) async {
    return await read(key);
  }

  // ================== Boolean ==================
  Future<void> writeBool(String key, bool value) async {
    try {
      await _storage.write(key: key, value: value.toString());
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage writeBool error: $e');
    }
  }

  Future<bool?> readBool(String key) async {
    try {
      final value = await _storage.read(key: key);
      if (value == null) return null;
      return value == 'true';
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage readBool error: $e');
      return null;
    }
  }

  // ================== Int ==================
  Future<void> writeInt(String key, int value) async {
    try {
      await _storage.write(key: key, value: value.toString());
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage writeInt error: $e');
    }
  }

  Future<int?> readInt(String key) async {
    try {
      final value = await _storage.read(key: key);
      if (value == null) return null;
      return int.tryParse(value);
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage readInt error: $e');
      return null;
    }
  }

  // ================== Utilities ==================
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage delete error: $e');
    }
  }

  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage containsKey error: $e');
      return false;
    }
  }

  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage clear error: $e');
    }
  }

  Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      if (kDebugMode) debugPrint('SecureStorage readAll error: $e');
      return {};
    }
  }
}