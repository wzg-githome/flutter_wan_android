import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late PageController pageCon;
  var bottomList = [
    {"index": 0, "name": "首页", "icon": Icons.home},
    {"index": 1, "name": "项目", "icon": Icons.backup_rounded},
    {"index": 2, "name": "知识体系", "icon": Icons.storage},
    {"index": 3, "name": "我的", "icon": Icons.account_box_outlined},
  ];
  var checkedColor = Colors.blue;
  var defaultColor = Colors.grey;

  get selectIndex => _defaultIndex.value;
  var _defaultIndex = 0.obs;

  @override
  void onInit() {
    pageCon = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageCon.dispose();
    super.onClose();
  }

  ///底部按钮事件
  void onBottomNavigationBarTap(index) {
    if (_defaultIndex != index) {
      pageCon.jumpToPage(index);
    }
    _defaultIndex.value = index;
    AceLog.d("_defaultIndex: $_defaultIndex");
  }

  /// 页面改变
  void onPageChanged(index) {
    _defaultIndex.value = index;
  }
}
