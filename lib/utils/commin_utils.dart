import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:flutter_wan_android/utils/sp_constant.dart';
import 'package:sp_util/sp_util.dart';

class CommonUtils {
  //是否登录
  static bool isLogin()  {
    bool? isLogin =  SpUtil.getBool(SPConstant.loginStatus);
    AceLog.d("isLogin: $isLogin");
    return isLogin ?? false;
  }
}
