import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan_android/utils/image_utils.dart';

///项目的item widget
class ProjectItemWidget extends StatefulWidget {
  ///item事件
  final GestureTapCallback? onTap;

  ///图片事件
  final GestureTapCallback? onImageTap;

  ///apk下载事件
  final GestureTapCallback? onDownloadTap;

  ///图片url
  final String imageUrl;

  ///title
  final String title;

  ///content
  final String content;

  ///time
  final String time;

  ///author
  final String author;

  ///apkUrl
  final String? apkUrl;

  const ProjectItemWidget(
      {required this.imageUrl,
      required this.title,
      required this.content,
      required this.time,
      required this.author,
      this.apkUrl,
      this.onTap,
      this.onImageTap,
      this.onDownloadTap,
      Key? key})
      : super(key: key);

  @override
  State<ProjectItemWidget> createState() => _ProjectItemWidgetState();
}

class _ProjectItemWidgetState extends State<ProjectItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: ScreenUtil().screenWidth,
        margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: Colors.grey[200]),
        child: IntrinsicHeight(
          child: Row(
            children: [
              GestureDetector(
                onTap: widget.onImageTap,
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  placeholder: (context, url) => ImageUtils.buildPlaceholder(
                      8.r,
                      width: 90.w,
                      height: 135.h),
                  imageBuilder: (context, imagePro) => Container(
                    width: 90.w,
                    height: 135.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: imagePro,
                        )),
                  ),
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
                            widget.title,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                        ))
                      ],
                    ),
                    Expanded(
                        child: Container(
                      // color: Colors.white,
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Text(
                        widget.content,
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                    )),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.w),
                          child: Text(widget.time,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.blue[300], fontSize: 10.sp)),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.author,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.sp),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: ObjectUtil.isNotEmpty(widget.apkUrl)
                                  ? GestureDetector(
                                      onTap: widget.onDownloadTap,
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
                                          color: Colors.grey, fontSize: 12.sp),
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
}
