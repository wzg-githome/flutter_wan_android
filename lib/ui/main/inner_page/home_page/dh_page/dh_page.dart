import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/status_widget.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/dh_page/dh_controller.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'nav_json_entity.dart';

class DHPage extends GetView<DHController> {
  const DHPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAceAppBar("导航"),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ObxValue(
            (data) => StatusWidget(
                  statusType: controller.statusType.value,
                  content: Obx(() => Row(
                        children: [
                          _builderLeftListView(onChildClick: (index) {
                            controller.animateTo(index);
                          }),
                          Expanded(child: _builderRightListView()),
                        ],
                      )),
                ),
            controller.statusType),
      ),
    );
  }

  _builderLeftListView({required Function(int index) onChildClick}) {
    return Container(
        width: 80.w,
        color: Colors.grey[100],
        child: ListView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: ObjectUtil.isNotEmpty(controller.dataList) &&
                    ObjectUtil.isNotEmpty(controller.dataList!.value)
                ? controller.dataList!.value!.length
                : 0,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => onChildClick(index),
                child: Obx(() => Container(
                      color: controller.selectIndex.value == index
                          ? Colors.white
                          : Colors.grey[300],
                      height: 50.h,
                      alignment: Alignment.center,
                      child: Text(
                        "${controller.dataList?.value?[index]?.name}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: controller.selectIndex.value == index
                                ? Colors.blue
                                : Colors.black),
                      ),
                    )),
              );
            }));
  }

  _builderRightListView() {
    return ScrollablePositionedList.separated(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemScrollController: controller.itemScrollController,
      itemCount: ObjectUtil.isNotEmpty(controller.dataList)
          ? controller.dataList!.value!.length
          : 0,
      itemBuilder: (_, index) {
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: 80.h, maxHeight: 800.h),
          child: _builderFlowItemWidget(index,
              onTap: (index) => controller.onChildClick(index)),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white70,
          padding: EdgeInsets.only(left: 10.w, top: 8.h, bottom: 8.h),
          child: Text(
            "${controller.dataList?.value?[index + 1]?.name}",
            style: TextStyle(color: Colors.blue, fontSize: 20.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }

  _builderFlowItemWidget(parantIndex,
      {required Function(NavJsonEntityArticles? item) onTap}) {
    var navJsonEntity = controller.dataList!.value![parantIndex];
    var isNotNull = ObjectUtil.isNotEmpty(navJsonEntity) &&
        ObjectUtil.isNotEmpty(navJsonEntity!.articles);

    return Container(
      color: Colors.white70,
      padding: EdgeInsets.only(left: 10.w, right: 10.w,top: 10.h,bottom: 10.h),
      child: WaterfallFlow.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: isNotNull ? navJsonEntity!.articles!.length : 0,
          gridDelegate: SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.w,
            crossAxisSpacing: 5.w,
            mainAxisSpacing: 5.w,
          ),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                if (ObjectUtil.isNotEmpty(navJsonEntity) &&
                    ObjectUtil.isNotEmpty(navJsonEntity!.articles)) {
                  onTap(navJsonEntity.articles![index]).call;
                }
              },
              child:ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 10.w,
                  maxWidth: 100.w
                ),
                child:  Container(
                  height: 30.h,
                  padding: EdgeInsets.only(left: 5.w,right: 5.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Text(
                    "${navJsonEntity!.articles?[index].title}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.primaries[index % Colors.primaries.length]
                        [300],
                        fontSize: 14.sp),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
