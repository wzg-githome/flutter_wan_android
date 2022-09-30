import 'package:flutter/material.dart';

///自定义appBar
AppBar getAceAppBar(String title,
    {bool isShowAction = false, String rightText = ""}) {
  return AppBar(
    leading: Image.asset("asset/images/icon_back.png"),
    title: Text(title),
    actions: isShowAction ? [

      GestureDetector(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(rightText)
        ),
      )

    ] : [],
  );
}