import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

class EntityFactory {
  ///可以在这里加入任何需要并且可以转换的类型，例如下面
  static T? generateOBJ<T>(json) {
    return JsonConvert().convert<T>(json);
  }

  static List<T?>? generateOBJList<T>(json) {
    return JsonConvert().convertList<T>(json);
  }
}
