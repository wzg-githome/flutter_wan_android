import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/home_model.dart';
import 'package:flutter_wan_android/ui/main/util/home_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';

import 'entity/article_entity.dart';
import 'entity/banner_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerEntity?>? _bannerList;
  ArticleEntity? _articleList;
  late EasyRefreshController _scrollCon;

  ///当前页
  int curPage = 0;

  @override
  void initState() {
    _scrollCon = EasyRefreshController();
    _initData();
    super.initState();
  }

  @override
  void dispose() {
    _scrollCon.dispose();
    super.dispose();
  }

  void _initData() {
    _bannerList = HomeUtils.getBannerList();
    if (ObjectUtil.isNotEmpty(_bannerList)) {
      setState(() {});
    }
    HomeModel.getBannerList((data) {
      setState(() {
        if (ObjectUtil.isNotEmpty(data)) {
          _bannerList = data;
          HomeUtils.saveBannerList(_bannerList);
        }
      });
    });

    ///feed List
    _loadMoreAndRefreshArticleList(true);
  }

  void _loadMoreAndRefreshArticleList(bool isRefresh) async {
    if (isRefresh) {
      curPage = 0;
    } else {
      curPage++;
    }
    HomeModel.getArticleList(curPage, (ArticleEntity? data) {
      setState(() {
        if (!ObjectUtil.isEmpty(data)) {
          if (isRefresh) {
            _articleList = data;
            _scrollCon.finishRefresh(success: true, noMore: false);
          } else {
            _articleList?.datas?.addAll(data!.datas!);
            _scrollCon.finishLoad(success: true);
          }
        }
      });
    }, (errMsg) {
      SmartDialog.showToast("a~,没有更多内容了");
      setState(() {
        curPage--;
        _scrollCon.finishRefresh(success: true, noMore: true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: EasyRefresh(
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
            itemCount: ObjectUtil.isEmpty(_articleList)
                ? 10
                : (ObjectUtil.isEmpty(_articleList?.datas)
                    ? 10
                    : _articleList?.datas!.length),
            itemBuilder: (context, index) {
              if (index == 0) {
                return builderBanner();
              } else {
                return builderListItem(index);
              }
            }),
      ),
    );
  }

  ///banner list
  Widget builderBanner() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        padding: EdgeInsets.all(5.h),
        height: 200.h,
        child: ObjectUtil.isEmpty(_bannerList)
            ? const Center(
                child: Text("loading..."),
              )
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
                control: const SwiperControl(
                  color: Colors.blue,
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 10,
                  ),
                ),
                itemCount: _bannerList!.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: _bannerList![index]!.imagePath!,
                        placeholder: (context, url) {
                          return Container(
                            color: Colors.grey[200],
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "loading...",
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                          );
                        },
                      ));
                },
              ),
      ),
    );
  }

  ///list item
  Widget builderListItem(index) {
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
              margin: const EdgeInsets.only(bottom: 10),
              height: 40 * 2,
              color: Colors.grey[200],
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "loading...",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
              ),
            )
          : buildItem(_articleEntity),
    );
  }

  Widget buildItem(_articleEntity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
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
            trailing: Container(
              height: 30,
              width: 30,
              color: Colors.blue,
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
                    style: TextStyle(fontSize: 13.sp, color: Colors.blue[600]),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
