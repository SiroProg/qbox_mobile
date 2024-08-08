import 'dart:developer' as devtools show log;

import 'package:flutter/foundation.dart';

final void Function(Object? message) info = _logAll('INFO', 800);

final void Function(Object? message, [StackTrace? stackTrace]) warning =
    _logAll('WARNING', 900);

final void Function(Object? message, [StackTrace? stackTrace]) fatal =
    _logAll('FATAL', 2000);

void Function(Object? message, [StackTrace? stackTrace]) _logAll(
        String prefix, int level) =>
    (Object? message, [StackTrace? stackTrace]) {
      if (kReleaseMode) return;

      devtools.log(
        '[$prefix] $message',
        level: level,
        error: message is Exception || message is Error ? message : null,
        stackTrace: stackTrace,
      );
    };
