import 'package:dio/dio.dart';
import 'package:finance_digest/core/const/api_keys.dart';

class RequestInterceptors extends InterceptorsWrapper {
  RequestInterceptors();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //add api key for requests
    options.headers['X-Finnhub-Token'] = finhubApiKey;
    super.onRequest(options, handler);
  }
}
