import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/banner_entity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

///sp接口层
abstract class AbsSPManager {
  Future<void> setLoginStatus(bool isLogin);

  bool getLoginStatus();

  Future<void> setLoginName(String name);

  String? getLoginName();

  Future<void> putBannerList(List<BannerEntity?>? bannerList);

  /*List<BannerEntity?>?*/RxList<BannerEntity?> getCacheBannerList();
}
