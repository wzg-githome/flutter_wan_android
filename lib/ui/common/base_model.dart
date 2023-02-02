import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/core/data_manager.dart';
///数据model基类
class BaseModel {
  static DataManager dataManager = DataManager.instance;

  ///取消站内收藏
  static Future<void> lgUnCollect(int? id, onSuccess) async {
    await BaseModel.dataManager.lgUnCollect(id, -1, onSuccess, (err) async {
      await SmartDialog.showToast("${err.errMsg}");
    });
  }
}
