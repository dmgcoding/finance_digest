import 'package:dio/dio.dart';
import 'package:finance_digest/core/api_endpoints/api_endpoints.dart';

import 'error_interceptors.dart';
import 'request_interceptors.dart';
import 'response_interceptors.dart';

class DioClient {
  late Dio _dio;

  DioClient._internal() {
    _dio = Dio();

    _dio.options.baseUrl = apiBaseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.contentType = Headers.jsonContentType;

    _dio.options.headers = <String, dynamic>{
      'Accept': Headers.jsonContentType,
    };
    _dio.interceptors.addAll([
      LogInterceptor(),
      RequestInterceptors(),
      ResponseInterceptors(),
      ErrorInterceptors()
    ]);
  }

  static final DioClient _instance = DioClient._internal();

  factory DioClient() {
    return _instance;
  }

  Dio get dio => _dio;
}
