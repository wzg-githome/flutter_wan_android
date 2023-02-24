import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class HorizontalItemWidget extends StatefulWidget {
  ///内容
  final String? content;

  ///icon
  final IconData? icon;

  ///事件
  final GestureTapCallback? onTap;

  const HorizontalItemWidget(this.icon, this.content, {this.onTap, Key? key})
      : super(key: key);

  @override
  State<HorizontalItemWidget> createState() => _HorizontalItemWidgetState();
}

class _HorizontalItemWidgetState extends State<HorizontalItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 70.h,
        width: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
          color: Colors.grey[200],
        ),
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Colors.blue,
              size: 28.h,
            ),
            SizedBox(height: 5.h),
            Text(
              "${widget.content}",
              style: TextStyle(color: Colors.blue, fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}
