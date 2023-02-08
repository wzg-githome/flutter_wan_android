import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/ui/common/easy_refresh_custom.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/wx_article_detail_entity.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/wx_article_entity.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/widget/wx_article_item_widget.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/widget/wx_article_search_widget.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/wxarticle_page/wx_artocle_model.dart';
import 'package:get/get.dart';

///微信公众号
class WxArtoclePage extends StatefulWidget {
  const WxArtoclePage({Key? key}) : super(key: key);

  @override
  State<WxArtoclePage> createState() => _WxArtoclePageState();
}

class _WxArtoclePageState extends State<WxArtoclePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<WxArticleEntity?>? _wxArticleList; //公众号头部数据
  WxArticleDetailEntity? _wxArticleDetailEntity; //公众数据列表
  late EasyRefreshController _easyRefreshController;
  int _page = 1; //当前的列表页
  int _selectItem = 0; //头部的第几个item

  @override
  void initState() {
    _wxArticleList = Get.arguments;
    _easyRefreshController = EasyRefreshController();
    _tabController = TabController(
        length:
            ObjectUtil.isNotEmpty(_wxArticleList) ? _wxArticleList!.length : 0,
        vsync: this);
    _tabController.addListener(() {
      if (_selectItem != _tabController.index) {
        setState(() {
          _selectItem = _tabController.index;
        });
        _tabController.animateTo(_selectItem);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _easyRefreshController.dispose();
    super.dispose();
  }

  ///加载数据与刷新
  Future<void> _refreshAndLoadMore(
      WxArticleEntity? entity, bool isRefresh) async {
    if (ObjectUtil.isNotEmpty(entity)) {
      int? id = entity!.id;
      if (isRefresh) {
        _page = 1;
      } else {
        _page++;
      }
      WxArtocleModel.getWxListFormId(id, _page, (data) {
        if (mounted) {
          if (ObjectUtil.isNotEmpty(data)) {
            setState(() {
              if (isRefresh) {
                _wxArticleDetailEntity = data;
                _easyRefreshController.finishRefresh(
                    noMore: false, success: true);
              } else {
                if (ObjectUtil.isNotEmpty(data!.datas)) {
                  _wxArticleDetailEntity!.datas!.addAll(data.datas!);
                  _easyRefreshController.finishLoad(
                      noMore: false, success: true);
                } else {
                  _page--;
                  SmartDialog.showToast("~亲，没有更多数据了呢($_page)");
                  _easyRefreshController.finishLoad(
                      noMore: true, success: true);
                }
              }
            });
          } else {
            if (isRefresh) {
              _easyRefreshController.finishLoad(success: false);
            } else {
              _page--;
              _easyRefreshController.finishLoad(noMore: false, success: false);
            }
          }
        }
      }, (err) {
        if (mounted) {
          setState(() {
            SmartDialog.showToast("~亲，没有更多数据了呢($_page)");
            if (isRefresh) {
              _easyRefreshController.finishLoad(success: false);
            } else {
              _page--;
              _easyRefreshController.finishLoad(noMore: false, success: false);
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("公众号"),
      body: Column(
        children: [
          Column(
            children: [
              ///tabBar
              TabBar(
                tabs: _wxArticleList!
                    .map((e) => Container(
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          child: Text("${e?.name}",
                              style: const TextStyle(color: Colors.black)),
                        ))
                    .toList(),
                isScrollable: true,
                controller: _tabController,
                onTap: (index) {
                  if (_selectItem != index) {
                    setState(() {
                      _selectItem = index;
                    });
                  }
                },
              ),

              ///searchView
              WxArticleSearchWidget("${_wxArticleList![_selectItem]?.name}",
                  onSearchTap: (content) =>
                      _onSearchClick(_wxArticleList![_selectItem], content))
            ],
          ),
          Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children:
                    _wxArticleList!.map((e) => _buildListView(e)).toList(),
              ))
        ],
      ),
    );
  }

  ///每个单独fragment
  Widget _buildListView(WxArticleEntity? entity) {
    return EasyRefresh(
      header: getCustomHeader(),
      footer: getCustomFooter(),
      controller: _easyRefreshController,
      firstRefresh: true,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      onRefresh: () => _refreshAndLoadMore(entity, true),
      onLoad: () => _refreshAndLoadMore(entity, false),
      child: ObjectUtil.isNotEmpty(_wxArticleDetailEntity) &&
              ObjectUtil.isNotEmpty(_wxArticleDetailEntity!.datas)
          ? ListView.builder(
              itemCount: _wxArticleDetailEntity!.datas!.length,
              itemBuilder: (context, index) {
                return WxArticleItemWidget(
                  entity: _wxArticleDetailEntity!.datas![index],
                  onTap: () => Get.to(WebPage(
                    url: _wxArticleDetailEntity!.datas![index].link,
                    title: _wxArticleDetailEntity!.datas![index].title,
                  )),
                  onLikeTap: () =>
                      _onLikeClick(_wxArticleDetailEntity!.datas![index]),
                );
              },
            )
          : Container(),
    );
  }

  ///搜索按钮
  void _onSearchClick(WxArticleEntity? entity, String k) {
    if (entity == null) return;
    _page = 1;
    WxArtocleModel.searchWxFormK(entity.id, _page, k, (data) {
      if (data != null) {
        setState(() {
          _wxArticleDetailEntity = data;
        });
      }
    });
  }

  ///收藏与取消收藏
  void _onLikeClick(WxArticleDetailEntityDatas? entity) {
    if (entity == null) return;
    if (entity.collect ?? true) {
      WxArtocleModel.cancelCollect(entity.id, () {
        if (mounted) {
          setState(() {
            entity.collect = false;
          });
        }
      });
    } else {
      WxArtocleModel.lgCollect(entity.id, () {
        if (mounted) {
          setState(() {
            entity.collect = true;
          });
        }
      });
    }
  }
}
