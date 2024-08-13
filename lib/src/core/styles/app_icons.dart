import 'package:flutter/material.dart';

@immutable
sealed class AppIcons {
  const AppIcons._();

  static const String _prefix = 'assets/icons/';

  static const String logo = '${_prefix}logo.svg';
}
