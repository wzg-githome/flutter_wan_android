import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/article_entity.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/banner_entity.dart';

class HomeModel extends BaseModel {
  ///获取缓存的bannerList
  static List<BannerEntity?>? getCacheBannerList() {
    return BaseModel.dataManager.getCacheBannerList();
  }

  ///保存bannerList
  static void saveBannerList(List<BannerEntity?>? bannerList) {
    BaseModel.dataManager.putBannerList(bannerList);
  }

  ///banner
  static void getBannerList(Function(List<BannerEntity?>?) onSuccess) async {
    await BaseModel.dataManager.getBannerList<BannerEntity>(onSuccess, (err) {
      SmartDialog.showToast("${err.errMsg}");
    });
  }

  ///
  static void getArticleList(
    int page,
    Function(ArticleEntity?) onSuccess,
    Function(String?) onFailed,
  ) async {
    await BaseModel.dataManager.getArticleList<ArticleEntity>(page, onSuccess,
        (err) {
      onFailed(err.errMsg);
    });
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
}
