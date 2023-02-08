import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class HorizontalItemWidget extends StatefulWidget {
  const HorizontalItemWidget(this.icon, this.content, { this.onTap,Key? key})
      : super(key: key);

  final String? content;
  final IconData? icon;
  final GestureTapCallback? onTap;

  @override
  State<HorizontalItemWidget> createState() => _HorizontalItemWidgetState();
}

class _HorizontalItemWidgetState extends State<HorizontalItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
          color: Colors.blue[400],
        ),
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
              size: 20.h,
            ),
            Text(
              "${widget.content}",
              style: TextStyle(color: Colors.white, fontSize: 10.sp),
            )
          ],
        ),
      ),
    );
  }
}
