import 'package:dio/dio.dart';
import 'package:qbox_mobile/src/core/utils/logger.dart';
import 'package:qbox_mobile/src/features/services/db_service/db_service.dart';

class CustomInterceptor extends Interceptor {
  const CustomInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"X-Api-Token": DBService.token});
    info('''
------------------------------------------------------------
        === Request (${options.method}) === 
        === Url: ${options.uri} ===
        === Headers: ${options.headers} ===
        === Data: ${options.data}
------------------------------------------------------------''');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    info('''
\x1B[32m------------------------------------------------------------
\x1B[32m=== Response (${response.statusCode}) === 
\x1B[32m=== Url: ${response.realUri} ===
\x1B[32m=== Method (${response.requestOptions.method}) ===
\x1B[32m=== Data: ${response.data}
\x1B[32m------------------------------------------------------------''');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    info('''
\x1B[31m------------------------------------------------------------
\x1B[31m=== Error (${err.response?.statusCode}) === 
\x1B[31m=== Url: ${err.response?.realUri} ===
\x1B[31m=== Method (${err.response?.requestOptions.method}) ===
\x1B[31m=== Data: ${err.response?.data}
\x1B[31m------------------------------------------------------------''');
    super.onError(err, handler);
  }
}
