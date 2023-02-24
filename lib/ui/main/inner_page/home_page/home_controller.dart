import 'package:common_utils/common_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/wxarticle_page/wxarticle_page.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'entity/article_entity.dart';
import 'entity/banner_entity.dart';
import 'entity/wx_article_entity.dart';
import 'home_model.dart';

class HomeController extends GetxController {
  Rx<List<BannerEntity?>?>? bannerList; //banner
  RxList<ArticleEntityDatas?> mArticleEntityDatas =
      <ArticleEntityDatas>[].obs; //首页列表数据
  List<WxArticleEntity?>? wxArticleEntity; //公众号数据

  late EasyRefreshController scrollCon;

  ///当前页
  int curPage = 0;

  @override
  void onInit() {
    scrollCon = EasyRefreshController();
    _initData();
    // _loadWxChapters();
    super.onInit();
  }

  @override
  void onClose() {
    scrollCon.dispose();
    super.onClose();
  }

  void _initData() {
    bannerList = HomeModel.getCacheBannerList().obs;
    HomeModel.getBannerList((data) {
      if (data != null && (bannerList != null && data != bannerList!.value)) {
        bannerList!.value = data;
        HomeModel.saveBannerList(bannerList!.value);
      }
    });

    ///feed List
    loadMoreAndRefreshArticleList(true);
  }

  /// 加载更多与刷新
  loadMoreAndRefreshArticleList(bool isRefresh) async {
    if (isRefresh) {
      curPage = 0;
    } else {
      curPage++;
    }
    HomeModel.getArticleList(curPage, (ArticleEntity? data) {
      bool _hasData =
          ObjectUtil.isNotEmpty(data) && ObjectUtil.isNotEmpty(data!.datas);
      if (_hasData) {
        if (isRefresh) mArticleEntityDatas.clear();
        mArticleEntityDatas.addAll(data.datas!);
      } else {
        if (isRefresh) {
          mArticleEntityDatas.clear();
        } else {
          curPage--;
          SmartDialog.showToast("a~,没有更多内容了");
        }
      }
      scrollCon.finishRefresh(success: true, noMore: _hasData);
      scrollCon.finishLoad(success: true, noMore: _hasData);
    }, (errMsg) {
      if (isRefresh) {
        scrollCon.finishRefresh(success: true, noMore: true);
        return;
      }
      SmartDialog.showToast("a~,没有更多内容了");
      curPage--;
      scrollCon.finishLoad(success: true, noMore: true);
    });
  }

  ///加载公众号数据
  void loadWxChapters() async {
    await HomeModel.getWxChapters((data) {
      wxArticleEntity = data;
      if (ObjectUtil.isNotEmpty(wxArticleEntity)) {
        Get.to(const WxArtoclePage(), arguments: wxArticleEntity);
      }
    });
  }

  ///item的按钮事件
  void onItemClick(ArticleEntityDatas? index) async {
    await Get.to(WebPage(
      url: index?.link,
      title: index?.title,
    ));
  }

  ///收藏
  void onCollectClick(ArticleEntityDatas? index) {
    if (index == null) return;
    LogUtil.d("_onCollectClick: $index");
    if (index.collect ?? true) {
      HomeModel.cancelCollect(index.id, () {
        index.collect = false;
      });
    } else {
      HomeModel.lgCollect(index.id, () {
        index.collect = true;
      });
    }
  }
}
