import 'package:dio/dio.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';
import 'package:qbox_mobile/src/core/models/task_models/status_model.dart';
import 'package:qbox_mobile/src/core/models/task_models/task_model.dart';

import 'package:qbox_mobile/src/core/utils/custom_inteeceptor.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';

class TaskService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: true,
      maxRedirects: 5,
    )
    ..interceptors.add(const CustomInterceptor());

  static Future<List<StatusModel>> getStatuses(int id) async {
    try {
      final response = await _dio.post(
        '/api/tickets',
        data: <String, Object>{
          "method": "tickets.get_commands",
          "params": <String, int>{"id": id}
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['result']['result']['all_statuses'];
        return responseData.map((json) => StatusModel.fromJson(json)).toList();
      } else {
        warning('Failed to get statuses');
        throw Exception('Failed to get statuses');
      }
    } catch (e) {
      fatal('Failed to get statuses');
      throw Exception('Failed to get statuses $e');
    }
  }

  static Future<TaskModel> getTask(int id) async {
    try {
      final response = await _dio.get('/api/task/$id');

      if (response.statusCode == 200) {
        info('Task succefully fetched');
        return TaskModel.fromJson(response.data);
      } else {
        warning('Failed to get tasks detail');
        throw Exception('Failed to get tasks detail');
      }
    } catch (e) {
      fatal('Failed to get tasks detail');
      throw Exception('Failed to get tasks detail $e');
    }
  }

  static Future<bool> deleteTask(int taskId) async {
    try {
      final response = await _dio.post(
        '/api/task/$taskId',
        data: <String, Object>{
          'action': 'delete_fully',
          'task': {},
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> archiveTask(int taskId) async {
    try {
      final response = await _dio.post(
        '/api/task/$taskId',
        data: <String, String>{'action': 'delete'},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
