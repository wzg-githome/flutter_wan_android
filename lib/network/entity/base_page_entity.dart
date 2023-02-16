import 'entity_factory.dart';

///请求结果返回一个List<T>
class BasePageEntity<T> {
  int? curPage;
  List<T?>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  BasePageEntity(
      {this.curPage,
      this.datas,
      this.offset,
      this.over,
      this.pageCount,
      this.size,
      this.total});

  factory BasePageEntity.fromJson(json) {
    return BasePageEntity(
      curPage: json["curPage"],
      offset: json["offset"],
      over: json["over"],
      pageCount: json["pageCount"],
      size: json["size"],
      total: json["total"],
      datas: json["datas"] != null
          ? EntityFactory.generateOBJList<T>(json["datas"])
          : null,
    );
  }

  static fromJsonConvert(json){
    return BasePageEntity.fromJson(json);
  }
}
