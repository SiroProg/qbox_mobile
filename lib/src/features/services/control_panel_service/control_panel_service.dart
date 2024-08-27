import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/models/control_panel_models/call_operator_model.dart';
import '../../../core/models/control_panel_models/call_team_model.dart';
import '../../../core/models/control_panel_models/missed_calls_model.dart';
import '../../../core/models/control_panel_models/perfomens_model.dart';
import '../../../core/models/control_panel_models/status_model.dart';
import '../../../core/models/control_panel_models/сonversation_model.dart';
import '../../../core/utils/logger.dart';
import '../db_service/db_service.dart';

class ControlPanelService {
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: 'application/json',
      followRedirects: true,
      maxRedirects: 5,
    );

  Future<CallTeamModel> fetchCallTeams() async {
    try {
      final response = await _dio.get(
        '/api/calls/workspace/redirects/teams',
        queryParameters: {
          'token': DBService.token,
        },
      );

      if (response.statusCode == 200 && response.data['_success']) {
        return CallTeamModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load call teams');
      }
    } catch (e) {
      print('Error fetching call teams: $e');
      rethrow;
    }
  }

  Future<List<CallOperatorModel>> fetchOperators() async {
    try {
      final response = await _dio.get(
        '/api/calls/workspace/redirects/operators',
        queryParameters: {
          'media': 'video',
          'token': DBService.token,
        },
      );

      if (response.statusCode == 200 && response.data['_success']) {
        List operatorsJson = response.data['data']['operators'];
        return operatorsJson
            .map((json) => CallOperatorModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load operators');
      }
    } catch (e) {
      print('Error fetching operators: $e');
      rethrow;
    }
  }

  Future<List<Call>> fetchMissedCalls({
    String? dateKey,
    int? operatorId,
    required int page,
    required int limit,
  }) async {
    dateKey =
        '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';
    operatorId = DBService.id;
    try {
      final response = await _dio.get(
        '/api/calls/operators/me/missed/',
        queryParameters: {
          'date_key': dateKey,
          'operator_id': operatorId,
          'page': page,
          'limit': limit,
          'token': DBService.token,
        },
      );

      if (response.statusCode == 200 && response.data['_success']) {
        List callsJson = response.data['data'] as List;
        return callsJson.map((json) => Call.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load missed calls');
      }
    } catch (e) {
      print('Error fetching missed calls: $e');
      rethrow;
    }
  }

  Future<List<ConversationModel>> fetchConversations({
    String? interval,
    int? operatorId,
    required int page,
    required int limit,
  }) async {
    interval =
        '${'${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}'}T00:00:00..${'${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}'}T23:59:59';
    operatorId = DBService.id;
    try {
      final response = await _dio.get(
        '/api/calls/workspace/conversations',

        queryParameters: {
          'interval': interval,
          'operator_id': operatorId,
          'page': page,
          'limit': limit,
          'token': DBService.token,
        },
      );

      print('$interval $operatorId $page $limit ${DBService.token}');

      if (response.statusCode == 200 && response.data["_success"]) {
        List conversationsJson = response.data["data"]["conversations"];
        info(conversationsJson
            .map((json) => ConversationModel.fromJson(json))
            .toList());
        info('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n');
        return conversationsJson
            .map((json) => ConversationModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load conversations');
      }
    } catch (e) {
      print('Error fetching conversations: $e');
      rethrow;
    }
  }

  Future<PerformanceModel> fetchOperatorPerformance() async {
    try {
      final response = await _dio
          .get('/api/calls/operators/me/performance', queryParameters: {
        'token': DBService.token,
      });

      if (response.statusCode == 200) {
        return PerformanceModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load operator performance');
      }
    } catch (e) {
      print('Error fetching operator performance: $e');
      rethrow;
    }
  }

  Future<List<Status>> fetchOperatorStatuses() async {
    try {
      final response =
          await _dio.get('/api/calls/operators/statuses', queryParameters: {
        'token': DBService.token,
      });

      if (response.statusCode == 200 && response.data["_success"]) {
        List statusesJson = response.data["statuses"];
        return statusesJson.map((json) => Status.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load operator statuses');
      }
    } catch (e) {
      print('Error fetching operator statuses: $e');
      rethrow;
    }
  }
}
