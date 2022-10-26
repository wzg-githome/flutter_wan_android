import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/config_center.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_upgrade/r_upgrade.dart';

///下载与安装apk
class DownloadApkUtil {
  static const _tag = "downloadFile";

  static Future<void> downloadAndInstallFile(String url,
      {bool openLog = true}) async {
    bool _hasPermission = await _requestDownloadPermission();
    if (!_hasPermission) {
      SmartDialog.showToast("必须拥有存储权限才可以下载文件");
      return;
    }
    bool _hasInstallPermission = await _requestInstallPermission();
    if (!_hasInstallPermission) {
      SmartDialog.showToast("必须拥有安装权限才能安装下载文件");
      return;
    }
    var _cachePath = await ConfigCenter.cachePath(debug: openLog);
    if (ObjectUtil.isNotEmpty(_cachePath)) {
      //开始下载
      var _curFilePath = _cachePath + "/" + _getApkPath(url);
      //文件已存在
      if (await File(_curFilePath).exists()) {
        SmartDialog.showToast("根据文件名查看,您可能已经下载了，直接去安装了");
        /*var _installAPk =*/
        await RUpgrade.installByPath(_curFilePath);
        // if (_installAPk ?? false) {
        //   SmartDialog.showToast("_installAPk success");
        // }
      } else {
        Dio _dio = Dio();
        //5分钟
        int _timeout = 1000 * 1000 * 60 * 5;
        _dio.options = BaseOptions(
            connectTimeout: _timeout,
            receiveTimeout: _timeout,
            sendTimeout: _timeout);
        var _response = await _dio.download(url, _curFilePath,
            onReceiveProgress: _processCallback);
        if (openLog) {
          LogUtil.d(
              "_response:${_response.statusCode} \t ${_response.data}\t${_response.statusMessage} ",
              tag: _tag);
        }
        //成功
        if (_response.statusCode == 200) {
          /* var _installAPk =*/ await RUpgrade.installByPath(_curFilePath);
          // if (_installAPk ?? false) {
          //   SmartDialog.showToast("_installAPk success");
          // }
        }
      }
    }
  }

  static var _oldProcess = 0;

  ///处理进度
  static void _processCallback(int received, int total) {
    if (total != -1) {
      var process = int.parse((received / total * 100).toStringAsFixed(0));
      if (process > _oldProcess) {
        LogUtil.d("$process%", tag: _tag);
        _oldProcess = process;
      }
    }
  }

  ///获取apk的name
  static String _getApkPath(String url, {bool openLog = true}) {
    //获取原本的名称
    if (url.contains(".apk") && url.contains("/")) {
      var _startIndexOf = url.lastIndexOf("/") + 1;
      var _endIndexOf = url.lastIndexOf(".apk");
      var _subString = url.substring(_startIndexOf, _endIndexOf);
      if (openLog) {
        LogUtil.d("_apkName: $_subString", tag: _tag);
      }
      return _subString + ".apk";
    }
    //给apk取一个名字
    var _apkName = DateUtil.formatDate(DateTime.now(), format: "MM_dd_HH_mm");
    if (openLog) {
      LogUtil.d("_apkName: $_apkName", tag: _tag);
    }
    return "dt" + _apkName + ".apk";
  }

  ///获取下载的存储权限
  static Future<bool> _requestDownloadPermission() async {
    late bool hasPermission;

    //是否有权限
    if (await Permission.storage.isGranted) {
      hasPermission = true;
    } else {
      //申请权限
      PermissionStatus _status = await Permission.storage.request();
      if (_status == PermissionStatus.granted) {
        hasPermission = true;
      } else {
        hasPermission = false;
      }
    }
    return hasPermission;
  }

  ///获取安装权限
  static Future<bool> _requestInstallPermission() async {
    late bool hasPermission;
    if (await Permission.requestInstallPackages.isGranted) {
      hasPermission = true;
    } else {
      PermissionStatus _status =
          await Permission.requestInstallPackages.request();
      if (_status == PermissionStatus.granted) {
        hasPermission = true;
      } else {
        hasPermission = false;
      }
    }
    return hasPermission;
  }
}
