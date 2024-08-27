import 'src/features/services/db_service/db_service.dart';
import 'package:flutter/material.dart';
import 'src/core/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.initialize();
  runApp(const App());
}

var a = {
  "chat": "d68b9ba770364c8782e71daf06b0fb5e",
  "nonresident_verification_status": 1,
  "user_treatment_type": 1,
  "user_post_mistake": 1,
  "user_client_type": 1,
  "comment": "hello",
  "task_type_id": 51,
  "client_sender": "user:id:12345"
};
