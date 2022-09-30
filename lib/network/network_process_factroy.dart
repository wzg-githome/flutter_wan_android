import 'package:dio/dio.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';

class NetworkProcessFactory {
  static void handlerException(e) {
    if (e is DioError) {
      //
    }
    _loggerException(e);
    _saveException2File(e);
  }

  static void _saveException2File(e) {}

  static void _loggerException(e) {
    AceLog.e(msg: e.toString());
  }
}