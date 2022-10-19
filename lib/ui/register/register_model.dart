import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:get/get.dart';

class RegisterModel extends BaseModel {
  ///register
  static void register(String name, String pwd, String pwd2) async {
    await BaseModel.dataManager.register(name, pwd, pwd2, (data) {
      SmartDialog.showToast("注册成功，前往登录");
      Get.offNamed(PageList.loginPage);
    }, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
