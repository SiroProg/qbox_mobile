import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/models/profile_models/calls_model.dart';
import '../../../core/models/profile_models/employee_by_id_model.dart';
import '../../../core/models/profile_models/log_model.dart';
import '../../../core/models/profile_models/position_model.dart';
import '../../../core/models/profile_models/skill_model.dart';
import '../db_service/db_service.dart';

class ProfileService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: 'application/json',
      followRedirects: true,
      maxRedirects: 5,
    );

  Future<List<LogModel>> fetchAuditData(String startDate) async {
    try {
      final response = await _dio.get('/api/audit', queryParameters: {
        'employee_id': DBService.id,
        'page': 1,
        'start_date': startDate,
        'stop_date': startDate,
        'token': DBService.token,
      });

      if (response.data["_success"]) {
        print(response.data);
        List logsJson = response.data["logs"];
        return logsJson.map((json) => LogModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load audit data');
      }
    } catch (e) {
      print('Error fetching audit data: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getEvents() async {
    try {
      final response = await _dio.get('/api/audit/events', queryParameters: {
        'token': DBService.token,
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load fixtures');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load fixtures');
    }
  }

  Future<Map<String, dynamic>> getActions() async {
    try {
      final response = await _dio.get('/api/audit/fixtures', queryParameters: {
        'token': DBService.token,
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load fixtures');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load fixtures');
    }
  }

  Future<List<SkillModel>> fetchEmployeeSkills(int employeeId) async {
    try {
      final response = await _dio
          .get('/api/staff/employees/$employeeId/skills', queryParameters: {
        'Content-Type': 'application/json',
        'token': DBService.token,
      });

      if (response.statusCode == 200) {
        final skillsData = response.data['data']['skills'] as List;
        List<SkillModel> skills =
            skillsData.map((data) => SkillModel.fromJson(data)).toList();
        return skills;
      } else {
        throw Exception('Failed to load employee skills');
      }
    } catch (e) {
      print('Error fetching employee skills: $e');
      rethrow;
    }
  }

  Future<CallsModel> fetchEmployeeCalls(int employeeId) async {
    try {
      final response = await _dio.get(
          '/api/staff/employees/$employeeId?action=calls',
          queryParameters: {
            'Content-Type': 'application/json',
            'token': DBService.token,
          });

      if (response.statusCode == 200) {
        final data = response.data['data']['employee'];
        return CallsModel.fromJson(data);
      } else {
        throw Exception('Failed to load employee calls data');
      }
    } catch (e) {
      print('Error fetching employee calls data: $e');
      rethrow;
    }
  }

  Future<PositionModel> fetchEmployeePosition(int id) async {
    try {
      final response =
          await _dio.get('/api/staff/employees/$id/position', queryParameters: {
        'Content-Type': 'application/json',
        'token': DBService.token,
      });

      if (response.statusCode == 200) {
        final positionData = response.data['data']['position'];
        return PositionModel.fromJson(positionData);
      } else {
        throw Exception('Failed to load employee position');
      }
    } catch (e) {
      print('Error fetching employee position: $e');
      rethrow;
    }
  }

  Future<EmployeeByIdModel> fetchEmployeeById(int id) async {
    try {
      final response = await _dio.get('/api/staff/employees/$id',
          queryParameters: {
            'Content-Type': 'application/json',
            'action': 'main',
            'token': DBService.token
          });
      print(DBService.token);
      if (response.statusCode == 200 && response.data['_success']) {
        final data = response.data['data']['employee'];
        print(EmployeeByIdModel.fromJson(data).management);
        return EmployeeByIdModel.fromJson(data);
      } else {
        throw Exception('Failed to load employee data');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
