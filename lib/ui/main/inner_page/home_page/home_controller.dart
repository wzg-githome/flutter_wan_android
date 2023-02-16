import 'package:common_utils/common_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/entity/base_page_entity.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:get/get.dart';

import 'entity/article_entity.dart';
import 'entity/banner_entity.dart';
import 'entity/wx_article_entity.dart';
import 'home_model.dart';

class HomeController extends GetxController {
  Rx<List<BannerEntity?>?>? bannerList; //banner
  RxList<ArticleEntityDatas?>? mArticleEntityDatas; //首页列表数据
  Rx<List<WxArticleEntity?>?>? wxArticleEntity; //公众号数据

  late EasyRefreshController scrollCon;

  ///当前页
  int curPage = 0;

  @override
  void onInit() {
    scrollCon = EasyRefreshController();
    _initData();
    _loadWxChapters();
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
    HomeModel.getArticleList(curPage,
        (BasePageEntity<ArticleEntityDatas?>? data) {
      late bool _hasData =
          ObjectUtil.isNotEmpty(data) && ObjectUtil.isNotEmpty(data!.datas);
      if (_hasData) {
        if (isRefresh) mArticleEntityDatas?.clear();
        mArticleEntityDatas?.addAll(data!.datas!);
      } else {
        if (isRefresh) {
          mArticleEntityDatas?.value = [];
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
  void _loadWxChapters() async {
    await HomeModel.getWxChapters((data) {
      wxArticleEntity?.value = data;
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
