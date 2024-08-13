import 'package:dio/dio.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/models/employess/employees_model.dart';
import '../../../core/models/employess/roles_model.dart';
import '../../../core/models/employess/user_group_model.dart';
import '../../../core/utils/logger.dart';

class EmployeesService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: true,
      maxRedirects: 5,
    );

  static Future<List<EmployeesModel>> getEmployees({
    required Map<String, Object?> queryParameter,
  }) async {
    try {
      final response = await _dio.get(
        '/api/staff/employees',
        queryParameters: queryParameter,
      );
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data']['employees'];
        List<EmployeesModel> employees =
            responseData.map((json) => EmployeesModel.fromJson(json)).toList();
        info("employees: Success fetching employees");
        return employees;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      fatal('Error fetching employees: $e');
      throw Exception('Failed to load employees');
    }
  }

  static Future<List<RolesModel>> getRoles() async {
    try {
      final response = await _dio.get(
        '/api/roles/',
        queryParameters: {
          'token': DBService.token,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData != null &&
            responseData['roles'] != null &&
            responseData['roles'] is List) {
          final List<dynamic> rolesData = responseData['roles'];
          List<RolesModel> roles =
              rolesData.map((json) => RolesModel.fromJson(json)).toList();

          return roles;
        } else {
          throw Exception('Roles data is null or invalid');
        }
      } else {
        throw Exception('Failed to load roles: ${response.statusCode}');
      }
    } catch (e) {
      fatal('Error fetching roles: $e');
      throw Exception('Failed to load roles: $e');
    }
  }

  static Future<List<EmployeesModel>> searchEmployees({
    required Map<String, Object?> queryParameter,
  }) async {
    try {
      final response = await _dio.get(
        '/api/staff/employees/search',
        queryParameters: queryParameter,
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['items'];
        List<EmployeesModel> employees =
            await Future.wait(responseData.map((json) async {
          String name = await getRoleName(json['role_id'] as int);

          return EmployeesModel.fromJson2(json, name);
        }));

        return employees;
      } else {
        throw Exception('Failed to search employees');
      }
    } catch (e) {
      fatal('Error searching employees: $e');
      throw Exception('Failed to search employees');
    }
  }

  static Future<String> getRoleName(int roleId) async {
    try {
      final response = await _dio.get(
        '/api/roles/$roleId',
        queryParameters: {"token": DBService.token},
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData != null && responseData['role'] != null) {
          final String roleName = responseData['role']['title'];
          return roleName;
        } else {
          warning('Role data is null or invalid');
        }
      } else {
        fatal('Failed to load role name: ${response.statusCode}');
      }
      return 'null';
    } catch (e) {
      fatal('Error fetching role name: $e');
      fatal('Failed to load role name');

      return 'null';
    }
  }

  static Future<List<UserGroupModel>> getUserGroups() async {
    try {
      final response = await _dio.get(
        '/api/project_users/',
        queryParameters: {
          "token": DBService.token,
          "action": "get_user_groups",
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData != null &&
            responseData['user_groups'] != null &&
            responseData['user_groups'] is List) {
          final List<dynamic> userGroupData = responseData['user_groups'];
          List<UserGroupModel> userGroups = userGroupData
              .map((json) => UserGroupModel.fromJson(json))
              .toList();

          return userGroups;
        } else {
          throw Exception('User group data is null or invalid');
        }
      } else {
        throw Exception('Failed to load user group: ${response.statusCode}');
      }
    } catch (e) {
      fatal('Error fetching user group: $e');
      throw Exception('Failed to load user group');
    }
  }
}
