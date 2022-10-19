import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';

import 'entity/project_list_entity.dart';
import 'entity/project_tree_entity.dart';

///model
class ProjectModel extends BaseModel {
  ///项目类别
  static void getProjectTreeJson(onSuccess) async {
    await BaseModel.dataManager.getProjectTreeJson<ProjectTreeEntity>(onSuccess,
        (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }

  ///某个项目类别的数据
  static Future<void> getProjectList(int? cid, int page,
      Function(ProjectListEntity?) onSuccess, Function onFiled) async {
    await BaseModel.dataManager
        .getProjectList<ProjectListEntity>(cid, page, onSuccess, (err) {
      onFiled.call();
    });
  }
}
