import 'package:qbox_mobile/src/features/services/employess_service/employees_service.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:qbox_mobile/src/core/models/employess/user_group_model.dart';
import 'package:qbox_mobile/src/core/models/employess/employees_model.dart';
import 'package:qbox_mobile/src/core/models/employess/config_model.dart';
import 'package:qbox_mobile/src/core/models/employess/detail_model.dart';
import 'package:qbox_mobile/src/core/models/employess/roles_model.dart';
import 'package:qbox_mobile/src/core/utils/deouncer.dart';
import 'dart:async';

class FilterData {
  FilterData({
    this.page = 1,
    this.roleId,
    this.limit = 20,
    this.status = 1,
    this.groupId,
    this.externalId,
    this.sipId,
  }) {
    initialize();
  }

  int page;
  int? roleId;
  int? limit;
  int? status;
  int? groupId;
  int? externalId;
  int? sipId;
  String? query;

  List<EmployeesModel> data = [];
  List<RolesModel> roles = [];
  List<UserGroupModel> userGroups = [];

  List<EmployeesModel> _filteredData = [];
  List<EmployeesModel> _searchedData = [];

  final _debouncer = Debouncer(const Duration(milliseconds: 0));

  Future<void> initialize() async {
    await getEmployees();
    await getRoles();
    await getUserGroups();
  }

  Future<void> getEmployees() async {
    data = await EmployeesService.getEmployees(queryParameter: toJson());
    _filteredData = List.from(data);
  }

  Future<void> getUserGroups() async {
    userGroups.add(
      const UserGroupModel(
        id: 0,
        title: 'All',
        status: 0,
        details: Detail(),
        level: 0,
        parentId: 0,
        usersCount: 0,
      ),
    );
    userGroups.addAll(await EmployeesService.getUserGroups());
  }

  Future<void> pagination() async {
    page++;
    List<EmployeesModel> moreEmployees =
        await EmployeesService.getEmployees(queryParameter: toJson());
    _filteredData.addAll(moreEmployees);
    data = List.from(_filteredData);
  }

  Future<void> search(String value) async {
    if (value.trim().isEmpty) {
      data = List.from(_filteredData);
    } else {
      query = value.trim();
      _debouncer.call(() async {
        _searchedData =
            await EmployeesService.searchEmployees(queryParameter: toJson());
        data = List.from(_searchedData);
      });
    }
  }

  Future<void> getRoles() async {
    roles.add(
      const RolesModel(
        id: 0,
        title: 'All',
        status: 0,
        configs: ConfigModel(
          redirectTo: '',
          seeFolderIds: [],
        ),
      ),
    );
    roles.addAll(await EmployeesService.getRoles());
  }

  Future<void> clearFilter() async {
    page = 1;
    roleId = null;
    limit = 20;
    status = 1;
    groupId = null;
    externalId = null;
    sipId = null;
    query = null;

    await getEmployees();
  }

  Future<void> updateFilter({
    int? page,
    int? roleId,
    int? status,
    int? groupId,
    int? externalId,
    int? sipId,
    String? query,
  }) async {
    if (page != null) this.page = page;
    if (roleId != null) this.roleId = roleId;
    if (status != null) this.status = status;
    if (groupId != null) this.groupId = groupId;
    if (externalId != null) this.externalId = externalId;
    if (sipId != null) this.sipId = sipId;
    if (query != null) this.query = query;

    await getEmployees();
  }

  Map<String, Object?> toJson() => {
        'token': DBService.token,
        'page': page,
        'role_id': roleId,
        'limit': limit,
        'status': status,
        'group_id': groupId,
        'external_id': externalId,
        'sip_id': sipId,
        'query': query,
        'action': 'search',
        'permission': 0,
      };

  @override
  String toString() => 'FilterData('
      'page: $page,'
      'roleId: $roleId,'
      'limit: $limit,'
      'status: $status,'
      'groupId: $groupId,'
      'externalId: $externalId,'
      'sipId: $sipId,'
      'query: $query'
      'data: $data)';
}
