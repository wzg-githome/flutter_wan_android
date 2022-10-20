import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// typedef QuitFunction = Future<bool> Function();

///author:wzg
///双击点击退出app
class WillPoScopeView extends StatelessWidget {
  final Widget child;

  final WillPopCallback? quitFunction;

  const WillPoScopeView({Key? key, required this.child, this.quitFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? lastPopTime;

    return WillPopScope(
      onWillPop: () async {
        if (quitFunction != null) {
          bool willPop = await quitFunction!.call();
          // if (willPop) SmartDialog.showToast("true");
          return willPop;
        }

        //单击返回键的操作
        if (lastPopTime == null ||
            ((lastPopTime != null) &&
                DateTime.now().difference(lastPopTime!) >
                    const Duration(seconds: 2))) {
          lastPopTime = DateTime.now();
          SmartDialog.showToast("再按一次退出app");
          return false;
        } else {
          lastPopTime = DateTime.now();
          //退出app
          await SystemChannels.platform.invokeMethod("SystemNavigator.pop");
          return true;
        }
        /* } else {
          return false;
        }*/
      },
      child: child,
    );
  }
}
