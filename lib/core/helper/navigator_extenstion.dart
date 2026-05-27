import 'package:flutter/widgets.dart';

extension NavigationExtension on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop([Object? result]) => Navigator.of(this).pop(result);
  
  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
  
  bool isNullOrWhiteSpace() => this == null || this!.trim().isEmpty;
  
  String orEmpty() => this ?? "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
  
  bool isNotNullAndNotEmpty() => this != null && this!.isNotEmpty;
  
  List<T> orEmpty() => this ?? [];
}