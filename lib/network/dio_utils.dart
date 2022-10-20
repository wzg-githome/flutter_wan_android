import 'package:common_utils/common_utils.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_wan_android/config_center.dart';
import 'package:flutter_wan_android/network/constant.dart';
import 'package:flutter_wan_android/network/entity/base_entity.dart';
import 'package:flutter_wan_android/network/network_process_factroy.dart';
import 'package:flutter_wan_android/network/other/cookie_utils.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';

import 'entity/entity_factory.dart';
import 'entity/http_error.dart';
import 'other/coustom_log_interceptor.dart';

///dio封装
///1.支持动态url
class DioUtils {
  static const _tag = "DioUtils";

  // static var debug=false;

  static DioUtils getInstance() => DioUtils._internal();

  ///dio instance
  Dio? _dio;

  ///time out
  final int _timeout = 30000;

  ///post
  final String _post = "POST";

  ///get
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
            .add(CustomLogInterceptor(requestBody: true, responseBody: true));
      }
      if (ConfigCenter.openCookieManager) {
        _openCookieManager();
      }
    }
  }

  ///将cookie保存在文件中
  _openCookieManager() async {
    // var cookieJar = CookieJar();//默认cookie

    FileStorage _storage = FileStorage(await CookieUtils.getCookieFilePath());
    LogUtil.d("_storage.dir:\t${_storage.dir}", tag: _tag);
    var _persistCookieJar = PersistCookieJar(storage: _storage); //持久化cookie
    var loadForRequest =
        await _persistCookieJar.loadForRequest(Uri.parse(Constant.baseUrl));
    LogUtil.d("cookie:\t${loadForRequest.toString()}", tag: _tag);
    _dio?.interceptors.add(CookieManager(_persistCookieJar));
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

    late Response? response;
    try {
      if (method == _get) {
        response = await _dio?.get(url, queryParameters: params);
      } else if (method == _post) {
        var data = params == null ? null : FormData.fromMap(params);
        response = await _dio?.post(url,
            data: data,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
      } else {
        throw Exception("没有实现$method！！！！");
      }

      ///
      if (response != null && response.statusCode == 200) {
        BaseEntity entity = BaseEntity.fromJson(response.data);
        if (entity.errorCode == 0 /* && entity.data != null*/) {
          ///beanList
          if (isList) {
            return (entity.data != null)
                ? EntityFactory.generateOBJList<T>(entity.data)
                : null;
          }

          ///bean
          return (entity.data != null)
              ? EntityFactory.generateOBJ<T>(entity.data)
              : null;
        } else {
          ///err
          err.errCode = entity.errorCode;
          err.errMsg = entity.errorMsg;

          ///log
          AceLog.e(msg: "_request*onFile(1): url:$url\n ${err.toString()}");
          onFiled(err);
        }
      } else {
        ///err
        err.errCode = response?.statusCode;
        err.errMsg = "statusCode 不是200，注意分析异常信息";

        ///log
        AceLog.e(msg: "_request*onFile(2):  url:$url\n ${err.toString()}");
        onFiled(err);
      }
    } catch (e) {
      if (err.errMsg == null) {
        err.errMsg = e.toString();
      } else {
        err.e = e;
      }

      ///log
      AceLog.e(msg: "_request*onFile(3): url:$url\n ${err.toString()}");
      onFiled(err);

      ///handler err
      NetworkProcessFactory.handlerException(e);
    } finally {}
    return null;
  }

  post<T>(String url, Map<String, dynamic>? map, Function(T?) onSuccess,
      Function(HttpError err) onFile,
      {Map<String, dynamic>? appendUrlMap}) async {
    try {
      url = parseAppendURl(url, appendUrlMap);
      T? data = await _request<T>(
          url: url, method: _post, params: map, isList: false, onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.errMsg = e.toString();

      ///log
      AceLog.e(msg: "post*onFiled: url:$url\n ${error.toString()}");
      onFile(error);
    }
  }

  get<T>(String url, Function(T?) onSuccess, Function(HttpError err) onFile,
      {Map<String, dynamic>? paramsMap,
      Map<String, dynamic>? appendUrlMap}) async {
    try {
      url = parseAppendURl(url, appendUrlMap);
      T? data = await _request<T>(
          url: url,
          method: _get,
          params: paramsMap,
          isList: false,
          onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.errMsg = e.toString();

      ///log
      AceLog.e(msg: "get*onFiled: url:$url\n ${error.toString()}");
      onFile(error);
    }
  }

  postList<T>(String url, Map<String, dynamic>? map,
      Function(List<T?>?) onSuccess, Function(HttpError err) onFile,
      {Map<String, dynamic>? appendUrlMap}) async {
    try {
      url = parseAppendURl(url, appendUrlMap);
      List<T?>? data = await _request<T>(
          url: url, method: _post, params: map, isList: true, onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.errMsg = e.toString();

      ///log
      AceLog.e(msg: "postList*onFiled: url:$url\n ${error.toString()}");
      onFile(error);
    }
  }

  getList<T>(
      String url, Function(List<T?>?) onSuccess, Function(HttpError err) onFile,
      {Map<String, dynamic>? paramsMap,
      Map<String, dynamic>? appendUrlMap}) async {
    try {
      url = parseAppendURl(url, appendUrlMap);
      List<T?>? data = await _request<T>(
          url: url,
          method: _get,
          params: paramsMap,
          isList: true,
          onFiled: onFile);
      onSuccess(data);
    } catch (e) {
      HttpError error = HttpError();
      error.errMsg = e.toString();

      ///log
      AceLog.e(msg: "getList*onFiled: url:$url\n ${error.toString()}");
      onFile(error);
    }
  }

  ///url拼接
  String parseAppendURl(String url, Map<String, dynamic>? appendUrlMap) {
    if (ObjectUtil.isEmptyMap(appendUrlMap)) return url;
    for (var element in appendUrlMap!.keys) {
      // LogUtil.d("hasKey: ${url.contains("{$element}")}", tag: "dioUtils");
      if (url.contains("{$element}")) {
        url = url.replaceAll("{$element}", "${appendUrlMap[element]}");
        // LogUtil.d("replaceAll: " + url, tag: "dioUtils");
      }
    }
    return url;
  }
}
