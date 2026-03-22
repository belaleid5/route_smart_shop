// core/styles/fonts/font_weight_helper.dart
import 'package:flutter/material.dart';

class FontWeightHelper {
  FontWeightHelper._(); // منع الـ instantiation

  // ========== Font Weights (من الأخف للأثقل) ==========
  
  /// Thin - 100 (الأخف)
  static const FontWeight thin = FontWeight.w100;
  
  /// Extra Light - 200
  static const FontWeight extraLight = FontWeight.w200;
  
  /// Light - 300
  static const FontWeight light = FontWeight.w300;
  
  /// Regular - 400 (Normal/العادي)
  static const FontWeight regular = FontWeight.w400;
  
  /// Medium - 500
  static const FontWeight medium = FontWeight.w500;
  
  /// Semi Bold - 600
  static const FontWeight semiBold = FontWeight.w600;
  
  /// Bold - 700 (العريض)
  static const FontWeight bold = FontWeight.w700;
  
  /// Extra Bold - 800
  static const FontWeight extraBold = FontWeight.w800;
  
  /// Black - 900 (الأثقل)
  static const FontWeight black = FontWeight.w900;

  // ========== Aliases (أسماء بديلة للوضوح) ==========
  
  /// نفس regular - للوضوح في القراءة
  static const FontWeight normal = FontWeight.w400;
  
  /// نفس bold - للوضوح في القراءة
  static const FontWeight strong = FontWeight.w700;
  
  /// نفس black - للوضوح في القراءة
  static const FontWeight heavy = FontWeight.w900;
}
