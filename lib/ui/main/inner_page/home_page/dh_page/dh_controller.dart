import 'package:common_utils/common_utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'dh_model.dart';
import 'nav_json_entity.dart';

class DHController extends GetxController {
  Rx<StatusType> statusType = StatusType.loading.obs;
  late ItemScrollController itemScrollController;
  late ScrollController mScrollController;
  DHModel model = DHModel();
  Rx<List<NavJsonEntity?>?>? dataList;

  var selectIndex = 0.obs;

  @override
  void onInit() {
    itemScrollController = ItemScrollController();
    mScrollController = ScrollController();
    getNavData();
    super.onInit();
  }

  @override
  void onClose() {
    mScrollController.dispose();
    super.onClose();
  }

  void getNavData() {
    model.getNaviJson((data) {
      if (ObjectUtil.isNotEmpty(data)) {
        dataList = data.obs;
        statusType.value = StatusType.content;
      } else {
        dataList?.value?.clear();
        statusType.value = StatusType.empty;
      }
    });
  }

  /*Future<void>*/
  void animateTo(index) /*async*/ {
    SmartDialog.showToast("${dataList?.value?[index]?.name}");
    selectIndex.value = index;
    /*await*/
    itemScrollController.jumpTo(
        index: index /*, duration: const Duration(milliseconds: 500)*/);
  }

  ///item的点击事件
  void onChildClick(NavJsonEntityArticles? indexItem) async {
    SmartDialog.showToast("${indexItem?.title}");
    await Get.to(WebPage(
      url: indexItem?.link,
      title: indexItem?.title,
    ));
  }
}
