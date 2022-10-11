import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/network/wan_android_api.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:get/get.dart';

class UserModel{
  
  
  static void logout(){
    DioUtils.getInstance().get(WanAndroidApi.logout, null, onSuccess: (data){
      Get.offAllNamed(PageList.loginPage);
    }, onFile: (err){
      SmartDialog.showToast("msg: ${err.errMsg}");
    });
  }
}