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
            left: 15,
            right: 15,
            top: ScreenUtil().statusBarHeight + 15,
            bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
          // border: Border.all(
          //   color: Colors.red,
          //   width: 1.w
          // )
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
              height: ScreenUtil().screenHeight - ScreenUtil().statusBarHeight,
              width: ScreenUtil().screenWidth,
              imageBuilder: (context, imagePro) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: imagePro,
                        fit: BoxFit.fill,
                      )),
                );
              },
              progressIndicatorBuilder: (context, url, process) {
                return Center(
                  child: CircularProgressIndicator(
                    value: process.progress,
                    // backgroundColor: Colors.grey,
                    // semanticsLabel: "hh",
                    // semanticsValue: "${process.progress}",
                    // color: Colors.red,
                  ),
                );
              },
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, right: 15),
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(30 / 2)),
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
}
