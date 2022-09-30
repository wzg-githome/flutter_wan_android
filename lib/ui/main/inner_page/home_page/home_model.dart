import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/network/wan_android_api.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/banner_entity.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';

class HomeModel {
  ///banner
  static void getBannerList() {
    DioUtils.getInstance().get<List<BannerEntity>>(
        WanAndroidApi.bannerList, null, onSuccess: (p0) {
      AceLog.e(msg: "onSuccess: $p0");
    }, onFile: (err) {});
  }
}
