import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/network/wan_android_api.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'entity/project_list_entity.dart';
import 'entity/project_tree_entity.dart';

///model
class ProjectModel {
  ///项目类别
  static void getProjectTreeJson(onSuccess) async {
    await DioUtils.getInstance().getList<ProjectTreeEntity>(
        WanAndroidApi.projectTree,
        onSuccess: onSuccess, onFile: (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }

  ///某个项目类别的数据
  static Future<void> getProjectList(int? cid, int page, Function(ProjectListEntity?) onSuccess,
      Function onFiled) async {
    var queryMap = <String, dynamic>{};
    var appendUrlMap = <String, dynamic>{};
    queryMap["cid"] = cid;
    appendUrlMap["page"] = page;
    await DioUtils.getInstance().get<ProjectListEntity>(WanAndroidApi.projectList,
        paramsMap: queryMap, appendUrlMap: appendUrlMap, onSuccess: (data) {
      onSuccess(data);
    }, onFile: (err) {
      onFiled.call();
    });
  }
}
