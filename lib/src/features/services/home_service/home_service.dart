import 'package:dio/dio.dart';

import '../../../core/constants/config.dart';
import '../../../core/models/auth_models/employee_model.dart';

class HomeService{
  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: Config.baseUrl,
      contentType: 'application/json',
      followRedirects: true,
      maxRedirects: 5,
    );


  Future<Employee> fetchEmployee(String token) async {
    try {
      final response =
      await _dio.get('/api/staff/employees/me', queryParameters: {
        'Content-Type': 'application/json',
        'token': token,
      });

      if (response.statusCode == 200) {
        final data = response.data['data']['employee'];
        return Employee.fromJson(data);
      } else {
        throw Exception('Failed to load employee data');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

}