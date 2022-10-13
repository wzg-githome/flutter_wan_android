import 'package:flutter/services.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:flutter_wan_android/utils/sp_constant.dart';
import 'package:sp_util/sp_util.dart';
import 'package:common_utils/common_utils.dart';

class CommonUtils {
  ///是否登录
  static bool isLogin() {
    bool? isLogin = SpUtil.getBool(SPConstant.loginStatus);
    AceLog.d("isLogin: $isLogin");
    return isLogin ?? false;
  }

  ///退出app
  static Future<void> quit2App() async {
    await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }
}
