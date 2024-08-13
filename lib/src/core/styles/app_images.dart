import 'package:flutter/material.dart';

@immutable
sealed class AppImages {
  const AppImages._();

  static const String _prefix = 'assets/images/';
  static const String appLogo = '${_prefix}download.png';
  static const String backgroungImage = '${_prefix}background_image.jpeg';
}
