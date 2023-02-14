import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

///知识体系详情的item widget
class KHDetailItemWidget extends StatefulWidget {
  ///onTap
  final GestureTapCallback? onTap;

  ///onCollectTap
  final GestureTapCallback? onCollectTap;

  ///author
  final String? author;

  ///title
  final String? title;

  ///subTitle
  final String? content;

  ///time
  final String? time;

  ///isCollect
  final bool isCollect;

  const KHDetailItemWidget(
      {required this.isCollect,
      this.author,
      this.title,
      this.content,
      this.time,
      this.onTap,
      this.onCollectTap,
      Key? key})
      : super(key: key);

  @override
  State<KHDetailItemWidget> createState() => _KHDetailItemWidgetState();
}

class _KHDetailItemWidgetState extends State<KHDetailItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
                      child: Text(
                        "${widget.author}",
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
                    "${widget.title}",
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
                "${widget.content}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.time}"),
                InkWell(
                  onTap: widget.onCollectTap,
                  child: Container(
                    padding: EdgeInsets.all(3.r),
                    decoration: BoxDecoration(
                        color:
                            widget.isCollect ? Colors.grey : Colors.blue[600],
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Row(
                      children: [
                        Text(
                          widget.isCollect ? "已收藏" : "收藏",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        widget.isCollect
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Icon(
                                  Icons.add,
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
}
