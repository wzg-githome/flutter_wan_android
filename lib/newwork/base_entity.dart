import 'entity_factory.dart';

///拿到服务器数据后，我们希望转换成自己方便使用的model结构
class BaseEntity<T> {
  String? code;
  String? message;
  String? serverMessage;
  T? data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(json) {
    ///获取接口数据
    if (json["Data"] != null) {
      return BaseEntity(
        code: json["Code"],
        message: json["Message"],
        // data值需要经过工厂转换为我们传进来的类型
        data: EntityFactory.generateOBJ<T>(json["Data"]),
      );
    } else {
      return BaseEntity(
          code: json["Code"], message: json["Message"], data: null);
    }
  }
}
