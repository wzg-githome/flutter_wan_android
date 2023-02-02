import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';

import 'lg_collect_entity.dart';

class LgCollectModel extends BaseModel {
  ///获取收藏列表
  Future<void> lgCollectList(int page, onSuccess, onFiled) async {
    await BaseModel.dataManager
        .lgCollectList<LgCollectEntity>(page, onSuccess, onFiled);
  }

  ///取消收藏
  Future<void> cancelCollect(bool isOrigin, int? id, onSuccess) async {
    if (isOrigin) {
      await BaseModel.lgUnCollect(id, onSuccess);
    } else {
      await BaseModel.dataManager.lgInStationUnCollect(id, onSuccess, (err) {
        SmartDialog.showToast("${err.errMsg}");
      });
    }
  }
}
