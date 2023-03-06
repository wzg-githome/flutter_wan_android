import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:get/get.dart';

class AuthorPage extends GetView {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("作者简介"),
      body: Container(
          padding: EdgeInsets.all(10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                "1.作者是个有5年开发经验的android developer，擅长java、kotlin、dart(flutter)，了解C++、C、js、html的使用",
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.h),
              Text(
                "2.关于开源项目问题和技术交流（flutter与Android）哈哈😂，欢迎联系我",
                style: TextStyle(color: Colors.black, fontSize: 18.sp),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.h),
              Text(
                "3.联系方式：718603390@qq.com",
                style: TextStyle(color: Colors.blue, fontSize: 18.sp),
                textAlign: TextAlign.start,
              ),
            ],
          )),
    );
  }
}
