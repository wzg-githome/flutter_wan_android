import 'package:dio/dio.dart';
import 'package:flutter_wan_android/newwork/constant.dart';

///dio封装
class DioUtils {
  Dio? _dio;
  static DioUtils instance = DioUtils._internal();

  final int _timeout = 30;

  DioUtils._internal() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: Constant.baseUrl,
          connectTimeout: _timeout,
          receiveTimeout: _timeout,
          responseType: ResponseType.json,
          contentType: Headers.jsonContentType);
      _dio = Dio(options);
      if (Constant.isDebug) {
        _dio?.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }
}
