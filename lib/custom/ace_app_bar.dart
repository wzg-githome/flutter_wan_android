import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///自定义appBar
AppBar getAceAppBar(String title,
    {bool isShowAction = false,
    bool isLeading = false,
    GestureTapCallback? onBackClick,
    String rightText = ""}) {
  return AppBar(
    leading: isLeading
        ? GestureDetector(
            onTap: onBackClick,
            child: Center(
              child: Image.asset(
                "asset/images/icon_back.png",
                height: 15.h,
                fit: BoxFit.fitHeight,
                color: Colors.white,
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
                  padding:  EdgeInsets.all(5.h), child: Text(rightText)),
            )
          ]
        : [],
  );
}
