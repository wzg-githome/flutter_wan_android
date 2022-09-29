import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class LoginPge extends StatefulWidget {
  const LoginPge({Key? key}) : super(key: key);

  @override
  State<LoginPge> createState() => _LoginPgeState();
}

class _LoginPgeState extends State<LoginPge> {
  late TextEditingController _nameCon;
  late TextEditingController _pwdCon;

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
        title: const Text("登录"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(
          children: [
            TextField(
              controller: _nameCon,
              decoration: const InputDecoration(hintText: "账号"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _pwdCon,
              decoration: const InputDecoration(hintText: "密码"),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                GestureDetector(
                  onTap: (){

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
    String text;
    bool onSuccessed;
    if (_nameCon.text.length > 3 && _pwdCon.text.length > 6) {
      text = "注册或登录成功";
      onSuccessed = true;
    } else {
      onSuccessed = false;
      text = "账号至少三位并且密码至少6位";
    }
    SmartDialog.showToast(text);
    if (onSuccessed) Get.toNamed("mainPage");
  }
}
