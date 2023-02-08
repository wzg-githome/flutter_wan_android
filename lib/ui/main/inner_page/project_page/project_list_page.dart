import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/network/download_apk_util.dart';
import 'package:flutter_wan_android/ui/common/big_image_page.dart';
import 'package:flutter_wan_android/ui/common/easy_refresh_custom.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_model.dart';
import 'package:flutter_wan_android/utils/image_utils.dart';
import 'package:get/get.dart';

import 'entity/project_list_entity.dart';
import 'entity/project_tree_entity.dart';

///项目list节目
class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  ProjectTreeEntity? _projectTreeEntity;
  ProjectListEntity? _projectList;
  late EasyRefreshController _refreshController;
  int _curPage = 0;
  int? _cid;

  @override
  void initState() {
    _refreshController = EasyRefreshController();
    _projectTreeEntity = Get.arguments;
    if (ObjectUtil.isNotEmpty(_projectTreeEntity)) {
      _cid = _projectTreeEntity!.id;
      _refreshAndroidLoadMore(true);
    }
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  ///刷新与加载数据
  void _refreshAndroidLoadMore(bool isRefresh) async {
    if (isRefresh) {
      _curPage = 0;
    } else {
      _curPage++;
    }
    await ProjectModel.getProjectList(_cid, _curPage,
        (ProjectListEntity? data) {
      if (mounted) {
        if (ObjectUtil.isNotEmpty(data)) {
          setState(() {
            if (isRefresh) {
              _projectList = data;
              _refreshController.finishRefresh(noMore: false, success: true);
            } else {
              if (ObjectUtil.isNotEmpty(data!.datas)) {
                _projectList!.datas!.addAll(data.datas!);
                _refreshController.finishLoad(noMore: false, success: true);
              } else {
                _curPage--;
                SmartDialog.showToast("~亲，没有更多数据了呢($_curPage)");
                _refreshController.finishLoad(noMore: true, success: true);
              }
            }
          });
        } else {
          if (isRefresh) {
            _refreshController.finishLoad(success: false);
          } else {
            _curPage--;
            _refreshController.finishLoad(noMore: false, success: false);
          }
        }
      }
    }, () {
      if (mounted) {
        setState(() {
          SmartDialog.showToast("~亲，没有更多数据了呢($_curPage)");
          if (isRefresh) {
            _refreshController.finishLoad(success: false);
          } else {
            _curPage--;
            _refreshController.finishLoad(noMore: false, success: false);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("${_projectTreeEntity?.name}", isLeading: true,
          onBackClick: () {
        Get.back();
      }),
      body: EasyRefresh(
        header: getCustomHeader(),
        footer: getCustomFooter(),
        enableControlFinishLoad: true,
        enableControlFinishRefresh: true,
        controller: _refreshController,
        onLoad: () async {
          _refreshAndroidLoadMore(false);
        },
        onRefresh: () async {
          _refreshAndroidLoadMore(true);
        },
        child: ListView.builder(
            itemCount: ObjectUtil.isNotEmpty(_projectList)
                ? ObjectUtil.isNotEmpty(_projectList!.datas)
                    ? _projectList!.datas!.length
                    : 10
                : 10,
            itemBuilder: (context, index) {
              return _builderItem(index);
            }),
      ),
    );
  }

  Widget _builderItem(index) {
    var curItem = ObjectUtil.isNotEmpty(_projectList)
        ? ObjectUtil.isNotEmpty(_projectList!.datas)
            ? _projectList!.datas![index]
            : null
        : null;
    return curItem == null
        ? Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            padding: EdgeInsets.only(left: 10.w),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey[200],
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "loading...",
              style: TextStyle(fontSize: 14.sp),
            ),
          )
        : GestureDetector(
            onTap: () {
              _onItemClick(curItem);
            },
            child: Container(
              width: ScreenUtil().screenWidth,
              margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.grey[200]),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onClickImage(curItem.envelopePic);
                      },
                      child: CachedNetworkImage(
                        imageUrl: "${curItem.envelopePic}",
                        placeholder: (context, url) {
                          return ImageUtils.buildPlaceholder(8.r,
                              width: 90.w, height: 135.h);
                        },
                        imageBuilder: (context, imagePro) {
                          return Container(
                            width: 90.w,
                            height: 135.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: imagePro,
                                )),
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "asset/images/icon_author.png",
                                width: 20.w,
                                height: 20.h,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  "${curItem.title}",
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ))
                            ],
                          ),
                          Expanded(
                              child: Container(
                            // color: Colors.white,
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: Text(
                              "${curItem.desc}",
                              maxLines: 4,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black),
                            ),
                          )),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10.w),
                                child: Text("${curItem.niceDate}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.blue[300],
                                        fontSize: 10.sp)),
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${curItem.author}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.sp),
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: ObjectUtil.isNotEmpty(
                                            curItem.apkLink)
                                        ? GestureDetector(
                                            onTap: () {
                                              _onClickDownload(curItem.apkLink);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5.r),
                                              child: Text(
                                                "下载",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12.sp),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            "无",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                    flex: 1,
                                  )
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
  }

  ///item点击事件
  void _onItemClick(ProjectListEntityDatas? curItem) async {
    await Get.to(WebPage(
      url: curItem?.link,
      title: curItem?.title,
    ));
  }

  ///点击图片的事件
  void _onClickImage(url) async {
    await Get.to(BigImagePage(imageUrl: url));
  }

  ///点击下载按钮
  void _onClickDownload(url) {
    //https://mco-image.walmartmobile.cn/image/apk/SAMS_STORE_OFS_V2.33.2_PRODUCT_10-25_07-53_82c73e2.apk
    DownloadApkUtil.downloadAndInstallFile(ObjectUtil.isNotEmpty(url)
        ? url
        : "https://mco-image.walmartmobile.cn/image/apk/SAMS_STORE_OFS_V2.33.2_PRODUCT_10-25_07-53_82c73e2.apk");
  }
}
