import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/message_dialog_view.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';
import 'package:flutter_wan_android/network/entity/http_error.dart';
import 'package:flutter_wan_android/ui/common/easy_refresh_custom.dart';
import 'package:flutter_wan_android/ui/common/my_easy_refresh.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/lg_collect_page/lg_collect_model.dart';
import 'package:flutter_wan_android/utils/commin_utils.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

import '../user_model.dart';
import 'lg_collect_entity.dart';

///收藏界面
class LgCollectPage extends StatefulWidget {
  const LgCollectPage({Key? key}) : super(key: key);

  @override
  State<LgCollectPage> createState() => _LgCollectPageState();
}

class _LgCollectPageState extends State<LgCollectPage> {
  int _curPage = 0;
  LgCollectEntity? _lgCollectEntity;
  late LgCollectModel _lgCollectModel;
  late EasyRefreshController _refreshController;
  late StatusType _statusType;

  @override
  void initState() {
    _refreshController = EasyRefreshController();
    _lgCollectModel = LgCollectModel();
    _statusType = StatusType.loading;
    _refreshAndLoadMoreData(true);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }


  void _showDialog() async {
    await SmartDialog.show(
        tag: "logout_dialog",
        widget: MessageDialogView(
          smartDialogTag: "logout_dialog",
          content: "检测到您未登录账号，请前往登录？",
          onClick: (isOk) {
            if (isOk) {
              UserModel.logout();
            } else {
              Get.back();
            }
          },
        ));
  }

  ///加载和刷新数据
  _refreshAndLoadMoreData(bool isRefresh) async {
    if (isRefresh) {
      _curPage = 0;
    } else {
      _curPage++;
    }
    await _lgCollectModel.lgCollectList(_curPage, (LgCollectEntity? data) {
      if (mounted) {
        setState(() {
          if (ObjectUtil.isNotEmpty(data)) {
            if (isRefresh) {
              _lgCollectEntity = data;
              _refreshController.finishRefresh(success: true, noMore: false);
              _statusType = StatusType.content;
            } else {
              if (ObjectUtil.isNotEmpty(data!.datas)) {
                _lgCollectEntity!.datas!.addAll(data.datas!);
                _refreshController.finishLoad(success: true, noMore: false);
              } else {
                _curPage--;
                SmartDialog.showToast("亲~，没有更多数据了");
                _refreshController.finishLoad(success: true, noMore: true);
              }
            }
          } else {
            if (isRefresh) {
              _refreshController.finishRefresh(success: false, noMore: false);
            } else {
              _curPage--;
              _refreshController.finishLoad(success: false, noMore: false);
            }
          }
        });
      }
    }, (HttpError err) async {
      ///待处理
      if (err.errMsg == null ? false : err.errMsg!.contains("请先登录")) {
        SmartDialog.showToast("检测到你未登录账号");
        _showDialog();
        return;
      }
       SmartDialog.showToast("${err.errMsg}");
      if (mounted) {
        setState(() {
          if (isRefresh) {
            _refreshController.finishRefresh(success: false);
          } else {
            _curPage--;
            _refreshController.finishLoad(success: false);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("收藏"),
      body: MyEasyRefresh(
        easyController: _refreshController,
        statusType: _statusType,
        onLoad: () => _refreshAndLoadMoreData(false),
        onRefresh: () => _refreshAndLoadMoreData(true),
        child: ListView.builder(
            itemCount: ObjectUtil.isNotEmpty(_lgCollectEntity) &&
                    ObjectUtil.isNotEmpty(_lgCollectEntity!.datas)
                ? _lgCollectEntity!.datas!.length
                : 10,
            itemBuilder: (context, index) {
              return _buildItemView(index, onItemClick: () {
                _onClickListItem(_lgCollectEntity?.datas![index]);
              }, onCollectClick: () {
                _cancelCollect(_lgCollectEntity?.datas![index]);
              });
            }),
      ),
    );
  }

  ///item
  Widget _buildItemView(index, {onItemClick, onCollectClick}) {
    var curItem = ObjectUtil.isNotEmpty(_lgCollectEntity!.datas)
        ? _lgCollectEntity!.datas![index]
        : null;
    return InkWell(
      onTap: onItemClick,
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(8.r)),
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
                      height: 25.h,
                      width: 25.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.w),
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
                  margin: EdgeInsets.only(left: 5.w),
                  height: 20.h,
                  child: Text(
                    "${curItem?.chapterName}",
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
              margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: Text(
                HtmlUnescape().convert("${curItem?.title}"),
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
                  onTap: onCollectClick,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Row(
                      children: [
                        Text(
                          "取消收藏",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 12.sp,
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

  ///item事件
  _onClickListItem(LgCollectEntityDatas? curItem) async {
    if (curItem == null) return;
    await Get.to(WebPage(url: curItem.link, title: curItem.title));
  }

  ///取消收藏
  _cancelCollect(LgCollectEntityDatas? curItem) async {
    if (curItem == null) return;
    bool _isOrigin = ObjectUtil.isNotEmpty(curItem.origin);
    LogUtil.d("origin is $_isOrigin");
    await _lgCollectModel.cancelCollect(
        _isOrigin, _isOrigin ? curItem.id : curItem.originId, (data) async {
      ///极致的性能，直接remove当前数据
      setState(() {
        _lgCollectEntity?.datas?.remove(curItem);
      });
    });
  }
}
