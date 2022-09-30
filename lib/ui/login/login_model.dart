import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/network/wan_android_api.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/login/login_entity.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:get/get.dart';

class LoginModel {



  ///login
  static void login(String name, String pwd) {
    var map = <String, String>{};
    map["username"] = name;
    map["password"] = pwd;
    DioUtils.getInstance().post<LoginEntity>(WanAndroidApi.login, map,
        onSuccess: (data) {
      Get.toNamed(PageList.mainPage);
    }, onFile: (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
