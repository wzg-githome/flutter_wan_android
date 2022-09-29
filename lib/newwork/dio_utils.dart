import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wan_android/newwork/constant.dart';
import 'package:flutter_wan_android/newwork/network_process_factroy.dart';

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


  Future _request<T>(
      {required String url, dynamic params, required String method, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
    try {
      late Response<T>? response;

      if (method == "GET") {
        response = await _dio?.request<T>(url, queryParameters: params);
      } else if (method == "POST") {
        FormData data = FormData.fromMap(params);
        response = await _dio?.post(url, data: data,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
      } else {
        throw Exception("没有");
      }
    } catch (e) {
      NetworkProcessFactory.handlerException(e);
    } finally {

    }
  }
}
