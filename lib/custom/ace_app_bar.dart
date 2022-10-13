import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///自定义appBar
AppBar getAceAppBar(String title,
    {bool isShowAction = false,
    bool isLeading = false,
    GestureTapCallback? back,
    String rightText = ""}) {
  return AppBar(
    leading: isLeading
        ? GestureDetector(
            onTap: back,
            child: Center(
              child: Image.asset(
                "asset/images/icon_back.png",
                height: 25.h,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        : null,
    title: Text(title),
    centerTitle: true,
    actions: isShowAction
        ? [
            GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.all(5), child: Text(rightText)),
            )
          ]
        : [],
  );
}
