import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_wan_android/custom/common_class.dart';

typedef SearchTapCallback = void Function(String context);

///微信公众号界面的搜索框
class WxArticleSearchWidget extends StatefulWidget {
  const WxArticleSearchWidget(this.title, {this.onSearchTap, Key? key})
      : super(key: key);

  final SearchTapCallback? onSearchTap;
  final String? title;

  @override
  State<WxArticleSearchWidget> createState() => _WxArticleSearchWidgetState();
}

class _WxArticleSearchWidgetState extends State<WxArticleSearchWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.w),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "${widget.title}带你发现更多干货",
                    hintStyle: TextStyle(fontSize: 14.sp)),
              ),
            ),
            flex: 1,
          ),
          GestureDetector(
            onTap: () {
              widget.onSearchTap!(_controller.text);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              margin: EdgeInsets.only(left: 10.w, right: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.h),
                  color: Colors.blue),
              child: Text(
                "搜索",
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
