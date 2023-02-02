import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/message_dialog_view.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter_wan_android/ui/common/big_image_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/synopsis_page/synopsis_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/user_model.dart';
import 'package:get/get.dart';

///用户
class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(10.r),
      child: ListView(
        children: [
          _builderHeader(),
          _builderItem("收藏", "❥(^_-)", onTap: () async {
            await Get.toNamed(PageList.lgCollectPage);
          }),
          _builderItem("其他", "other", onTap: () => _toast()),
          _builderItem("介绍与声明", "read",
              onTap: () => Get.to(const SynopsisPage())),
          _builderItem("清除缓存", "10M", onTap: () => _toast()),
          _builderItem("退出登录", "", onTap: () => _logout()),
        ],
      ),
    );
  }

  void _toast() {
    SmartDialog.showToast("暂未开放!!!");
  }

  void _logout() async {
    await SmartDialog.show(
        tag: "logout_dialog",
        widget: MessageDialogView(
          smartDialogTag: "logout_dialog",
          content: "确认退出吗？",
          onClick: (isOk) {
            if (isOk) UserModel.logout();
          },
        ));
  }

  Widget _builderHeader() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10.r)),
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///头像
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.to(const BigImagePage(
                    imageUrl: "asset/images/app_splash_bg.png")),
                child: Container(
                  height: 100.h,
                  width: 100.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50.h),
                      image: const DecorationImage(
                          image: AssetImage("asset/images/app_splash_bg.png"),
                          fit: BoxFit.fill)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderItem("name", UserModel.getLoginName(),
                        EdgeInsets.only(top: 10.h)),
                    _buildHeaderItem("sex", "未知", EdgeInsets.only(top: 10.h)),
                    _buildHeaderItem("物种", "未知", EdgeInsets.only(top: 10.h))
                  ],
                ),
              )
            ],
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "个性签名: ",
                style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
            TextSpan(
                text: "${UserModel.getLoginName()},你若安好，便是晴天",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ))
          ])),
        ],
      ),
    );
  }

  ///listItem
  Widget _builderItem(String? leftText, String? rightText,
      {GestureTapCallback? onTap}) {
    return InkWell(
      splashColor: Colors.red,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey[50],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$leftText",
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            Text(
              "$rightText",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  ///header Item
  Widget _buildHeaderItem(String title, String? value, padding) {
    return Container(
      padding: padding,
      child: Row(
        children: [
          Text("$title: ",
              style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Text("$value",
                style: TextStyle(color: Colors.black, fontSize: 14.sp)),
          )
        ],
      ),
    );
  }
}
