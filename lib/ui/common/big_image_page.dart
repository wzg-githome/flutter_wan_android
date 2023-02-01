import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:get/get.dart';

///查看大图
class BigImagePage extends StatefulWidget {
  const BigImagePage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<BigImagePage> createState() => _BigImagePageState();
}

class _BigImagePageState extends State<BigImagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: Container(
        margin: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: ScreenUtil().statusBarHeight + 15.h,
            bottom: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            isHttp()
                ? CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    height: ScreenUtil().screenHeight -
                        ScreenUtil().statusBarHeight,
                    width: ScreenUtil().screenWidth,
                    imageBuilder: (context, imagePro) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                              image: imagePro,
                              fit: BoxFit.fill,
                            )),
                      );
                    },
                    progressIndicatorBuilder: (context, url, process) {
                      return Center(
                        child:
                            CircularProgressIndicator(value: process.progress),
                      );
                    },
                  )
                : Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          image: AssetImage(widget.imageUrl),
                          fit: BoxFit.fill,
                        )),
                  ),
            Container(
                padding: EdgeInsets.only(top: 10.h, right: 15.w),
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(15.r)),
                    child: const Icon(
                      Icons.close,
                      color: Colors.blue,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  bool isHttp() {
    return widget.imageUrl.startsWith("http");
  }
}
