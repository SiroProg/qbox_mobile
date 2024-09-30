import 'package:qbox_mobile/src/core/models/operator_call/fast_message/fast_message_model.dart';
import 'package:qbox_mobile/src/core/models/operator_call/static_config/new_model/reason_model.dart';
import 'package:qbox_mobile/src/core/models/operator_call/operator_models/upload_model.dart';
import 'package:qbox_mobile/src/core/models/operator_call/fields/card_item_model.dart';
import 'package:qbox_mobile/src/core/models/operator_call/fields/task_data_model.dart';
import '../../../core/models/operator_call/redirect_models/redirect_model.dart';
import '../../../core/models/operator_call/static_config/new_model/static_model.dart';
import 'package:qbox_mobile/src/core/models/operator_call/fields/fields_model.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';
import 'package:qbox_mobile/src/core/models/operator_call/folder_model.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import '../../../core/constants/api_constants.dart';
import 'package:dio/dio.dart';

class OperatorService {
  const OperatorService._();

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

  static Future<RedirectModel> getRedirectDetails(int operatorId) async {
    try {
      final response = await _dio.post(
          '/api/calls/workspace/redirects/operators/check/$operatorId',
          queryParameters: {
            'token': DBService.token,
          });

      if (response.statusCode == 200) {
        final responseData = response.data['data']['operator'];
        return RedirectModel.fromJson(responseData);
      } else {
        warning('Failed to get operator details');
        throw Exception('Failed to get operator details');
      }
    } catch (e) {
      fatal('Error getting operator details: $e');
      throw Exception('Error getting operator details: $e');
    }
  }

  static Future<UploadModel?> upload({
    required String filePath,
    required String type,
  }) async {
    try {
      final formData = FormData.fromMap({
        'type': type,
        'file': await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post('/upload/', data: formData);

      if (response.statusCode == 200) {
        final responseData = response.data;
        return UploadModel.fromJson(responseData);
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  static Future<StaticModel> getStaticConfig() async {
    try {
      final response = await _dio.get('/static/configs.json');

      if (response.statusCode == 200) {
        final responseData = response.data;
        return StaticModel.fromJson(responseData);
      } else {
        throw Exception('Failed to get static config');
      }
    } catch (e) {
      throw Exception('Failed to get static config: $e');
    }
  }

  static Future<List<ReasonModel>> getAllReasons() async {
    try {
      final response = await _dio.get(
        '/api/calls/workspace/reasons',
        queryParameters: <String, Object>{
          'limit': 500,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data']['reasons'];
        final reasons =
            responseData.map((json) => ReasonModel.fromJson(json)).toList();
        info(ReasonModel.sortReasons(reasons));

        return ReasonModel.sortReasons(reasons);
      } else {
        fatal('Failed to get reasons');
        throw Exception('Failed to get reasons');
      }
    } catch (e) {
      throw Exception('Failed to get reasons: $e');
    }
  }

  static Future<List<FolderModel>> getFolder() async {
    try {
      final response = await _dio.get(
        '/api/forms/folders',
        queryParameters: <String, Object?>{
          'limit': 1000,
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['data'];
        final folders =
            responseData.map((json) => FolderModel.fromJson(json)).toList();
        return folders;
      } else {
        warning('Failed to get folders');
        throw Exception('Failed to get folders');
      }
    } catch (e) {
      fatal('Failed to get folders: $e');
      throw Exception('Failed to get folders: $e');
    }
  }

  static Future<List<FormFieldModel>> getFieldsById(int id) async {
    try {
      final response = await _dio.get(
        '/api/forms/$id/fields',
        queryParameters: <String, Object>{
          'limit': 1000,
        },
      );

      info(response.realUri);

      if (response.statusCode == 200) {
        List responseData = response.data['fields'] as List;
        final fields =
            responseData.map((json) => FormFieldModel.fromJson(json)).toList();

        return fields;
      } else {
        warning('Failed to get fields: ${response.statusCode}');
        throw Exception(
            'Failed to get fields with status code ${response.statusCode}');
      }
    } catch (e) {
      fatal('Failed to get fields: $e');
      throw Exception('Failed to get fields: $e');
    }
  }

  static Future<List<CardItemModel>> getCardItem(String key) async {
    try {
      final response = await _dio.get(
        '/api/catalog',
        queryParameters: <String, Object?>{
          'limit': 100,
          'key': key,
          'parent_id': 0,
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['items'];
        final cardItem =
            responseData.map((json) => CardItemModel.fromJson(json)).toList();

        return cardItem;
      } else {
        warning('Failed to get items');
        throw Exception('Failed to get items');
      }
    } catch (e) {
      fatal('Failed to get items: $e');
      throw Exception('Failed to get items: $e');
    }
  }

  static Future<bool> createTask(TaskDataModel task) async {
    try {
      final response = await _dio.post(
        '/api/projects/0/tasks/create_task',
        data: {
          'task': task.toJson(),
        },
      );

      if (response.statusCode == 200) {
        info('Task created successfully');
        info(response.data);
        return true;
      } else {
        warning('Failed to post task');
        return false;
      }
    } catch (e) {
      fatal('Failed to post task: $e');
      return false;
    }
  }

  static Future<List<FastMessageModel>> getFastMessage(int langId) async {
    try {
      final response = await _dio.get(
        '/api/tips/',
        queryParameters: <String, int>{
          'limit': 1000,
          'lang': langId,
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['result'];
        info('');
        return responseData
            .map((json) => FastMessageModel.fromJson(json))
            .toList();
      } else {
        info('Failed to get fast message');
        throw Exception('Failed to get fast message:');
      }
    } catch (e) {
      throw Exception('Failed to get fast message: $e');
    }
  }
}
