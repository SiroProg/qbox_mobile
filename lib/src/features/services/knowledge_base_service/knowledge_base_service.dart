import 'dart:async';

import 'package:dio/dio.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/new/kbase_data_model.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/new/kbase_item_model.dart';
import 'package:qbox_mobile/src/core/models/knowledge_base/project_model.dart';

import 'package:qbox_mobile/src/core/models/knowledge_base/responses_group_model.dart';
import 'package:qbox_mobile/src/core/utils/custom_inteeceptor.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';

class KnowledgeBaseService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: true,
      maxRedirects: 5,
    )
    ..interceptors.add(const CustomInterceptor());

  static Future<List<ProjectModel>> getProjects() async {
    try {
      final response = await _dio.get('/api/okbase/projects/');

      if (response.statusCode == 200) {
        final List responseData = response.data['projects'];
        return responseData.map((json) => ProjectModel.fromJson(json)).toList();
      } else {
        warning('Failed to get projects');
        throw Exception('Failed to get projects:');
      }
    } catch (e) {
      fatal('Failed to get projects');
      throw Exception('Failed to get projects: $e');
    }
  }

  static Future<List<ResponsesGroupModel>> getResponseGroupModel({
    required int projectId,
    required int parentId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/okbase/groups/project/$projectId',
        queryParameters: <String, Object?>{
          'with_child': 'true',
          'response_group': '{}',
          'order': 'parent_id',
          'mark': 'asc',
          'limit': '1000',
          'parent_id': parentId,
        },
      );

      if (response.statusCode == 200) {
        final List responseData = response.data['responses_groups'];
        return responseData
            .map((json) => ResponsesGroupModel.fromJson(json))
            .toList();
      } else {
        warning('Failed to get responses_groups');
        throw Exception('Failed to get responses_groups:');
      }
    } catch (e) {
      fatal('Failed to get responses_groups');

      throw Exception('Failed to get responses_groups: $e');
    }
  }

  /* static Future<List<ResponseModel>> getResponseModel({
    required int projectId,
    required int categoryId,
  }) async {
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
        warning('Failed to get responses');
        throw Exception('Failed to get responses:');
      }
    } catch (e) {
      fatal('Failed to get responses');
      throw Exception('Failed to get responses: $e');
    }
  }

  static Future<List<ResponseQueryModel>> searchResponse(String? query) async {
    try {
      final response = await _dio.get(
        '/api/okbase/response/',
        queryParameters: <String, Object?>{
          'limit': 50,
          'page': 1,
          'query': query,
        },
      );

      if (response.statusCode == 200) {
        final List responseData = response.data['response'];
        return responseData
            .map((json) => ResponseQueryModel.fromJson(json))
            .toList();
      } else {
        warning('Failed to get response');
        throw Exception('Failed to get response:');
      }
    } catch (e) {
      fatal('Failed to get response');
      throw Exception('Failed to get response: $e');
    }
  } */

  static Future<List<KbaseItemModel>> getKBaseItem() async {
    try {
      final response = await _dio.get(
        '/api/kbase_new/collections',
        queryParameters: <String, int>{'limit': 1000},
      );

      if (response.statusCode == 200) {
        List responseData = response.data['items'];
        return responseData
            .map((json) => KbaseItemModel.fromJson(json))
            .toList();
      } else {
        warning('Failed to get kBaseItem');
        throw Exception('Failed to get kBaseItem:');
      }
    } catch (e) {
      fatal('Failed to get kBaseItem');
      throw Exception('Failed to get kBaseItem: $e');
    }
  }

  // https://inqbox.q19.kz/api/kbase_new/pages?limit=1000&collection_id=35&parent_id=0&lang=3

  // static Future<List<KbaseDataModel>> getKBaseData({
  //   required int collectionId,
  //   required int parentId,
  //   int lang = 3,
  // }) async {
  //   try {
  //     final response = await _dio.get(
  //       '/api/kbase_new/pages',
  //       queryParameters: <String, Object?>{
  //         'limit': 1000,
  //         'collection_id': collectionId,
  //         'parent_id': parentId,
  //         'lang': lang,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       List responseData = response.data['items'];

  //       final data = responseData
  //           .map((json) => KbaseDataModel.fromJson(json, 0))
  //           .toList();

  //       List<Future<KbaseDataModel>> futures = data.map((item) async {
  //         int count = await getChildrenCount(
  //           collectionId: item.collectionId,
  //           parentId: item.id,
  //           langId: lang,
  //         );

  //         item.childAmount = count;
  //         return item;
  //       }).toList();

  //       return await Future.wait(futures);
  //     } else {
  //       warning('Failed to get kBaseData');
  //       throw Exception('Failed to get kBaseData: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     fatal('Failed to get kBaseData: $e');
  //     throw Exception('Failed to get kBaseData: $e');
  //   }
  // }

  static Future<List<KbaseDataModel>> getKBaseData({
    required int collectionId,
    required int parentId,
    int lang = 3,
  }) async {
    try {
      final response = await _dio.get(
        '/api/kbase_new/pages',
        queryParameters: <String, Object?>{
          'limit': 1000,
          'collection_id': collectionId,
          'parent_id': parentId,
          'lang': lang,
        },
      );

      if (response.statusCode == 200) {
        List responseData = response.data['items'];

        final data = responseData
            .map((json) => KbaseDataModel.fromJson(json, 0))
            .toList();

        const int batchSize = 10;

        List<KbaseDataModel> result = [];

        for (int i = 0; i < data.length; i += batchSize) {
          final batch = data.sublist(
              i, i + batchSize > data.length ? data.length : i + batchSize);

          List<Future<KbaseDataModel>> futures = batch.map((item) async {
            int count = await getChildrenCount(
              collectionId: item.collectionId,
              parentId: item.id,
              langId: lang,
            );

            item.childAmount = count;
            return item;
          }).toList();

          result.addAll(await Future.wait(futures));
        }

        return result;
      } else {
        warning('Failed to get kBaseData');
        throw Exception('Failed to get kBaseData: ${response.statusCode}');
      }
    } catch (e) {
      fatal('Failed to get kBaseData: $e');
      throw Exception('Failed to get kBaseData: $e');
    }
  }

  static Future<int> getChildrenCount({
    required int collectionId,
    required int parentId,
    required int langId,
  }) async {
    try {
      final response = await _dio.get(
        '/api/kbase_new/pages',
        queryParameters: <String, int>{
          'limit': 1000,
          'collection_id': collectionId,
          'parent_id': parentId,
          'lang': langId,
        },
      );
      warning("qwas${response.data}");
      if (response.statusCode == 200) {
        List items = response.data['items'];
        return items.length;
      } else {
        throw Exception('Failed to get items length: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get items length: $e');
    }
  }

  static Future<String> jsonToHtml(int pageId, String accessType) async {
    try {
      final response = await _dio.get(
        '/api/kbase_new/converters/',
        queryParameters: <String, Object?>{
          'page_id': pageId,
          'access_type': accessType,
        },
      );
      if (response.statusCode == 200) {
        return response.data['result'];
      } else {
        warning('Failed to get html');
        throw Exception('Failed to get html');
      }
    } catch (e) {
      fatal('Failed to get html');
      throw Exception('Failed to get html $e');
    }
  }

  static Future<List<KbaseDataModel>> searchItem({
    required int collectionID,
    required int langId,
    required String q,
  }) async {
    try {
      final response = await _dio.get(
        '/api/kbase_new/pages/',
        queryParameters: <String, Object?>{
          'limit': 1000,
          'collection_id': collectionID,
          'lang': langId,
        },
      );
      if (response.statusCode == 200) {
        List responseData = response.data['items'];

        return responseData
            .map((json) => KbaseDataModel.fromJson(json, 0))
            .toList();
      } else {
        warning('Failed to get kBaseItem');
        throw Exception('Failed to get kBaseItem:');
      }
    } catch (e) {
      fatal('Failed to get kBaseItem');
      throw Exception('Failed to get kBaseItem: $e');
    }
  }

  // Future<String> parentName(int pageId) async {
  //   try {
  //     final response = await _dio.get(
  //       '/api/kbase_new/pages',
  //       queryParameters: <String, Object?>{
  //         'limit': 1000,
  //         'page_id': pageId,
  //         'action': 'get_parents',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return response.data['parents'][0]['title'];
  //     }
  //   } catch (e) {
  //     return '';
  //   }
  // }
}
