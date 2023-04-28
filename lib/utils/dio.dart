import 'dart:developer';

import 'package:dio/dio.dart';
import './constansts.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  late Dio _dio;

  DioClient._internal() {
    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: 'https://${Constants.apiUrl}/api/${Constants.version}',
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
    );
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // Add Authentication token to request header

        // Log request details
        log('Request URL: ${options.uri.toString()}');
        log('Request body: ${options.data}');

        // Proceed with request
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // Log response details
        log('Response status code: ${response.statusCode}');
        log('Response headers: ${response.headers}');
        log('Response body: ${response.data}');

        // Proceed with response
        return handler.next(response);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        // Log error details
        log('Error status code: ${error.response?.statusCode}');
        log('Error message: ${error.message}');

        // Proceed with error
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;
}
