import 'package:dio/dio.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';
import 'package:qbox_mobile/src/core/models/search_models/customer_model.dart';
import 'package:qbox_mobile/src/core/models/search_models/task_model.dart';
import 'package:qbox_mobile/src/core/models/search_models/user_model.dart';
import 'package:qbox_mobile/src/core/utils/custom_inteeceptor.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';

class SearchService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: true,
      maxRedirects: 5,
    )
    ..interceptors.add(const CustomInterceptor());

  static Future<List<UserModel>> searchUser(String? query) async {
    try {
      final response = await _dio.get(
        '/api/staff/employees/search',
        queryParameters: {
          'action': 'search',
          'query': query,
          'page': 1,
          'limit': 300,
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['items'];
        return responseData.map((json) => UserModel.fromJson(json)).toList();
      } else {
        warning('Failed to get users');
        throw Exception('Failed to get users');
      }
    } catch (e) {
      fatal('Failed to get users');
      throw Exception('Failed to get users $e');
    }
  }

  static Future<List<CustomerModel>> searchCustomer(String? query) async {
    try {
      final response = await _dio.get(
        '/api/customers/search',
        queryParameters: {
          'action': 'search',
          'query': query,
          'page': 1,
          'limit': 300,
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['items'];
        return responseData
            .map((json) => CustomerModel.fromJson(json))
            .toList();
      } else {
        warning('Failed to get customers');
        throw Exception('Failed to get customers');
      }
    } catch (e) {
      fatal('Failed to get customers');
      throw Exception('Failed to get customers $e');
    }
  }

  static Future<List<TaskModel>> searchTask(String? query) async {
    try {
      final response = await _dio.get(
        '/api/tasks/search',
        queryParameters: {
          'action': 'search',
          'query': query,
          'page': 1,
          'limit': 300,
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['items'];
        return responseData.map((json) => TaskModel.fromJson(json)).toList();
      } else {
        warning('Failed to get tasks');
        throw Exception('Failed to get tasks');
      }
    } catch (e) {
      fatal('Failed to get tasks');
      throw Exception('Failed to get tasks $e');
    }
  }
}
