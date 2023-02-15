import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/routers.dart';
import 'package:flutter_wan_android/ui/welcome/welcome_controller.dart';
import 'package:flutter_wan_android/utils/commin_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///欢迎页
class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Obx(() => Text(
              "Let‘s go,flutter... ${controller.timeIndex}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
