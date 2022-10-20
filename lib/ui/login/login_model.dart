import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/common//base_model.dart';
import 'package:flutter_wan_android/ui/login/login_entity.dart';
import 'package:get/get.dart';

class LoginModel extends BaseModel {
  ///login
  static void login(String name, String pwd) async {
    await BaseModel.dataManager.login<LoginEntity>(name, pwd, (data) async {
      if (data == null) {
        SmartDialog.showToast("errMsg: data==null");
        return;
      }
      await BaseModel.dataManager.setLoginStatus(true);
      await BaseModel.dataManager.setLoginName(data.nickname ?? name);
      await Get.offNamed(PageList.mainPage);
    }, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
