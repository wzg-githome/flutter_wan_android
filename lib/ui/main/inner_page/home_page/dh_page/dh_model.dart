import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'nav_json_entity.dart';

class DHModel extends BaseModel {
  Future<void> getNaviJson(Function(List<NavJsonEntity?>?) onSuccess) async {
    await BaseModel.dataManager.naviJson<NavJsonEntity>(onSuccess, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
