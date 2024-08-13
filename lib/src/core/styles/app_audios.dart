import 'package:flutter/material.dart';

@immutable
sealed class AppAudios {
  const AppAudios._();

  static const String _prefix = 'assets/audios/';

  static const String notification = '${_prefix}notification.mp3';

  static const String call = '${_prefix}call.mp3';
}
