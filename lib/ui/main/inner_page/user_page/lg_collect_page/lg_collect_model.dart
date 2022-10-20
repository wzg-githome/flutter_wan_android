import 'package:flutter_wan_android/ui/common/base_model.dart';

import 'lg_collect_entity.dart';

class LgCollectModel extends BaseModel {
  ///获取收藏列表
  Future<void> lgCollectList(int page, onSuccess, onFiled) async {
    await BaseModel.dataManager
        .lgCollectList<LgCollectEntity>(page, onSuccess, onFiled);
  }

  ///取消站内收藏
  Future<void> cancelLgCollect(int? id, onSuccess) async {
    await BaseModel.lgUnCollect(id, onSuccess);
  }
}
