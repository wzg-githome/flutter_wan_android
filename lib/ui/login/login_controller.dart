import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

///login Controller
class LoginController extends GetxController {
  //用户操作次数
  int _clickNumber = 0;

  //最大操作次数
  final int _clickNumberMax = 5;

  bool click2Number() {
    _clickNumber++;
    if (_clickNumber == _clickNumberMax) {
      _clickNumber = 0;
      SmartDialog.showToast("loginMaxToast".tr);
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
