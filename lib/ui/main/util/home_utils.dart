import 'package:common_utils/common_utils.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/banner_entity.dart';
import 'package:flutter_wan_android/utils/commin_utils.dart';
import 'package:flutter_wan_android/utils/sp_constant.dart';
import 'package:sp_util/sp_util.dart';

class HomeUtils {
  static const _tag = "HomeUtils";

  ///get bannerList
  static List<BannerEntity?>? getBannerList() {
    var string = SpUtil.getString(SPConstant.bannerList);
    if (string == null) {
      return null;
    }
    List<BannerEntity?>? _bannerList = JsonUtil.getObjectList(
        string, (v) => BannerEntity.fromJson(v as Map<String, dynamic>));
    LogUtil.e("getBannerList:\n${_bannerList?.toString()}", tag: _tag);
    return _bannerList;
  }

  ///put bannerList
  static void saveBannerList(List<BannerEntity?>? bannerList) async {
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
