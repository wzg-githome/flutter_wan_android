import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/wx_article_detail_entity.dart';

class WxArtocleModel extends BaseModel {
  ///获取对应公众号下面的文章
  static getWxListFormId(int? id, int page, onSuccess, onFailed) async {
    await BaseModel.dataManager
        .wxListFormId<WxArticleDetailEntity>(id, page, onSuccess, onFailed);
  }

  ///收藏
  static Future<void> lgCollect(int? id, Function onSuccess) async {
    await BaseModel.dataManager.lgCollect(id, (data) {
      onSuccess.call();
    }, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }

  ///取消收藏
  static Future<void> cancelCollect(int? id, Function onSuccess) async {
    await BaseModel.dataManager.lgInStationUnCollect(id, (data) {
      onSuccess.call();
    }, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }

  ///获取当前公众号某页的数据
  static Future<void> searchWxFormK(
      int? id, int page, String k, onSuccess) async {
    await BaseModel.dataManager
        .searchWxFormK<WxArticleDetailEntity>(id, page, k, onSuccess, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }
}
