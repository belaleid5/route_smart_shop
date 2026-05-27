import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class AppLogger {
  const AppLogger._();

  static const String _defaultTag = 'RouteSmart';

  static void debug(String message, {String? tag}) {
    if (!kDebugMode) return;
    developer.log(
      message,
      name: tag ?? _defaultTag,
      level: 700,
    );
  }

  static void info(String message, {String? tag}) {
    developer.log(
      message,
      name: tag ?? _defaultTag,
      level: 800,
    );
  }

  static void warning(String message, {String? tag}) {
    developer.log(
      message,
      name: tag ?? _defaultTag,
      level: 900,
    );
  }

  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: tag ?? _defaultTag,
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}