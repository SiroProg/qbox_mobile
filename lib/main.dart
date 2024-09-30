import 'dart:async';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:qbox_mobile/src/core/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.initialize();
  runApp(const App());
}
