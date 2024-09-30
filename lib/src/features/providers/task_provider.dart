import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/models/task_models/status_model.dart';
import 'package:qbox_mobile/src/core/models/task_models/task_model.dart';
import 'package:qbox_mobile/src/features/services/task_service/task_service.dart';

class TaskProvider extends ChangeNotifier {
  List<StatusModel> stattus = [];
  TaskModel? task;
  bool isLoading = false;

  String? sellectedStatus;

  void initialize(int id) async {
    isLoading = true;
    notifyListeners();

    stattus = await TaskService.getStatuses(id);
    sellectedStatus = stattus[0].title;
    // task = await TaskService.getTask(id);
    notifyListeners();
  }

  void sellectStatuc(String value) {
    sellectedStatus = value;
    notifyListeners();
  }
}
