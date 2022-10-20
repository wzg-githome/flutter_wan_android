import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum StatusType {
  ///展示内容
  content,

  ///异常
  error,

  ///空视图
  empty,
  loading,
}

///多状态视图
class StatusWidget extends StatefulWidget {
  const StatusWidget(
      {Key? key,
      required this.controller,
      required this.content,
      this.loadingWidget,
      this.emptyWidget,
      this.errorWidget,
      this.retryOnTap})
      : super(key: key);

  // final StatusType mStatusType;
  final Widget content;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final String _tag = "StatusWidget";
  final Controller controller;

  ///如果errorWidget和emptyWidget都设置将无效
  final GestureTapCallback? retryOnTap;

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  StatusType mStatusType = StatusType.loading;

  @override
  void initState() {
    // widget.controller.loading(() {
    //   mStatusType = StatusType.loading;
    // });
    // widget.controller.content(() {
    //   mStatusType = StatusType.content;
    // });
    // widget.controller.error(() {
    //   mStatusType = StatusType.error;
    // });
    // widget.controller.empty(() {
    //   mStatusType = StatusType.empty;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget cn;
    // LogUtil.d(widget.mStatusType.toString(), tag: widget._tag);
    if (mStatusType == StatusType.content) {
      cn = widget.content;
    } else if (mStatusType == StatusType.error) {
      cn = widget.errorWidget ?? _buildEmptyWidget(true, widget.retryOnTap);
    } else if (mStatusType == StatusType.loading) {
      cn = widget.loadingWidget ?? Container();
    } else {
      cn = widget.emptyWidget ?? _buildEmptyWidget(false, widget.retryOnTap);
    }
    return cn;
  }

  Widget _buildEmptyWidget(bool isError, onTap) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "${isError ? "空空如也~" : "异常了"} 点击重试",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 20.sp),
        ),
      ),
    );
  }
}

/*abstract*/ class Controller {
  void loading(Function function){}

  void content(Function function){}

  void empty(Function function){}

  void error(Function function){}
}
