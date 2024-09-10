import 'package:dio/dio.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/project_model.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/response_model.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/responses_group_model.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';

class ClassName {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: true,
      maxRedirects: 5,
    )
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          "X-Api-Token": DBService.token,
        });

        info('Request to ${options.uri} with headers ${options.headers}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        info('Response: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        fatal(
            'Error occurred: ${error.response?.statusCode} ${error.response?.statusMessage}');
        return handler.next(error);
      },
    ));

  static Future<List<ProjectModel>> getProjects() async {
    try {
      final response = await _dio.get('/api/okbase/projects/');

      if (response.statusCode == 200) {
        final List responseData = response.data['projects'];
        return responseData.map((json) => ProjectModel.fromJson(json)).toList();
      } else {
        info('Failed to get projects');
        throw Exception('Failed to get projects:');
      }
    } catch (e) {
      info('Failed to get projects');
      throw Exception('Failed to get projects: $e');
    }
  }

  static Future<List<ResponsesGroupModel>> getResponseGroupModel(
      int projectId) async {
    try {
      final response = await _dio.get(
        '/api/okbase/groups/project/$projectId',
        queryParameters: {
          'with_child': 'true',
          'response_group': '{}',
          'order': 'parent_id',
          'mark': 'asc',
          'limit': '1000',
          'parent_id': '0',
        },
      );

      if (response.statusCode == 200) {
        final List responseData = response.data['responses_groups'];
        return responseData
            .map((json) => ResponsesGroupModel.fromJson(json))
            .toList();
      } else {
        info('Failed to get responses_groups');
        throw Exception('Failed to get responses_groups:');
      }
    } catch (e) {
      info('Failed to get responses_groups');
      throw Exception('Failed to get responses_groups: $e');
    }
  }

  static Future<List<ResponseModel>> getResponseModel(
      int projectId, int categoryId) async {
    try {
      final response = await _dio.get(
        '/api/okbase/responses/project/$projectId',
        queryParameters: <String, int>{
          'category_id': categoryId,
          'limit': 1000,
        },
      );

      if (response.statusCode == 200) {
        final List responseData = response.data['responses'];
        return responseData
            .map((json) => ResponseModel.fromJson(json))
            .toList();
      } else {
        info('Failed to get responses');
        throw Exception('Failed to get responses:');
      }
    } catch (e) {
      info('Failed to get responses');
      throw Exception('Failed to get responses: $e');
    }
  }
}
