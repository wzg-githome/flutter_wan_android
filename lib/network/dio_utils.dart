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
  final String _post = "POST";
  final String _get = "GET";

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

  _request<T>(
      {required String url,
      dynamic params,
      required String method,
      required bool isList,
      required Function(HttpError err) onFiled,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    ///err
    HttpError err = HttpError();

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

      ///
      if (response != null && response.statusCode == 200) {
        BaseEntity entity = BaseEntity.fromJson(response.data);
        if (entity.errorCode == 0) {
          if (isList) {
            ///list<Bean>
            return EntityFactory.generateOBJList<T>(entity.data);
          } else {
            ///bean
            return EntityFactory.generateOBJ<T>(entity.data);
          }
        } else {
          ///err
          err.errCode = entity.errorCode;
          err.errMsg = entity.errorMsg;

          ///log
          AceLog.e(msg: "_request*onFile(1): ${err.toString()}");
          onFiled(err);
        }
      } else {
        ///err
        err.errCode = response?.statusCode;
        err.errMsg = "statusCode 不是200，注意分析异常信息";

        ///log
        AceLog.e(msg: "_request*onFile(2): ${err.toString()}");
        onFiled(err);
      }
    } catch (e) {
      err.e = e;

      ///log
      AceLog.e(msg: "_request*onFile(3): ${err.toString()}");
      onFiled(err);

      ///handler err
      NetworkProcessFactory.handlerException(e);
    } finally {}
    return null;
  }

  post<T>(String url, Map<String, String>? map,
      {required Function(T?) onSuccess,
      required Function(HttpError err) onFile}) async {
    try {
      T? data = await _request<T>(
          url: url, method: _post, params: map, isList: false, onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.e = e;

      ///log
      AceLog.e(msg: "post*onFiled: ${error.toString()}");
      onFile(error);
    }

    // HttpError err = HttpError();
    // try {
    //   Response<dynamic>? response =
    //       await _request(url: url, method: "POST", params: map);
    //   if (response != null && response.statusCode == 200) {
    //     BaseEntity entity = BaseEntity.fromJson(response.data);
    //     if (entity.errorCode == 0) {
    //       T? data = EntityFactory.generateOBJ<T>(entity.data);
    //       onSuccess(data);
    //     } else {
    //       err.errCode = entity.errorCode;
    //       err.errMsg = entity.errorMsg;
    //       //log
    //       AceLog.e(msg: "onFile: ${err.toString()}");
    //       onFile(err);
    //     }
    //   }
    // } catch (e) {
    //   err.e = e;
    //   //log
    //   AceLog.e(msg: "onFile: ${err.toString()}");
    //   onFile(err);
    // }
  }

  get<T>(String url, Map<String, String>? map,
      {required Function(T?) onSuccess,
      required Function(HttpError err) onFile}) async {
    try {
      T? data = await _request<T>(
          url: url, method: _get, params: map, isList: false, onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.e = e;

      ///log
      AceLog.e(msg: "get*onFiled: ${error.toString()}");
      onFile(error);
    }

    // HttpError err = HttpError();
    // try {
    //   Response<dynamic>? response = await _request(
    //       url: url, method: "GET", params: map /*, callback: null*/);
    //   if (response != null && response.statusCode == 200) {
    //     BaseEntity entity = BaseEntity.fromJson(response.data);
    //     if (entity.errorCode == 0) {
    //       T? data = EntityFactory.generateOBJ<T>(entity.data);
    //       onSuccess(data);
    //     } else {
    //       err.errCode = entity.errorCode;
    //       err.errMsg = entity.errorMsg;
    //       //log
    //       AceLog.e(msg: "onFile: ${err.toString()}");
    //       onFile(err);
    //     }
    //   }
    // } catch (e) {
    //   err.e = e;
    //   //log
    //   AceLog.e(msg: "onFile: ${err.toString()}");
    //   onFile(err);
    // }
  }

  postList<T>(String url, Map<String, String>? map,
      {required Function(List<T?>?) onSuccess,
      required Function(HttpError err) onFile}) async {
    try {
      List<T?>? data = await _request<T>(
          url: url, method: _post, params: map, isList: true, onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.e = e;

      ///log
      AceLog.e(msg: "postList*onFiled: ${error.toString()}");
      onFile(error);
    }
  }

  getList<T>(String url, Map<String, String>? map,
      {required Function(List<T?>?) onSuccess,
      required Function(HttpError err) onFile}) async {
    try {
      List<T?>? data = await _request<T>(
          url: url, method: _get, params: map, isList: true, onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.e = e;

      ///log
      AceLog.e(msg: "getList*onFiled: ${error.toString()}");
      onFile(error);
    }
  }
}
