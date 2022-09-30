import 'package:get/get_navigation/src/root/internacionalization.dart';

///国际化
class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "loginTitle": "login",
          "mainTitle": "main",
          "registerTitle": "register",
          "loginMaxToast": "Don't you have an account? You can register first",
        },
        "zh_CN": {
          "loginTitle": "登录",
          "mainTitle": "主页",
          "registerTitle": "注册",
          "loginMaxToast": "没有账号吗？可以先去注册",
        },
      };
}
