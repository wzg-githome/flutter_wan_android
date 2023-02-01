import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/ui/register/register_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _nameCon;
  late TextEditingController _pwdCon1;
  late TextEditingController _pwdCon2;

  @override
  void initState() {
    _nameCon = TextEditingController();
    _pwdCon1 = TextEditingController();
    _pwdCon2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameCon.clear();
    _pwdCon1.clear();
    _pwdCon2.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("registerTitle".tr),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: ListView(
          children: [
            TextField(
              controller: _nameCon,
              decoration: InputDecoration(
                  hintText: "账号",
                  hintStyle: TextStyle(color: Colors.grey[400])),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: _pwdCon1,
              decoration: InputDecoration(
                  hintText: "密码1",
                  hintStyle: TextStyle(color: Colors.grey[400])),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: _pwdCon2,
              decoration: InputDecoration(
                  hintText: "密码2",
                  hintStyle: TextStyle(color: Colors.grey[400])),
            ),
            SizedBox(height: 30.h),
            MaterialButton(
              onPressed: () => checkNameAndPwd(),
              child: Text(
                "注册",
                style: TextStyle(color: Colors.blue, fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkNameAndPwd() async {
    if (_nameCon.text.length < 3) {
      await SmartDialog.showToast("账号至少3位");
      return;
    }
    if (_pwdCon1.text.length < 6) {
      await SmartDialog.showToast("密码至少6位");
      return;
    }
    if (_pwdCon2.text.length < 6) {
      await SmartDialog.showToast("密码至少6位");
      return;
    }
    if (_pwdCon1.text != _pwdCon2.text) {
      await SmartDialog.showToast("密码1和密码2必须相同");
      return;
    }
    RegisterModel.register(_nameCon.text, _pwdCon1.text, _pwdCon2.text);
  }
}
