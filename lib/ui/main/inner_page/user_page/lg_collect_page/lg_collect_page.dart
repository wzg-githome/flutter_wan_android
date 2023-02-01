import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/network/entity/http_error.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/lg_collect_page/lg_collect_model.dart';
import 'package:get/get.dart';

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

  @override
  void initState() {
    _refreshController = EasyRefreshController();
    _lgCollectModel = LgCollectModel();
    _refreshAndLoadMoreData(true);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  ///加载和刷新数据
  Future<void> _refreshAndLoadMoreData(bool isRefresh) async {
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
      await SmartDialog.showToast("${err.errMsg}");

      ///待处理
      if (err.errMsg == null ? false : err.errMsg!.contains("请先登录")) {
        UserModel.logout();
        return;
      }
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
      body: EasyRefresh(
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        onLoad: () async {
          await _refreshAndLoadMoreData(false);
        },
        onRefresh: () async {
          await _refreshAndLoadMoreData(true);
        },
        controller: _refreshController,
        child: ListView.builder(
            itemCount: ObjectUtil.isNotEmpty(_lgCollectEntity)
                ? ObjectUtil.isNotEmpty(_lgCollectEntity!.datas)
                    ? _lgCollectEntity!.datas!.length
                    : 10
                : 10,
            itemBuilder: (context, index) {
              return ObjectUtil.isNotEmpty(_lgCollectEntity)
                  ? _buildItemView(index)
                  : Container(
                      height: 50.h,
                      color: Colors.grey[200],
                      padding: EdgeInsets.only(left: 10.w),
                      margin: EdgeInsets.only(top: 2.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "loadding",
                          style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                        ),
                      ),
                    );
            }),
      ),
    );
  }

  ///item
  Widget _buildItemView(index) {
    var curItem = ObjectUtil.isNotEmpty(_lgCollectEntity!.datas)
        ? _lgCollectEntity!.datas![index]
        : null;

    // bool _like=curItem==null?false:curItem.c;

    return InkWell(
      onTap: () => _onClickListItem(curItem),
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
                  onTap: () => _cancelCollect(curItem),
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
    await Get.to(WebPage(url: curItem?.link, title: curItem?.title));
  }

  ///取消收藏
  _cancelCollect(LgCollectEntityDatas? curItem) async {
    await _lgCollectModel.cancelLgCollect(curItem?.id, (data) async {
      ///重新加载数据
      // await _refreshAndLoadMoreData(true);
      // _refreshController.callRefresh();
      ///极致的性能，直接remove当前数据
      setState(() {
        _lgCollectEntity?.datas?.remove(curItem);
      });
    });
  }
}
