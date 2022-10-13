import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

///MessageDialogView
class MessageDialogView extends StatelessWidget {
  const MessageDialogView(
      {Key? key,
      this.smartDialogTag,
      this.title,
      this.leftText,
      this.rightText,
      required this.content,
      this.onClick})
      : super(key: key);

  ///设置tag自动关闭对话框，无需在外面关闭
  final String? smartDialogTag;
  final String? title;
  final String? leftText;
  final String? rightText;
  final String? content;
  final Function(bool)? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 50, right: 50),
      padding: const EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "温馨提示",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              "$content",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (smartDialogTag != null) {
                      await SmartDialog.dismiss(tag: smartDialogTag);
                    }

                    if (onClick != null) onClick!(false);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 8, right: 8),
                    child: Text(
                      leftText ?? "取消",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (smartDialogTag != null) {
                      await SmartDialog.dismiss(tag: smartDialogTag);
                    }
                    if (onClick != null) onClick!(true);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                    child: Text(
                      rightText ?? "确定",
                      style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
