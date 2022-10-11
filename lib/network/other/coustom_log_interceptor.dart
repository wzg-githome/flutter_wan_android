import 'package:dio/dio.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:logger/logger.dart';

class CustomLogInterceptor extends LogInterceptor {
  ///构造
  CustomLogInterceptor({bool requestBody = false, bool responseBody = false}) {
    super.requestBody = requestBody;
    super.responseBody = responseBody;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _printerRes(response);
    handler.next(response);
    // super.onResponse(response, handler);
  }

  void _printerRes(Response response) {
    LogUtil.d("Uri: ${response.requestOptions.uri}", tag: "log_response");
    // LogUtil.d("statusCode: ${response.statusCode}", tag: "log_response");
    // LogUtil.d("headers: ${response.headers}", tag: "log_response");
    LogUtil.d(response.toString());
  }
}
