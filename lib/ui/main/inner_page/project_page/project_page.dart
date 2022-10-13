import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_mode.dart';
import 'package:get/get.dart';

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
        setState(() {
          _projectTreeList = data;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
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

  ///
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
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.centerLeft,
              child: Text("${_projectTreeEntity?.name}"),
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 10),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Text("loading..."),
            ),
          );
  }
}
