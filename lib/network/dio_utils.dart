import 'package:dio/dio.dart';
import 'package:flutter_wan_android/network/entity/base_entity.dart';
import 'package:flutter_wan_android/network/constant.dart';
import 'package:flutter_wan_android/network/network_process_factroy.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';

import 'entity/entity_factory.dart';
import 'entity/http_error.dart';

///dio封装
class DioUtils {
  Dio? _dio;

  static DioUtils getInstance() => DioUtils._internal();

  final int _timeout = 30000;

  DioUtils._internal() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: Constant.baseUrl,
          connectTimeout: _timeout,
          receiveTimeout: _timeout,
          sendTimeout: _timeout,
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
      required Function(HttpError err) onFile}) async {
    HttpError err = HttpError();
    try {
      Response<dynamic>? response =
          await _request(url: url, method: "POST", params: map);
      if (response != null && response.statusCode == 200) {
        BaseEntity entity = BaseEntity.fromJson(response.data);
        if (entity.errorCode == 0) {
          T? data = EntityFactory.generateOBJ<T>(entity.data);
          onSuccess(data);
        } else {
          err.errCode = entity.errorCode;
          err.errMsg = entity.errorMsg;
          //log
          AceLog.e(msg: "onFile: ${err.toString()}");
          onFile(err);
        }
      }
    } catch (e) {
      err.e = e;
      //log
      AceLog.e(msg: "onFile: ${err.toString()}");
      onFile(err);
    }
  }

  get<T>(String url, Map<String, String> map, Function(T?) onSuccess,
      Function(HttpError err) onFile) async {
    HttpError err = HttpError();
    try {
      Response<dynamic>? response = await _request(
          url: url, method: "GET", params: map /*, callback: null*/);
      if (response != null && response.statusCode == 200) {
        BaseEntity entity = BaseEntity.fromJson(response.data);
        if (entity.errorCode == 0) {
          T? data = EntityFactory.generateOBJ<T>(entity.data);
          onSuccess(data);
        } else {
          err.errCode = entity.errorCode;
          err.errMsg = entity.errorMsg;
          //log
          AceLog.e(msg: "onFile: ${err.toString()}");
          onFile(err);
        }
      }
    } catch (e) {
      err.e = e;
      //log
      AceLog.e(msg: "onFile: ${err.toString()}");
      onFile(err);
    }
  }
}
