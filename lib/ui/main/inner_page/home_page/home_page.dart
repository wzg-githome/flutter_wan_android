import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/ui/common/easy_refresh_custom.dart';
import 'package:flutter_wan_android/ui/common/horizontal_item_widget.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/wxarticle_page/wxarticle_page.dart';
import 'package:flutter_wan_android/utils/image_utils.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../routers.dart';
import 'home_controller.dart';

///首页
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return ObxValue(
        (data) => Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              color: Colors.grey[300],
              child: EasyRefresh(
                header: getCustomHeader(),
                footer: getCustomFooter(),
                enableControlFinishRefresh: true,
                enableControlFinishLoad: true,
                controller: controller.scrollCon,
                onRefresh: () => controller.loadMoreAndRefreshArticleList(true),
                onLoad: () => controller.loadMoreAndRefreshArticleList(false),
                child: ListView.builder(
                    itemCount: controller.mArticleEntityDatas.length + 2,
                    itemBuilder: (_, index) {
                      if (index == 0) {
                        return _builderBanner();
                      } else if (index == 1) {
                        return _builderHorizontalListView();
                      } else {
                        return _builderListItem(index - 2);
                      }
                    }),
              ),
            ),
        controller.mArticleEntityDatas);
  }

  ///banner list
  Widget _builderBanner() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        padding: EdgeInsets.only(top: 5.h),
        child: ObjectUtil.isEmpty(controller.bannerList)
            ? const Center(child: Text("loading..."))
            : Swiper(
                onTap: (index) async {
                  ///launchUrl
                  var url = controller.bannerList!.value![index]?.url;
                  if (url == null) return;
                  Uri uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        size: 10,
                        activeSize: 10,
                        color: Colors.grey,
                        activeColor: Colors.blue)),
                scale: 0.95,
                autoplay: true,
                loop: true,
                control: SwiperControl(
                  color: Colors.blue,
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                ),
                itemCount: controller.bannerList!.value!.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: controller.bannerList!.value![index]!.imagePath!,
                    placeholder: (_, url) => ImageUtils.buildPlaceholder(8.r),
                    imageBuilder: (_, imagePro) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image:
                            DecorationImage(image: imagePro, fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _builderHorizontalListView() {
    return Container(
      height: 72.h,
      margin: EdgeInsets.only(bottom: 8.h, top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HorizontalItemWidget(Icons.chat, "公众号",
              onTap: () => controller.loadWxChapters()),
          HorizontalItemWidget(Icons.favorite, "收藏",
              onTap: () => Get.toNamed(Routers.lgCollectPage)),
          HorizontalItemWidget(Icons.task, "导航",
              onTap: () => SmartDialog.showToast("暂未开发")),
          HorizontalItemWidget(Icons.storage, "哈哈",
              onTap: () => SmartDialog.showToast("暂未开发")),
        ],
      ),
    );
  }

  ///list item and loading
  Widget _builderListItem(index) {
    var _articleEntity = controller.mArticleEntityDatas.length > 2
        ? controller.mArticleEntityDatas[index]
        : null;
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.w))),
      child: _articleEntity == null
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.grey[200],
              ),
              margin: EdgeInsets.only(bottom: 10.h),
              height: 80.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "loading...",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
              ),
            )
          : _buildItem(_articleEntity, onItemClick: () {
              controller.onItemClick(_articleEntity);
            }, onCollectClick: () {
              controller.onCollectClick(_articleEntity);
            }),
    );
  }

  Widget _buildItem(_articleEntity, {onItemClick, onCollectClick}) {
    return GestureDetector(
      onTap: onItemClick,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                "${_articleEntity?.superChapterName}/${_articleEntity?.chapterName}",
                style: TextStyle(fontSize: 14.sp),
              ),
              subtitle: Text(
                HtmlUnescape().convert("${_articleEntity?.title}"),
                style: TextStyle(fontSize: 12.sp),
              ),
              trailing: IconButton(
                onPressed: onCollectClick,
                icon: Icon(
                    _articleEntity?.collect
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.blue),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${_articleEntity?.author}"),
                )),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${_articleEntity?.niceDate}",
                      style:
                          TextStyle(fontSize: 13.sp, color: Colors.blue[600]),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
