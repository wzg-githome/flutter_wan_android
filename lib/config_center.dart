import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:common_utils/common_utils.dart';

class ConfigCenter {
  ///是否为debug模式
  static var isDebug = true;

  ///是否开启日志，除网络外
  // static var openOtherDebug = true;

  ///是否打开网络日志
  static var openNetDebug = true;

  ///是否开启cookie诗酒花管理
  static var openCookieManager = true;

  ///log日志的最长长度
  static var logMaxLength = 250;

  ///缓存目录
  ///apk,txt，临时文件
  static Future<String> cachePath({bool debug = true}) async {
    //获取通用的临时缓存的目录
    var _dir = await getTemporaryDirectory();
    String _cachePath = _dir.path + "/wan_android/cache";
    var _file = File(_cachePath);
    var _fileExists = await _file.exists();
    if (debug) {
      LogUtil.d("_fileExists: $_fileExists", tag: "cachePath");
    }
    if (_fileExists) return _cachePath;
    //创建文件目录
    var _create = await Directory(_cachePath).create(recursive: true);
    bool _createExists = await _create.exists();
    if (debug) {
      LogUtil.d("_create: $_createExists", tag: "cachePath");
    }
    if (_createExists) return _cachePath;
    return "";
  }
}
