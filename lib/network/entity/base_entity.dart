import 'entity_factory.dart';

///拿到服务器数据后，我们希望转换成自己方便使用的model结构
class BaseEntity<T> {
  int? errorCode;
  String? errorMsg;
  T? data;

  BaseEntity({this.errorCode, this.errorMsg, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
      // data值需要经过工厂转换为我们传进来的类型
      data: json["data"] != null
          ? EntityFactory.generateOBJ<T>(json["data"])
          : null,
    );
  }
}
