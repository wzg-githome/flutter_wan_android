import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/network/wan_android_api.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/register/register_entity.dart';
import 'package:get/get.dart';

class RegisterModel {
  ///register
  static void register(String name, String pwd, String pwd2) {
    var map = <String, String>{};
    map["username"] = name;
    map["password"] = pwd;
    map["repassword"] = pwd2;

    DioUtils.getInstance().post<RegisterEntity>(WanAndroidApi.register, map,
        onSuccess: (data) {
      SmartDialog.showToast("注册成功，前往登录");
      Get.offNamed(PageList.loginPage);
    }, onFile: (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
