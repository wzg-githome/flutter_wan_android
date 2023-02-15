import 'dart:async';

import 'package:flutter_wan_android/utils/commin_utils.dart';
import 'package:get/get.dart';

import '../../routers.dart';

class WelcomeController extends GetxController {
  var timeIndex = 2.obs;
  Timer? _timer;
  final int _timeMin = 0;
  final int _milliseconds = 500;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.onClose();
  }

  void startTimer() {
    _timer ??= Timer.periodic(Duration(milliseconds: _milliseconds), (timer) {
      timeIndex--;
      if (_timeMin == timeIndex.value) {
        if (_timer != null && _timer!.isActive) {
          _timer?.cancel();
          _timer = null;
        }
        if (CommonUtils.isLogin()) {
          Get.offNamed(Routers.mainPage);
          return;
        }
        Get.offNamed(Routers.loginPage);
      }
    });
  }
}
