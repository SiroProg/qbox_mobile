import 'package:flutter/material.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/pages/employess/data/filter_data.dart';

class EmployeesProvider extends ChangeNotifier {
  FilterData filterData = FilterData();
  bool isLoading = false;
  List<String> chipFilter = [];

  String sellectedRoles = 'All';
  String sellectedGroup = 'All';

  void fetchData() async {
    try {
      isLoading = true;

      await filterData.getEmployees();
      notifyListeners();
    } catch (e) {
      warning(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void search(String value) async {
    try {
      isLoading = true;
      filterData.page = 1;
      notifyListeners();
      await filterData.search(value);
      notifyListeners();
      filterData.initialize();
    } catch (e) {
      warning(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void loadMore() async {
    try {
      isLoading = true;
      notifyListeners();

      await filterData.pagination();
    } catch (e) {
      warning(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearFilter() async {
    await filterData.clearFilter();
    sellectedRoles = 'All';
    sellectedGroup = 'All';

    chipFilter.clear();

    notifyListeners();
  }

  void setStatus(int? value) {
    filterData.status = value;
    if (value == 1) {
      chipFilter.remove('Blocked');
      chipFilter.remove('Deleted');
      chipFilter.add('Active');
      filterData.status = 1;
    } else if (value == 0) {
      chipFilter.remove('Active');
      chipFilter.remove('Deleted');
      chipFilter.add('Blocked');
      filterData.status = 0;
    } else if (value == -1) {
      chipFilter.remove('Active');
      chipFilter.remove('Blocked');
      chipFilter.add('Deleted');
      filterData.status = -1;
    }
    notifyListeners();
  }

  void setdGroup(String value) {
    sellectedGroup = value;
    notifyListeners();
  }

  void setGroupId(int? value) {
    filterData.groupId = value;

    if (value == -1) {
      chipFilter.add('Group');
    } else {
      chipFilter.remove('Group');
    }
    notifyListeners();
  }

  void setExtranalId(int? value) {
    filterData.externalId = value;

    if (value == 1) {
      chipFilter.add('External Id');
    } else {
      chipFilter.remove('External Id');
    }

    notifyListeners();
  }

  void setSipId(int? value) {
    filterData.sipId = value;

    if (value == 1) {
      chipFilter.add('Sip Id');
    } else {
      chipFilter.remove('Sip Id');
    }

    notifyListeners();
  }

  void setRoleId(int? value) {
    filterData.roleId = value;
    notifyListeners();
  }

  void setdRoles(String value) {
    sellectedRoles = value;
    // if (chipFilter.isNotEmpty) {
    //   if (chipFilter[0] == 'Active' ||
    //       chipFilter[0] == 'Blocked' ||
    //       chipFilter[0] == 'Deleted' ||
    //       chipFilter[0] == 'Group' ||
    //       chipFilter[0] == 'External Id' ||
    //       chipFilter[0] == 'Sip Id') {
    //     chipFilter.insert(0, value);
    //   } else {
    //     chipFilter.removeAt(0);
    //   }
    // } else {
    //   chipFilter.insert(0, value);
    // }
    notifyListeners();
  }

  void addChip(String value) {
    if (chipFilter.contains(value)) {
      return;
    }
    chipFilter.insert(0, value);

    notifyListeners();
  }

  void removeChip(String value) {
    if (chipFilter.length == 1) {
      clearFilter();
      return;
    }

    chipFilter.remove(value);

    if (chipFilter.isEmpty) {
      filterData.status = 1;
      fetchData();
      notifyListeners();
      return;
    }

    if (value == 'Active') filterData.status = 1;
    if (value == 'Blocked') filterData.status = 1;
    if (value == 'Deleted') filterData.status = 1;

    if (value == 'Group') setGroupId(null);
    if (value == 'External Id') setExtranalId(null);
    if (value == 'Sip Id') setSipId(null);

    notifyListeners();
    fetchData();
  }
}


 // if (chipFilter[0] != 'Active' ||
    //     chipFilter[0] != 'Blocked' ||
    //     chipFilter[0] != 'Deleted' ||
    //     chipFilter[0] != 'Group' ||
    //     chipFilter[0] != 'External Id' ||
    //     chipFilter[0] != 'Sip Id') {
    //   chipFilter.removeAt(0);
    //   setRoleId(null);
    //   sellectedRoles = 'All';
    // }