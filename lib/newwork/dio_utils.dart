import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wan_android/newwork/base_entity.dart';
import 'package:flutter_wan_android/newwork/constant.dart';
import 'package:flutter_wan_android/newwork/network_callback.dart';
import 'package:flutter_wan_android/newwork/network_process_factroy.dart';

import 'entity_factory.dart';
import 'http_err.dart';

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

  Future<Response<T>?> _request<T>(
      {required String url,
      dynamic params,
      required String method,
      // NetworkCallback? callback,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    // callback?.onStart();
    late Response<T>? response;
    try {
      if (method == "GET") {
        response = await _dio?.request<T>(url, queryParameters: params);
      } else if (method == "POST") {
        FormData data = FormData.fromMap(params);
        response = await _dio?.post<T>(url,
            data: data,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
      } else {
        throw Exception("没有实现$method！！！！");
      }
    } catch (e) {
      NetworkProcessFactory.handlerException(e);
    } finally {
      // callback?.onFinish();
    }

    return response;
  }

  post<T>(String url, Map<String, String>? map,
      {required Function(T?) onSuccess,
      required Function(HttpErr err) onFile}) async {
    try {
      Response<dynamic>? response =
          await _request(url: url, method: "POST", params: map);
      HttpErr err = HttpErr();
      if (response != null) {
        BaseEntity entity = BaseEntity.fromJson(response.data);
        if (entity.code == "0") {
          T? data = EntityFactory.generateOBJ<T>(entity.data);
          onSuccess(data);
        } else {
          err.code = entity.code;
          err.msg = entity.message;
          onFile(err);
        }
      }
    } catch (e) {
      HttpErr err = HttpErr();
      err.e = e;
      onFile(err);
    }
  }

  get<T>(String url, Map<String, String> map, Function(T?) onSuccess,
      Function(HttpErr err) onFile) async {
    try {
      Response<dynamic>? response = await _request(
          url: url, method: "GET", params: map /*, callback: null*/);
      HttpErr err = HttpErr();
      if (response != null) {
        BaseEntity entity = BaseEntity.fromJson(response.data);
        if (entity.code == "0") {
          T? data = EntityFactory.generateOBJ<T>(entity.data);
          onSuccess(data);
        } else {
          err.code = entity.code;
          err.msg = entity.message;
          onFile(err);
        }
      }
    } catch (e) {
      HttpErr err = HttpErr();
      err.e = e;
      onFile(err);
    }
  }
}
