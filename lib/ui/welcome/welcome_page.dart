import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/utils/commin_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer? _timer;
  int _timeIndex = 2;
  final int _timeMin = 0;
  final int _milliseconds = 500;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Let‘s go... $_timeIndex",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue, fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void startTimer() {
    _timer ??= Timer.periodic(Duration(milliseconds: _milliseconds), (timer) {
      setState(()  {
        _timeIndex--;
        if (_timeMin == _timeIndex) {
          if (_timer != null && _timer!.isActive) {
            _timer?.cancel();
            _timer = null;
          }
          if (CommonUtils.isLogin()) {
             Get.offNamed(PageList.mainPage);
            return;
          }
           Get.offNamed(PageList.loginPage);
        }
      });
    });
  }
}
