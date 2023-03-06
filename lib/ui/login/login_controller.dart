import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/other/cookie_utils.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../routers.dart';
import 'login_model.dart';

///login Controller
class LoginController extends GetxController {
  late TextEditingController nameCon;
  late TextEditingController pwdCon;

  int _clickNumber = 0; //用户操作次数
  final int _clickNumberMax = 5; //最大操作次数

  RxString appVersion = RxString("");

  @override
  void onInit() {
    nameCon = TextEditingController();
    pwdCon = TextEditingController();
    _builderVersion();
    super.onInit();
  }

  @override
  void dispose() {
    nameCon.dispose();
    pwdCon.dispose();
    super.dispose();
  }

  _builderVersion() async {
    var packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
  }

  ///多次点击
  bool click2Number() {
    _clickNumber++;
    if (_clickNumber == _clickNumberMax) {
      _clickNumber = 0;
      SmartDialog.showToast("loginMaxToast".tr);
      return true;
    }
    return false;
  }

  ///账号密码登录
  void checkNamePed() async {
    if (click2Number()) return;

    AceLog.d("name: ${nameCon.text.length} \tpwd: ${pwdCon.text.length}");
    if (nameCon.text.length >= 3 && pwdCon.text.length >= 6) {
      LoginModel.login(nameCon.text, pwdCon.text);
    } else {
      await SmartDialog.showToast("账号至少三位并且密码至少6位");
    }
  }

  ///游客登录
  void notLogin() async {
    SmartDialog.showLoading(msg: "游客登陆中...");
    await BaseModel.dataManager.setLoginStatus(false);
    await CookieUtils.deleteCookieFile();
    Future.delayed(const Duration(milliseconds: 1500), () {
      SmartDialog.dismiss();
      Get.toNamed(Routers.mainPage);
    });
  }
}
