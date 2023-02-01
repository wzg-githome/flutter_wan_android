import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page_list.dart';
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

  @override
  void initState() {
    ProjectModel.getProjectTreeJson((List<ProjectTreeEntity?>? data) {
      if (ObjectUtil.isNotEmpty(data)) {
        if (mounted) {
          setState(() {
            _projectTreeList = data;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(left: 10.w, right: 10.w),
      color: Colors.grey[300],
      child: ListView.builder(
          itemCount: ObjectUtil.isNotEmpty(_projectTreeList)
              ? _projectTreeList!.length
              : 10,
          itemBuilder: (context, index) {
            return _builderItem(index);
          }),
    );
  }

  ///list item
  Widget _builderItem(index) {
    var _projectTreeEntity = ObjectUtil.isNotEmpty(_projectTreeList)
        ? _projectTreeList![index]
        : null;
    return ObjectUtil.isNotEmpty(_projectTreeEntity)
        ? GestureDetector(
            onTap: () {
              Get.toNamed(PageList.projectListPage,
                  arguments: _projectTreeEntity);
            },
            child: Container(
              margin:  EdgeInsets.only(top: 10.h),
              padding:  EdgeInsets.all(8.r),
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.centerLeft,
              child: Text("${_projectTreeEntity?.name}"),
            ),
          )
        : Container(
            margin:  EdgeInsets.only(top: 10.h),
            height: 50.h,
            alignment: Alignment.centerLeft,
            padding:  EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.r)),
            child: Text(
              "loading...",
              style: TextStyle(fontSize: 16.sp),
            ),
          );
  }
}
