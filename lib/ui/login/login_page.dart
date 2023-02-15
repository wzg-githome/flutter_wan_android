import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan_android/routers.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

///登录页
class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("loginTitle".tr)),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: ListView(
          children: [
            TextField(
              controller: controller.nameCon,
              decoration: InputDecoration(
                hintText: "账号",
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: controller.pwdCon,
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
              onTap: () => controller.checkNamePed(),
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
              onTap: () => controller.notLogin(),
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
}
