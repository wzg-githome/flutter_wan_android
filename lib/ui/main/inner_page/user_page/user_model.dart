import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/other/cookie_utils.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:get/get.dart';

class UserModel extends BaseModel {
  ///logout
  static void logout() async {
    ///游客登录
    if (!BaseModel.dataManager.getLoginStatus()) {
      await Get.offAllNamed(PageList.loginPage);
      return;
    }

    await BaseModel.dataManager.logout((data) async {
      await CookieUtils.deleteCookieFile();
      await BaseModel.dataManager.setLoginStatus(false);
      await BaseModel.dataManager.setLoginName("");
      await Get.offAllNamed(PageList.loginPage);
    }, (err) async {
      await SmartDialog.showToast("msg: ${err.errMsg}");
    });
  }

  static String? getLoginName() {
    return BaseModel.dataManager.getLoginName();
  }
}
