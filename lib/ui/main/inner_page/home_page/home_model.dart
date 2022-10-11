import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/network/wan_android_api.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/article_entity.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/banner_entity.dart';

class HomeModel {
  ///banner
  static void getBannerList(Function(List<BannerEntity?>?) onSuccess) async {
    await DioUtils.getInstance().getList<BannerEntity>(
      WanAndroidApi.bannerList,
      null,
      onSuccess: onSuccess,
      onFile: (err) {
        SmartDialog.showToast("${err.errMsg}");
      },
    );
  }

  ///
  static void getArticleList(
    int page,
    Function(ArticleEntity?) onSuccess,
    Function(String?) onFailed,
  ) async {
    var urlMap = <String, dynamic>{};
    urlMap["num"] = page;
    await DioUtils.getInstance().get<ArticleEntity>(
      WanAndroidApi.articleList,
      null,
      appendUrlMap: urlMap,
      onSuccess: onSuccess,
      onFile: (err) {
        onFailed(err.errMsg);
      },
    );
  }
}
