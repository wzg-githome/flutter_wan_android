import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';
import 'package:flutter_wan_android/network/download_apk_util.dart';
import 'package:flutter_wan_android/ui/common/big_image_page.dart';
import 'package:flutter_wan_android/ui/common/my_easy_refresh.dart';
import 'package:flutter_wan_android/ui/common/project_item_widget.dart';
import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_model.dart';
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
  late StatusType _statusType;

  @override
  void initState() {
    _statusType = StatusType.loading;
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
  _refreshAndroidLoadMore(bool isRefresh) async {
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
              _statusType = StatusType.content;
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
      appBar: getAceAppBar("${_projectTreeEntity?.name}",
          isLeading: true, onBackClick: () => Get.back()),
      body: MyEasyRefresh(
        easyController: _refreshController,
        statusType: _statusType,
        onLoad: () => _refreshAndroidLoadMore(false),
        onRefresh: () => _refreshAndroidLoadMore(true),
        child: ListView.builder(
            itemCount: ObjectUtil.isNotEmpty(_projectList) &&
                    ObjectUtil.isNotEmpty(_projectList!.datas)
                ? _projectList!.datas!.length
                : 0,
            itemBuilder: (context, index) {
              var _curItem = ObjectUtil.isNotEmpty(_projectList) &&
                      ObjectUtil.isNotEmpty(_projectList!.datas)
                  ? _projectList!.datas![index]
                  : null;
              return ProjectItemWidget(
                imageUrl: "${_curItem?.envelopePic}",
                title: "${_curItem?.title}",
                content: "${_curItem?.desc}",
                time: "${_curItem?.niceDate}",
                author: "${_curItem?.author}",
                apkUrl: _curItem?.apkLink,
                onTap: () => _onItemClick(_curItem),
                onImageTap: () => _onClickImage(_curItem?.envelopePic),
                onDownloadTap: () => _onClickDownload(_curItem?.apkLink),
              );
            }),
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
    DownloadApkUtil.downloadAndInstallFile(ObjectUtil.isNotEmpty(url)
        ? url
        : "https://mco-image.walmartmobile.cn/image/apk/SAMS_STORE_OFS_V2.33.2_PRODUCT_10-25_07-53_82c73e2.apk");
  }
}
