import 'package:flutter/material.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///简介
class  SynopsisPage extends GetView{
  const SynopsisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("介绍与声明"),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("\n1.此app是用flutter开发的,非盈利性质的",
                style: TextStyle(color: Colors.red,fontSize: 16.sp)),
            SizedBox(height: 10.h),
            Text("2.代码暂时不开源，如有需要可以联系作者：718603390@qq.com",
                style: TextStyle(color: Colors.red,fontSize: 16.sp)),
            SizedBox(height: 10.h),
            Text("3.此app是作者ace学习flutter过程中开发的完整性项目",
                style: TextStyle(color: Colors.red,fontSize: 16.sp)),
            SizedBox(height: 10.h),
            Text("4.此app是对用户设备不具备入侵性，不会对用户设备造成不良影响",
                style: TextStyle(color: Colors.red,fontSize: 16.sp)),
            SizedBox(height: 10.h),
            Text("5.此app所有网络数据来源玩android官网",
                style: TextStyle(color: Colors.red,fontSize: 16.sp)),
            SizedBox(height: 10.h),
            Text("6.此app内任何非作者改动所引起的任何影响概不负责",
                style: TextStyle(color: Colors.red,fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }

}

