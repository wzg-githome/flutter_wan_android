import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/network/entity/http_error.dart';
import 'package:flutter_wan_android/network/wan_android_api.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/entity/k_h_entity.dart';

import 'entity/k_h_detail_list_entity.dart';

///kh简写了
class KHModel {
  ///知识体系
  static void getTreeList(
      {required Function(List<KHEntity?>?) onSuccess}) async {
    await DioUtils.getInstance().getList<KHEntity>(WanAndroidApi.treeList,
        onSuccess: onSuccess, onFile: (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }

  ///知识体系feed文章数据
  static void getArticleListPageDetail(int? page, int? cid,
      {required Function(KHDetailListEntity?) onSuccess,
      required Function(HttpError) onFile}) async {
    var queryMap = <String, dynamic>{};
    var appendUrlMap = <String, dynamic>{};
    queryMap["cid"] = cid;
    appendUrlMap["page"] = page;

    await DioUtils.getInstance().get<KHDetailListEntity>(
        WanAndroidApi.articleListPageDetail,
        paramsMap: queryMap,
        appendUrlMap: appendUrlMap,
        onSuccess: onSuccess,
        onFile: onFile);
  }
}
