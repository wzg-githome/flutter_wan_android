import 'package:flutter_wan_android/newwork/dio_utils.dart';
import 'package:flutter_wan_android/newwork/wan_android_api.dart';
import 'package:flutter_wan_android/ui/login/login_entity.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:get/get.dart';

class LoginModel {
  ///login
  static void login(String name, String pwd) {
    var map = <String, String>{};
    map["name"] = name;
    map["password"] = pwd;

    DioUtils.instance.post<LoginEntity>(WanAndroidApi.login, map,
        onSuccess: (data) {
      AceLog.e(msg: "onSuccess: ${data.toString()}");
      Get.toNamed("mainPage");
    }, onFile: (err) {
      AceLog.e(msg: "onFile: ${err.toString()}");
    });
  }
}
