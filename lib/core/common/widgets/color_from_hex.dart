import 'package:flutter/material.dart';

class MyHexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    // ignore: parameter_assignments
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  MyHexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
