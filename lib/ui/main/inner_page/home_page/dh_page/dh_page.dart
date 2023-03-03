import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:get/get.dart';

class DHPage extends GetView {
  const DHPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            // title: const Text("导航"),
            // centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title:Text("导航") ,
              centerTitle: true,
              background: Image.network(
                "http://img.haote.com/upload/20180918/2018091815372344164.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ];
      },
      body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(itemBuilder: (_, index) {
            return Container(
              height: 120,
              color: Colors.primaries[index % Colors.primaries.length],
              alignment: Alignment.center,
              child: Text(
                "List ",
                style: TextStyle(color: Colors.white, fontSize: 30.sp),
              ),
            );
          })),
    );
  }
}
