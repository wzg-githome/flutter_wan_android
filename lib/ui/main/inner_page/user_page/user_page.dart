import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/message_dialog_view.dart';
import 'package:flutter_wan_android/page_list.dart';
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
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          _builderHeader(),
          _builderItem("收藏", "❥(^_-)", onTap: () async {
            await Get.toNamed(PageList.lgCollectPage);
          }),
          _builderItem("其他", "other", onTap: () {}),
          _builderItem("清除缓存", "10M", onTap: () {}),
          _builderItem("退出登录", "", onTap: () => _logout()),
        ],
      ),
    );
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
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///头像
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(100 / 2),
                    image: const DecorationImage(
                        image: AssetImage("asset/images/photo.png"))),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderItem("name", UserModel.getLoginName(),
                        const EdgeInsets.only(top: 10)),
                    _buildHeaderItem(
                        "sex", "未知", const EdgeInsets.only(top: 10)),
                    _buildHeaderItem("物种", "未知", const EdgeInsets.only(top: 10))
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
                text: "我就写个性签名，气死你=》${UserModel.getLoginName()},你若安好，便是晴天",
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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
            padding: const EdgeInsets.only(left: 4),
            child: Text("$value",
                style: TextStyle(color: Colors.black, fontSize: 14.sp)),
          )
        ],
      ),
    );
  }
}
