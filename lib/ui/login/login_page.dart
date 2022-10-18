import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/login/login_model.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

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
    _nameCon.clear();
    _pwdCon.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("loginTitle".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(
          children: [
            TextField(
              controller: _nameCon,
              decoration: InputDecoration(
                hintText: "账号",
                helperStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _pwdCon,
              decoration: InputDecoration(
                hintText: "密码",
                helperStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(PageList.registerPage);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "注册",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                checkNamePed();
              },
              child: const Text(
                "登录",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkNamePed() {
    if (_loginCon.click2Number()) return;

    AceLog.d("name: ${_nameCon.text.length} \tpwd: ${_pwdCon.text.length}");
    if (_nameCon.text.length >= 3 && _pwdCon.text.length >= 6) {
      LoginModel.login(_nameCon.text, _pwdCon.text);
    } else {
      SmartDialog.showToast("账号至少三位并且密码至少6位");
    }
  }
}
