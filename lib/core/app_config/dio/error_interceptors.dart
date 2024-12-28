import 'package:dio/dio.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  ErrorInterceptors();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    //TODO: if 401(unauthorised) logout the user from app. maybe redirect to login
    super.onError(err, handler);
  }
}
