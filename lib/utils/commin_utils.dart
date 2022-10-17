import 'package:flutter/services.dart';
import 'package:flutter_wan_android/core/data_manager.dart';

class CommonUtils {
  ///是否登录
  static bool isLogin() {
    return DataManager.instance.getLoginStatus();
  }

  ///退出app
  static Future<void> quit2App() async {
    await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }
}
