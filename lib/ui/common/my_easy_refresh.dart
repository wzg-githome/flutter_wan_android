import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';

import 'easy_refresh_custom.dart';

///自定义头部底部的刷新加载控件
class MyEasyRefresh extends StatefulWidget {
  ///child
  final Widget? child;

  /// 控制器
  final EasyRefreshController? easyController;

  /// 加载回调(null为不开启加载)
  final OnLoadCallback? onLoad;

  /// 刷新回调(null为不开启刷新)
  final OnRefreshCallback? onRefresh;

  ///状态
  final StatusType statusType;

  const MyEasyRefresh(
      {required this.child,
      required this.easyController,
      required this.statusType,
      this.onLoad,
      this.onRefresh,
      Key? key})
      : super(key: key);

  @override
  State<MyEasyRefresh> createState() => _MyEasyRefreshState();
}

class _MyEasyRefreshState extends State<MyEasyRefresh> {
  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      statusType: widget.statusType,
      content: EasyRefresh(
        header: getCustomHeader(),
        footer: getCustomFooter(),
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        controller: widget.easyController,
        onLoad: widget.onLoad,
        onRefresh: widget.onRefresh,
        child: widget.child,
      ),
    );
  }
}
