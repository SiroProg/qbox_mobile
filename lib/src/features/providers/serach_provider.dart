import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/models/search_models/customer_model.dart';
import 'package:qbox_mobile/src/core/models/search_models/task_model.dart';
import 'package:qbox_mobile/src/core/models/search_models/user_model.dart';
import 'package:qbox_mobile/src/features/services/search_service/search_service.dart';

class SerachProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];
  List<UserModel> users = [];
  List<CustomerModel> customers = [];
  bool isLoading = false;

  void serarch(String? query) async {
    isLoading = true;
    notifyListeners();

    if (query == null || query.isEmpty) {
      tasks.clear();
      users.clear();
      customers.clear();
      isLoading = false;
      notifyListeners();
      return;
    }

    tasks = await SearchService.searchTask(query);
    notifyListeners();

    users = await SearchService.searchUser(query);
    notifyListeners();

    customers = await SearchService.searchCustomer(query);

    isLoading = false;
    notifyListeners();
  }
}
