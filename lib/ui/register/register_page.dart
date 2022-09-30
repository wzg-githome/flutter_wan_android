import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: ListView(
          children: [
            TextField(
              controller: _nameCon,
              decoration: const InputDecoration(hintText: "账号"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _pwdCon1,
              decoration: const InputDecoration(hintText: "密码1"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _pwdCon2,
              decoration: const InputDecoration(hintText: "密码2"),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: () => checkNameAndPwd(),
              child: const Text(
                "注册",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }


  void checkNameAndPwd() {
    if (_nameCon.text.length < 3) {
      SmartDialog.showToast("账号至少3位");
      return;
    }
    if (_pwdCon1.text.length < 6) {
      SmartDialog.showToast("密码至少6位");
      return;
    }
    if (_pwdCon2.text.length < 6) {
      SmartDialog.showToast("密码至少6位");
      return;
    }
    if (_pwdCon1.text != _pwdCon2.text) {
      SmartDialog.showToast("密码1和密码2必须相同");
      return;
    }
    RegisterModel.register(_nameCon.text, _pwdCon1.text, _pwdCon2.text);
  }
}
