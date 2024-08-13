import 'src/features/services/db_service/db_service.dart';
import 'package:flutter/material.dart';
import 'src/core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.initialize();
  runApp(const App());
}
