final class JsonReader {
  const JsonReader._();

  static String string(Object? value, {String fallback = ''}) {
    if (value == null) return fallback;
    if (value is String) return value;
    return value.toString();
  }

  static String? nullableString(Object? value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  static int integer(Object? value, {int fallback = 0}) {
    if (value is int) return value;
    if (value is num) return value.toInt();

    if (value is String) {
      return num.tryParse(value)?.toInt() ?? fallback;
    }

    return fallback;
  }

  static double decimal(Object? value, {double fallback = 0}) {
    if (value is double) return value;
    if (value is num) return value.toDouble();

    if (value is String) {
      return double.tryParse(value) ?? fallback;
    }

    return fallback;
  }

  static Map<String, dynamic>? map(Object? value) {
    if (value is Map<String, dynamic>) return value;

    if (value is Map) {
      return value.map(
        (key, value) => MapEntry(key.toString(), value),
      );
    }

    return null;
  }

  static List<Map<String, dynamic>> mapList(Object? value) {
    if (value is! List) return const <Map<String, dynamic>>[];

    return value
        .map(map)
        .whereType<Map<String, dynamic>>()
        .toList(growable: false);
  }
}