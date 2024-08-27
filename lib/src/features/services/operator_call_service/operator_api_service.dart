import 'package:dio/dio.dart';
import 'package:qbox_mobile/src/core/models/operator_call/operator_models/upload_model.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/models/operator_call/static_config/new_model/static_model.dart';

class OperatorService {
  const OperatorService._();

  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      followRedirects: true,
      maxRedirects: 5,
    );

  static Future<UploadModel?> upload({
    required String filePath,
    required String type,
  }) async {
    try {
      final formData = FormData.fromMap({
        'type': type,
        'file': await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post(
        '/upload/',
        data: formData,
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        return UploadModel.fromJson(responseData);
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Failed to upload image');
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
      throw Exception('Failed to get static config $e');
    }
  }
}
