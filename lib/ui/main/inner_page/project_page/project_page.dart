import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';
import 'package:flutter_wan_android/routers.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'entity/project_tree_entity.dart';

///项目
class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<ProjectTreeEntity?>? _projectTreeList;

  late StatusType _statusType;

  @override
  void initState() {
    _statusType = StatusType.loading;
    ProjectModel.getProjectTreeJson((List<ProjectTreeEntity?>? data) {
      if (ObjectUtil.isNotEmpty(data)) {
        if (mounted) {
          setState(() {
            _projectTreeList = data;
            _statusType = StatusType.content;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
        statusType: _statusType,
        content: Container(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          color: Colors.grey[300],
          child: ListView.builder(
              itemCount: ObjectUtil.isNotEmpty(_projectTreeList)
                  ? _projectTreeList!.length
                  : 0,
              itemBuilder: (context, index) => _builderItem(index)),
        ));
  }

  ///list item
  Widget _builderItem(index) {
    var _projectTreeEntity = ObjectUtil.isNotEmpty(_projectTreeList)
        ? _projectTreeList![index]
        : null;
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routers.projectListPage, arguments: _projectTreeEntity);
      },
      child: Container(
        margin: EdgeInsets.only(
            top: 10.h,
            bottom: ObjectUtil.isNotEmpty(_projectTreeList) &&
                    (index == _projectTreeList!.length - 1)
                ? 10.h
                : 0),
        padding: EdgeInsets.all(8.r),
        height: 50.h,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
        alignment: Alignment.centerLeft,
        child: Text("${_projectTreeEntity?.name}"),
      ),
    );
  }
}
