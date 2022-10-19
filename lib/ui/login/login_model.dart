import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/core/wan_android_api.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/common//base_model.dart';
import 'package:flutter_wan_android/ui/login/login_entity.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:flutter_wan_android/utils/commin_utils.dart';
import 'package:flutter_wan_android/core/sp_constant.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class LoginModel extends BaseModel {
  ///login
  static void login(String name, String pwd) async {
    await BaseModel.dataManager.login<LoginEntity>(name, pwd, (data) {
      if (data == null) {
        SmartDialog.showToast("errMsg: data==null");
        return;
      }
      BaseModel.dataManager.setLoginStatus(true);
      BaseModel.dataManager.setLoginName(data.nickname ?? name);
      Get.offNamed(PageList.mainPage);
    }, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
