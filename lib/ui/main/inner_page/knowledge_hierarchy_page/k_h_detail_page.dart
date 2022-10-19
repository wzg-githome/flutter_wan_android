import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';
import 'package:flutter_wan_android/ui/common/base_model.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/kh_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  ///默认状态
  // StatusType _statusType = StatusType.loading;
  // late Controller _controller;

  @override
  void initState() {
    // _controller=Controller();
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
        if (ObjectUtil.isNotEmpty(data) && mounted) {
          setState(() {
            if (isRefresh) {
              _detailListEntity = data;
              // _controller.loading(/*function*/);
              ///更新状态
              // _statusType = ObjectUtil.isNotEmpty(_detailListEntity!.datas)
              //     ? StatusType.content
              //     : StatusType.empty;
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
        }
      },
      onFile: (err) {
        if (mounted) {
          setState(() {
            // _statusType = StatusType.error;
            _curPage--;
            SmartDialog.showToast("${err.errMsg}");
            _refreshCon.finishRefresh(success: true, noMore: false);
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
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "loading...",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : _buildItemView(index);
              // return StatusWidget(
              //   controller: _controller,
              //     // mStatusType: _statusType,
              //     loadingWidget: Container(
              //       height: 35.h,
              //       padding: const EdgeInsets.only(left: 10),
              //       margin: const EdgeInsets.only(left: 10, top: 10),
              //       decoration: BoxDecoration(
              //           color: Colors.grey[200],
              //           borderRadius: BorderRadius.circular(8)),
              //       child: const Text(
              //         "loading...",
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //     content: _buildItemView(index));
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
                Container(
                  // color: Colors.blue,
                  child: Row(
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
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
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
                    _collect(curItem);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 3, right: 3, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text(
                          "收藏",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        const Padding(
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

  ///收藏
  void _collect(KHDetailListEntityDatas? curItem) {
    if (curItem == null) return;
    KHModel().lgCollect(curItem.id);
  }
}
