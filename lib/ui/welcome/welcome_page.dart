import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer? _timer;
  int timeIndex = 5;
  int timeMin = 0;

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
        child: Text("this is welcome page\n$timeIndex",
          textAlign: TextAlign.center,
          style:const  TextStyle(
          color: Colors.blue,
          fontSize: 16,

        ),),
      ),
    );
  }

  void startTimer() {
    _timer ??= Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        timeIndex--;
        if (timeMin == timeIndex) {
          if (_timer != null && _timer!.isActive) {
            _timer?.cancel();
            _timer = null;
          }
          Get.offNamed("loginPage");
        }
      });

    });

  }
}
