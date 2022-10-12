import 'package:dio/dio.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
///网络处理工厂
class NetworkProcessFactory {
  static void handlerException(e) {
    if (e is DioError) return;

    _loggerException(e);
    _saveException2File(e);
  }

  static void _saveException2File(e) {}

  static void _loggerException(e) {
    AceLog.e(msg: "_loggerException:\n" + e.toString());
  }
}
