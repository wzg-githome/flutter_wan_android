import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/login/login_entity.dart';
import 'package:flutter_wan_android/ui/register/register_entity.dart';

class EntityFactory {
  ///可以在这里加入任何需要并且可以转换的类型，例如下面
  static T? generateOBJ<T>(json) {

    return JsonConvert().convert<T>(json);
    // if (json == null) {
    //   return null;
    // } else if (T.toString() == "RegisterEntity") {
    //   return RegisterEntity.fromJson(json) as T;
    // } else if (T.toString() == "LoginEntity") {
    //   return LoginEntity.fromJson(json) as T;
    // } else {
    //   return json as T;
    // }
  }
}
