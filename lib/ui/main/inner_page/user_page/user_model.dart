import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/core/wan_android_api.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/core/sp_constant.dart';
import 'package:flutter_wan_android/ui/base/base_model.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class UserModel extends BaseModel {
  ///logout
  static void logout() async {
    // await DioUtils.getInstance().get(WanAndroidApi.logout, onSuccess: (data) {
    //   BaseModel.dataManager.setLoginStatus(false);
    //   Get.offAllNamed(PageList.loginPage);
    // }, onFile: (err) {
    //   SmartDialog.showToast("msg: ${err.errMsg}");
    // });

    await BaseModel.dataManager.logout((data) {
      BaseModel.dataManager.setLoginStatus(false);
      Get.offAllNamed(PageList.loginPage);
    }, (err) {
      SmartDialog.showToast("msg: ${err.errMsg}");
    });
  }

  static String? getLoginName() {
    return BaseModel.dataManager.getLoginName();
  }
}
