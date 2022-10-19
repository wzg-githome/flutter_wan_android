import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/core/data_manager.dart';

class BaseModel {
  static DataManager dataManager = DataManager.instance;

  ///收藏
  /*static*/
  void lgCollect(int? id) async {
    await dataManager.lgCollect(id, (data) {}, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
