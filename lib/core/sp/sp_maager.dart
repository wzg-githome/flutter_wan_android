import 'package:common_utils/common_utils.dart';
import 'package:flutter_wan_android/core/sp_constant.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/banner_entity.dart';
import 'package:sp_util/sp_util.dart';

import 'abs_sp_manager.dart';

///sp实现层
class SPManager extends AbsSPManager {
  static const _tag = "SPManager";

  @override
  Future<void> setLoginStatus(bool isLogin) async {
    await SpUtil.putBool(SPConstant.loginStatus, isLogin);
  }

  @override
  bool getLoginStatus() {
    var isLogin = SpUtil.getBool(SPConstant.loginStatus, defValue: false);
    LogUtil.d("isLogin: $isLogin", tag: _tag);
    return isLogin!;
  }

  @override
  Future<void> setLoginName(String name) async {
    await SpUtil.putString(SPConstant.loginName, name);
  }

  @override
  String? getLoginName() {
    return SpUtil.getString(SPConstant.loginName);
  }

  @override
  List<BannerEntity?>? getCacheBannerList() {
    var string = SpUtil.getString(SPConstant.bannerList);
    if (string == null)  return null;
    List<BannerEntity?>? _bannerList = JsonUtil.getObjectList(
        string, (v) => BannerEntity.fromJson(v as Map<String, dynamic>));
    LogUtil.e("getBannerList:\n${_bannerList?.toString()}", tag: _tag);
    return _bannerList;
  }

  @override
  Future<void> putBannerList(List<BannerEntity?>? bannerList) async {
    if (bannerList == null) return;
    if (bannerList.isEmpty) return;
    var encodeObj = JsonUtil.encodeObj(bannerList);
    if (encodeObj == null) {
      throw Exception("saveBannerList : encodeObj is null");
    }
    bool? isSave = await SpUtil.putString(SPConstant.bannerList, encodeObj);
    LogUtil.e("saveBannerList:\n$isSave", tag: _tag);
  }
}
