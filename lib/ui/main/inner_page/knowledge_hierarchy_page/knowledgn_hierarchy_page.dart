import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/kh_model.dart';
import 'package:get/get.dart';

import 'entity/k_h_entity.dart';

///知识体系
class KnowledgeHierarchyPage extends StatefulWidget {
  const KnowledgeHierarchyPage({Key? key}) : super(key: key);

  @override
  State<KnowledgeHierarchyPage> createState() => _KnowledgeHierarchyPageState();
}

class _KnowledgeHierarchyPageState extends State<KnowledgeHierarchyPage> {
  bool _isExc = false;
  int _index = 0;

  List<KHEntity?>? _khList;

  @override
  void initState() {
    KHModel.getTreeList(onSuccess: (List<KHEntity?>? data) {
      if (ObjectUtil.isNotEmpty(data) && mounted) {
        setState(() {
          _khList = data;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      // padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          itemCount: ObjectUtil.isNotEmpty(_khList) ? _khList!.length : 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (ObjectUtil.isNotEmpty(_khList) &&
                    ObjectUtil.isNotEmpty(_khList![index]) &&
                    mounted) {
                  setState(() {
                    _isExc = _khList![index]!.curCheck;
                    _index = index;
                    _isExc = !_isExc;
                    _khList![index]!.curCheck = _isExc;
                  });
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: Colors.grey[200],
                    width: ScreenUtil().screenWidth,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${ObjectUtil.isEmpty(_khList) ? "loading..." : (_khList?[index]?.name)}",
                      style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _buildLine(null),
                  (_isExc == true && _index == index)
                      ? _buildSubCategoryView(index)
                      : Container(),
                ],
              ),
            );
          }),
    );
  }

  ///line
  Widget _buildLine(Color? color) {
    return Container(
      height: 0.5.h,
      width: ScreenUtil().screenWidth,
      color: color ?? Colors.blue[300],
    );
  }

  ///二级
  Widget _buildSubCategoryView(index) {
    var _kHEntityChildren = ObjectUtil.isNotEmpty(_khList![index])
        ? _khList![index]!.children
        : null;
    return Container(
      color: Colors.white,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ObjectUtil.isNotEmpty(_kHEntityChildren)
              ? _kHEntityChildren!.length
              : 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(PageList.kHDetailPage,
                        arguments: _kHEntityChildren?[index]);
                  },
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    color: Colors.grey[400],
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.w),
                    child: Text(
                      "${_kHEntityChildren?[index].name}",
                      style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                (ObjectUtil.isNotEmpty(_kHEntityChildren) &&
                        (_kHEntityChildren!.length - 1 == index))
                    ? Container()
                    : _buildLine(Colors.amber)
              ],
            );
          }),
    );
  }
}
