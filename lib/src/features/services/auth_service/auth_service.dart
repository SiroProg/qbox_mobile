import 'package:dio/dio.dart';

import '../../../core/constants/config.dart';
import '../../../core/utils/logger.dart';

class AuthService{
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: Config.baseUrl,
      contentType: 'application/json',
      followRedirects: true,
      maxRedirects: 5,
    );


  static Future<String?> resetPassword(String login) async {
    try {
      final formData = FormData.fromMap({'login': login});
      Response response =
      await _dio.post('/admin/login/restore/', data: formData);
      if (!response.data['success']) {
        return response.data['reason'];
      } else {
        return null;
      }
    } catch (e) {
      fatal('Error occurred: $e');
      return null;
    }
  }


  static Future<Map<String, dynamic>?> postLogin(
      String login, String password) async {
    try {
      Map<String, String> data = {
        'username': login,
        'password': password,
      };

      Response response = await _dio.post('/api/auth/login', data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        warning('Request failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      fatal('Error occurred: $e');
      return null;
    }
  }
}