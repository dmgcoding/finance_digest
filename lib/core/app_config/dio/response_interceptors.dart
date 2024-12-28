import 'package:dio/dio.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //TODO: convert response if needed
    super.onResponse(response, handler);
  }
}
