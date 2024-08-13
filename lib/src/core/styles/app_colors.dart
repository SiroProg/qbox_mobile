import 'package:flutter/material.dart';

@immutable
sealed class AppColors {
  const AppColors._();

  static const Color white = Colors.white;
  static const Color yellow = Colors.yellow;
  static const Color orange = Colors.orange;
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color blue = Colors.blue;
  static const Color black = Colors.black;
  static const Color backgroundColor = Color(0xFFEBF7EE);
  static const Color lightBlue90 = Color(0xFFCCF2FF);
  static const Color lightBlue95 = Color(0xFFE6F0FF);
  static const Color lightDark95 = Color(0xFFF2F2F2);
  static const Color lightDark85 = Color(0xFFD9D9D9);
  static const Color lightDark90 = Color(0xFFE6E6E6);
  static const Color white10 = Color(0x33FFFFFF);
  static const Color black30 = Color(0x99000000);
  static const Color black10 = Color(0xFF868889);
  static const Color avaBackground = Color(0xFFD9D9D9);
  static const Color grey = Color(0xFF9CA3AF);
  static const Color disabledBackgroundColor = Color(0xFF409eff);
}
