import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/other/cookie_utils.dart';
import 'package:flutter_wan_android/routers.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_wan_android/ui/login/login_model.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
///登录页
class LoginPge extends StatefulWidget {
  const LoginPge({Key? key}) : super(key: key);

  @override
  State<LoginPge> createState() => _LoginPgeState();
}

class _LoginPgeState extends State<LoginPge> {
  late TextEditingController _nameCon;
  late TextEditingController _pwdCon;

  final _loginCon = Get.put(LoginController());

  @override
  void initState() {
    _nameCon = TextEditingController();
    _pwdCon = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameCon.dispose();
    _pwdCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("loginTitle".tr)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: ListView(
          children: [
            TextField(
              controller: _nameCon,
              decoration: InputDecoration(
                hintText: "账号",
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: _pwdCon,
              decoration: InputDecoration(
                hintText: "密码",
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () async {
                    await Get.toNamed(Routers.registerPage);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Text(
                      "注册",
                      style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => _checkNamePed(),
              child: Container(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Text(
                  "登录",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _notLogin(),
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "不想登录？点我进去",
                  style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///账号密码登录
  void _checkNamePed() async {
    if (_loginCon.click2Number()) return;

    AceLog.d("name: ${_nameCon.text.length} \tpwd: ${_pwdCon.text.length}");
    if (_nameCon.text.length >= 3 && _pwdCon.text.length >= 6) {
      LoginModel.login(_nameCon.text, _pwdCon.text);
    } else {
      await SmartDialog.showToast("账号至少三位并且密码至少6位");
    }
  }

  ///游客登录
  void _notLogin() async {
    SmartDialog.showLoading(msg: "游客登陆中...");
    await BaseModel.dataManager.setLoginStatus(false);
    await CookieUtils.deleteCookieFile();
    Future.delayed(const Duration(milliseconds: 1500), () {
      SmartDialog.dismiss();
      Get.toNamed(Routers.mainPage);
    });
  }
}
