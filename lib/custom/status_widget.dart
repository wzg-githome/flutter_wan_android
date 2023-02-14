import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_wan_android/custom/common_class.dart';

enum StatusType {
  content,
  error,
  empty,
  loading,
}

///多状态的视图
class StatusWidget extends StatefulWidget {
  const StatusWidget(
      {required this.statusType,
      required this.content,
      this.loadingWidget,
      this.emptyWidget,
      this.errorWidget,
      this.onRetryClick,
      this.loadingContent,
      this.loadingColor,
      Key? key})
      : super(key: key);
  final StatusType statusType;
  final Widget content;
  final GestureTapCallback? onRetryClick;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final String? loadingContent;
  final Color? loadingColor;

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    late Widget _widget;
    switch (widget.statusType) {
      case StatusType.content:
        _widget = widget.content;
        break;
      case StatusType.error:
        _widget = widget.errorWidget ??
            _buildErrorOrEmptyWidget(widget.onRetryClick, true);
        break;
      case StatusType.empty:
        _widget = widget.emptyWidget ??
            _buildErrorOrEmptyWidget(widget.onRetryClick, false);
        break;
      case StatusType.loading:
        _widget = widget.loadingWidget ??
            _buildLoadingWidget(widget.loadingContent, widget.loadingColor);
        break;
    }
    return _widget;
  }
}

Widget _buildErrorOrEmptyWidget(GestureTapCallback? onTap, bool error) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(error ? "发生异常了,亲!!!" : "没有数据呢,亲!!!",
            style: TextStyle(
                color: error ? Colors.red : Colors.blue, fontSize: 14.sp)),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            child: Text(
              "点击重试",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.h),
                color: error ? Colors.red : Colors.blue),
          ),
        )
      ],
    ),
  );
}

Widget _buildLoadingWidget(loadingContent, loadingColor) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(4.h)),
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            strokeWidth: 2.h,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.h, right: 10.h),
            child: Text(
              loadingContent ?? "loading...",
              style: TextStyle(
                  fontSize: 14.sp, color: loadingColor ?? Colors.blue),
            ),
          )
        ],
      ),
    ),
  );
}
