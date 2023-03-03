import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_wan_android/ui/common/kh_detail_item_widget.dart';
import 'package:flutter_wan_android/ui/common/my_easy_refresh.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/kh_model.dart';
import 'package:get/get.dart';

import 'entity/k_h_detail_list_entity.dart';
import 'entity/k_h_entity.dart';

///二级列表详情
class KHDetailPage extends StatefulWidget {
  const KHDetailPage({Key? key}) : super(key: key);

  @override
  State<KHDetailPage> createState() => _KHDetailPageState();
}

class _KHDetailPageState extends State<KHDetailPage> {
  ///二级数据实体
  KHEntityChildren? _mKHEntityChildren;
  KHDetailListEntity? _detailListEntity;
  int _curPage = 0;
  late EasyRefreshController _refreshCon;

  ///当前操作的数据
  bool curIndexCollect = false;

  int curIndex = 0;
  late StatusType _statusType;

  @override
  void initState() {
    _statusType = StatusType.loading;
    _refreshCon = EasyRefreshController();
    _mKHEntityChildren = Get.arguments;
    if (ObjectUtil.isNotEmpty(_mKHEntityChildren)) {
      _refreshAndLoadMoreData(true);
    }
    super.initState();
  }

  @override
  void dispose() {
    _refreshCon.dispose();
    super.dispose();
  }

  _resetStatusLoading() {
    setState(() {
      _statusType = StatusType.loading;
    });
  }

  _resetStatusError() {
    setState(() {
      _statusType = StatusType.error;
    });
  }

  ///刷新状态
  _resetStatus() {
    setState(() {
      _statusType = ObjectUtil.isNotEmpty(_detailListEntity) &&
              ObjectUtil.isNotEmpty(_detailListEntity!.datas)
          ? StatusType.content
          : StatusType.empty;
    });
  }

  _refreshAndLoadMoreData(bool isRefresh) async {
    if (isRefresh) {
      _curPage = 0;
    } else {
      _curPage++;
    }
    KHModel.getArticleListPageDetail(
      _curPage,
      _mKHEntityChildren!.id,
      onSuccess: (KHDetailListEntity? data) {
        if (mounted) {
          if (ObjectUtil.isNotEmpty(data)) {
            setState(() {
              if (isRefresh) {
                _detailListEntity = data;
                _refreshCon.finishRefresh(success: true);
                _resetStatus();
              } else {
                if (ObjectUtil.isNotEmpty(data!.datas)) {
                  _detailListEntity!.datas!.addAll(data.datas!);
                  _refreshCon.finishLoad(success: true, noMore: false);
                  _resetStatus();
                } else {
                  _curPage--;
                  SmartDialog.showToast("~亲，没有更多数据了呢");
                  _refreshCon.finishRefresh(success: true, noMore: true);
                }
              }
            });
          } else {
            setState(() {
              if (isRefresh) {
                _refreshCon.finishRefresh(success: false);
              } else {
                _curPage--;
                _refreshCon.finishLoad(success: false);
              }
            });
          }
        }
      },
      onFile: (err) async {
        if (mounted) {
          setState(() {
            SmartDialog.showToast("${err.errMsg}");
            if (isRefresh) {
              _refreshCon.finishRefresh(success: false, noMore: false);
            } else {
              _curPage--;
              _refreshCon.finishLoad(success: false, noMore: false);
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("${_mKHEntityChildren?.name}"),
      body: MyEasyRefresh(
        easyController: _refreshCon,
        statusType: _statusType,
        // onRetryClick: () => _refreshAndLoadMoreData(true),
        onRetryClick: () {
          _resetStatusLoading();
          _refreshAndLoadMoreData(true);
        },
        onLoad: () => _refreshAndLoadMoreData(false),
        onRefresh: () => _refreshAndLoadMoreData(true),
        child: ListView.builder(
            itemCount: (ObjectUtil.isNotEmpty(_detailListEntity))
                ? _detailListEntity!.datas!.length
                : 0,
            itemBuilder: (context, index) {
              var curItem = ObjectUtil.isNotEmpty(_detailListEntity!.datas)
                  ? _detailListEntity!.datas![index]
                  : null;
              return KHDetailItemWidget(
                  isCollect: _checkCurItemCollect(curItem),
                  author: curItem?.author,
                  title: "${curItem?.superChapterName}/${curItem?.chapterName}",
                  time: curItem?.niceDate,
                  content: curItem?.title,
                  onTap: () => _onClickListItem(curItem),
                  onCollectTap: () => _collect(curItem, index));
            }),
      ),
    );
  }

  ///item的点击事情
  void _onClickListItem(KHDetailListEntityDatas? curItem) async {
    await Get.to(WebPage(
      url: curItem?.link,
      title: curItem?.title,
    ));
  }

  ///当前item是否已经收藏
  bool _checkCurItemCollect(KHDetailListEntityDatas? curItem) {
    if (ObjectUtil.isNotEmpty(curItem)) {
      return curItem!.collect ?? false;
    }
    return false;
  }

  ///收藏
  void _collect(KHDetailListEntityDatas? curItem, index) async {
    if (curItem == null) return;

    if (!BaseModel.dataManager.getLoginStatus()) {
      SmartDialog.showToast("请先登录！");
      return;
    }

    if (ObjectUtil.isNotEmpty(curItem.collect)) {
      curIndex = index;
      curIndexCollect = curItem.collect!;
      if (curItem.collect!) {
        await KHModel.lgUnCollectThis(curItem.id, (data) {
          setState(() {
            curIndexCollect = !curIndexCollect;
            curItem.collect = curIndexCollect;
          });
        });
      } else {
        await KHModel.lgCollect(curItem.id, () {
          setState(() {
            curIndexCollect = !curIndexCollect;
            curItem.collect = curIndexCollect;
          });
        });
      }
    }
  }
}
