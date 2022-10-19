import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/entity/http_error.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/entity/k_h_entity.dart';

import 'entity/k_h_detail_list_entity.dart';

///kh简写了
class KHModel extends BaseModel {
  ///知识体系
  static void getTreeList(
      {required Function(List<KHEntity?>?) onSuccess}) async {
    await BaseModel.dataManager.getTreeList<KHEntity>(onSuccess,  (err) {
        SmartDialog.showToast("${err.errMsg}");
      });
  }

  ///知识体系feed文章数据
  static void getArticleListPageDetail(int? page, int? cid,
      {required Function(KHDetailListEntity?) onSuccess,
      required Function(HttpError) onFile}) async {
    await BaseModel.dataManager.getArticleListPageDetail<KHDetailListEntity>(page, cid, onSuccess, onFile);
  }



}
