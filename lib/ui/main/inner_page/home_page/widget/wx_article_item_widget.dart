import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/wx_article_detail_entity.dart';
import 'package:html_unescape/html_unescape.dart';

///微信公众号fragment内的内容itemVIew
class WxArticleItemWidget extends StatefulWidget {
  const WxArticleItemWidget(
      {required this.entity, this.onTap, this.onLikeTap, Key? key})
      : super(key: key);
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLikeTap;
  final WxArticleDetailEntityDatas? entity;

  @override
  State<WxArticleItemWidget> createState() => _ListItemViewState();
}

class _ListItemViewState extends State<WxArticleItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(8.h),
        margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.entity?.author}"),
                Text(
                  "${widget.entity?.superChapterName}/${widget.entity?.chapterName}",
                  style: const TextStyle(color: Colors.blue),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: Text(
                HtmlUnescape().convert("${widget.entity?.title}"),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.entity?.niceDate}",style:  TextStyle(color: Colors.black54,fontSize: 12.sp),),
                GestureDetector(
                  onTap: widget.onLikeTap,
                  child: Icon(
                      widget.entity!.collect!
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.blue),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
