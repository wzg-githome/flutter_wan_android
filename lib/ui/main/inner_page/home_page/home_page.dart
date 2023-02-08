import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/ui/common/easy_refresh_custom.dart';
import 'package:flutter_wan_android/ui/common/horizontal_item_widget.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/home_model.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/wxarticle_page/wxarticle_page.dart';
import 'package:flutter_wan_android/utils/image_utils.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

import 'entity/article_entity.dart';
import 'entity/banner_entity.dart';
import 'entity/wx_article_entity.dart';

///首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerEntity?>? _bannerList;
  ArticleEntity? _articleList;
  late EasyRefreshController _scrollCon;

  List<WxArticleEntity?>? _wxArticleEntity; //公众号数据

  ///当前页
  int curPage = 0;

  @override
  void initState() {
    _scrollCon = EasyRefreshController();
    _initData();
    _loadWxChapters();
    super.initState();
  }

  @override
  void dispose() {
    _scrollCon.dispose();
    super.dispose();
  }

  void _initData() {
    _bannerList = HomeModel.getCacheBannerList();
    if (ObjectUtil.isNotEmpty(_bannerList) && mounted) {
      setState(() {});
    }
    HomeModel.getBannerList((data) {
      if (ObjectUtil.isNotEmpty(data) && data != _bannerList) {
        _bannerList = data;
        HomeModel.saveBannerList(_bannerList);
        if (mounted) setState(() {});
      }
    });

    ///feed List
    _loadMoreAndRefreshArticleList(true);
  }

  /// 加载更多与刷新
  void _loadMoreAndRefreshArticleList(bool isRefresh) async {
    if (isRefresh) {
      curPage = 0;
    } else {
      curPage++;
    }
    HomeModel.getArticleList(curPage, (ArticleEntity? data) {
      if (mounted) {
        setState(() {
          if (ObjectUtil.isNotEmpty(data)) {
            if (isRefresh) {
              _articleList = data;
              _scrollCon.finishRefresh(success: true, noMore: false);
            } else {
              if (ObjectUtil.isNotEmpty(data!.datas)) {
                _articleList?.datas?.addAll(data.datas!);
                _scrollCon.finishLoad(success: true, noMore: false);
              } else {
                curPage--;
                _scrollCon.finishRefresh(success: true, noMore: true);
                SmartDialog.showToast("a~,没有更多内容了");
              }
            }
          }
        });
      }
    }, (errMsg) {
      SmartDialog.showToast("a~,没有更多内容了");
      if (mounted) {
        setState(() {
          curPage--;
          _scrollCon.finishRefresh(success: true, noMore: true);
        });
      }
    });
  }

  ///加载公众号数据
  void _loadWxChapters() async {
    await HomeModel.getWxChapters((data) {
      setState(() {
        _wxArticleEntity = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      color: Colors.grey[300],
      child: EasyRefresh(
        header: getCustomHeader(),
        footer: getCustomFooter(),
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        controller: _scrollCon,
        onRefresh: () async {
          _loadMoreAndRefreshArticleList(true);
        },
        onLoad: () async {
          _loadMoreAndRefreshArticleList(false);
        },
        child: ListView.builder(
            itemCount: ObjectUtil.isNotEmpty(_articleList) &&
                    ObjectUtil.isNotEmpty(_articleList?.datas)
                ? _articleList!.datas!.length + 2
                : 10,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _builderBanner();
              } else if (index == 1) {
                return _builderHorizontalListView();
              } else {
                return _builderListItem(index - 2);
              }
            }),
      ),
    );
  }

  ///banner list
  Widget _builderBanner() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        padding: EdgeInsets.only(top: 5.h),
        child: ObjectUtil.isEmpty(_bannerList)
            ? const Center(child: Text("loading..."))
            : Swiper(
                onTap: (index) async {
                  ///launchUrl
                  var url = _bannerList![index]?.url;
                  if (url == null) return;
                  Uri uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        size: 10,
                        activeSize: 10,
                        color: Colors.grey,
                        activeColor: Colors.blue)),
                scale: 0.95,
                autoplay: true,
                loop: true,
                control: SwiperControl(
                  color: Colors.blue,
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                ),
                itemCount: _bannerList!.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: _bannerList![index]!.imagePath!,
                    placeholder: (context, url) =>
                        ImageUtils.buildPlaceholder(8.r),
                    imageBuilder: (context, imagePro) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image:
                            DecorationImage(image: imagePro, fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _builderHorizontalListView() {
    return Container(
      height: 72.h,
      margin: EdgeInsets.only(bottom: 8.h, top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HorizontalItemWidget(Icons.chat, "公众号", onTap: () {
            Get.to(const WxArtoclePage(), arguments: _wxArticleEntity);
          }),
          HorizontalItemWidget(Icons.favorite, "导航", onTap: () {
            SmartDialog.showToast("暂未开发");
          }),
          HorizontalItemWidget(Icons.task, "哈哈", onTap: () {
            SmartDialog.showToast("暂未开发");
          }),
          HorizontalItemWidget(Icons.storage, "哈哈", onTap: () {
            SmartDialog.showToast("暂未开发");
          }),
        ],
      ),
    );
  }

  ///list item and loading
  Widget _builderListItem(index) {
    var _articleEntity = !ObjectUtil.isEmpty(_articleList)
        ? ObjectUtil.isNotEmpty(_articleList!.datas)
            ? _articleList!.datas![index]
            : null
        : null;
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.w))),
      child: ObjectUtil.isEmptyList(_articleList?.datas)
          ? Container(
              margin: EdgeInsets.only(bottom: 10.h),
              height: 80.h,
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "loading...",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
              ),
            )
          : _buildItem(_articleEntity,
              onItemClick: () => _onItemClick(_articleEntity),
              onCollectClick: () => _onCollectClick(_articleEntity)),
    );
  }

  Widget _buildItem(_articleEntity, {onItemClick, onCollectClick}) {
    return GestureDetector(
      onTap: onItemClick,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                "${_articleEntity?.superChapterName}/${_articleEntity?.chapterName}",
                style: TextStyle(fontSize: 14.sp),
              ),
              subtitle: Text(
                HtmlUnescape().convert("${_articleEntity?.title}"),
                style: TextStyle(fontSize: 12.sp),
              ),
              trailing: IconButton(
                onPressed: onCollectClick,
                icon: Icon(
                    _articleEntity?.collect
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.blue),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${_articleEntity?.author}"),
                )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${_articleEntity?.niceDate}",
                      style:
                          TextStyle(fontSize: 13.sp, color: Colors.blue[600]),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///item的按钮事件
  void _onItemClick(ArticleEntityDatas? index) async {
    await Get.to(WebPage(
      url: index?.link,
      title: index?.title,
    ));
  }

  ///收藏
  void _onCollectClick(ArticleEntityDatas? index) {
    if (index == null) return;
    LogUtil.d("_onCollectClick: $index");
    if (index.collect ?? true) {
      HomeModel.cancelCollect(index.id, () {
        if (mounted) {
          setState(() {
            index.collect = false;
          });
        }
      });
    } else {
      HomeModel.lgCollect(index.id, () {
        if (mounted) {
          setState(() {
            index.collect = true;
          });
        }
      });
    }
  }
}
