import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
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

  @override
  void initState() {
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

  _refreshAndLoadMoreData(bool isRefresh) {
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
              } else {
                if (ObjectUtil.isNotEmpty(data!.datas)) {
                  _detailListEntity!.datas!.addAll(data.datas!);
                  _refreshCon.finishLoad(success: true, noMore: false);
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
      body: EasyRefresh(
        controller: _refreshCon,
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        onLoad: () async {
          _refreshAndLoadMoreData(false);
        },
        onRefresh: () async {
          _refreshAndLoadMoreData(true);
        },
        child: ListView.builder(
            itemCount: (ObjectUtil.isNotEmpty(_detailListEntity))
                ? _detailListEntity!.datas!.length
                : 10,
            itemBuilder: (context, index) {
              return ObjectUtil.isEmpty(_detailListEntity)
                  ? Container(
                      height: 50.h,
                      padding: const EdgeInsets.only(left: 10),
                      margin: const EdgeInsets.only(left: 10, top: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child:  Text(
                        "loading...",style: TextStyle(
                        fontSize: 14.sp
                      ),
                      ),
                    )
                  : _buildItemView(index);
            }),
      ),
    );
  }

  Widget _buildItemView(index) {
    var curItem = ObjectUtil.isNotEmpty(_detailListEntity!.datas)
        ? _detailListEntity!.datas![index]
        : null;
    return InkWell(
      onTap: () {
        _onClickListItem(curItem);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "asset/images/icon_author.png",
                      height: 25,
                      width: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      // height: 20,
                      child: Text(
                        "${curItem?.author}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: 20,
                  child: Text(
                    "${curItem?.superChapterName}/${curItem?.chapterName}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "${curItem?.title}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${curItem?.niceDate}"),
                InkWell(
                  onTap: () {
                    _collect(curItem, index);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 3, right: 3, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                        color: _checkCurItemCollect(curItem)
                            ? Colors.grey
                            : Colors.blue[600],
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text(
                          _checkCurItemCollect(curItem) ? "已收藏" : "收藏",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        _checkCurItemCollect(curItem)
                            ? Container()
                            : const Padding(
                                padding: EdgeInsets.only(left: 2),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
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
