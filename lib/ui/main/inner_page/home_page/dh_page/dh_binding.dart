import 'package:flutter_wan_android/ui/main/inner_page/home_page/dh_page/dh_controller.dart';
import 'package:get/get.dart';

class DHBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DHController());
  }
}
