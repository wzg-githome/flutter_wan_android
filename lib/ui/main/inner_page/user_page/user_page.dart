import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/message_dialog_view.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/user_model.dart';

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
          _builderItem("收藏", "❥(^_-)", onTap: () {}),
          _builderItem("其他", "other", onTap: () {}),
          _builderItem("清除缓存", "10M", onTap: () {}),
          _builderItem("退出登录", "", onTap: () => _logout()),
        ],
      ),
    );
  }

  void _logout() {
    SmartDialog.show(
        tag: "logout_dialog",
        widget: MessageDialogView(
          smartDialogTag: "logout_dialog",
          content: "确认退出吗？dfdskfdjsfkdhsjffhdsjfhdjsfdhjsfhdjsfhdjsfhjs",
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("name: ${UserModel.getLoginName()}",
                          style: _buildStyle()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("sex: 未知", style: _buildStyle()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("物种: 人类", style: _buildStyle()),
                    ),
                  ],
                ),
              )
            ],
          ),

          ///name
          Text(
            "个性签名: 我就写个性签名，气死你=》${UserModel.getLoginName()},你若安好，便是晴天",
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          )
        ],
      ),
    );
  }

  ///字体style
  TextStyle _buildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
    );
  }

  Widget _builderItem(String? leftText, String? rightText,
      {GestureTapCallback? onTap}) {
    return InkWell(
      splashColor: Colors.red,
      // hoverColor: Colors.red,
      // focusColor: Colors.red,
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
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            Text(
              "$rightText",
              style: TextStyle(color: Colors.black54, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
