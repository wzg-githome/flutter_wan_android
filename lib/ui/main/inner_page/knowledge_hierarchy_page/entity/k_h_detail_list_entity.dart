import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/k_h_detail_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class KHDetailListEntity {
  int? curPage;
  List<KHDetailListEntityDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  KHDetailListEntity();

  /* factory KHDetailListEntity.*/
  static fromJson(Map<String, dynamic> json) =>
      $KHDetailListEntityFromJson(json);

  Map<String, dynamic> toJson() => $KHDetailListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class KHDetailListEntityDatas {
  bool? adminAdd;
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  dynamic shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<dynamic>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  KHDetailListEntityDatas();

  /*factory KHDetailListEntityDatas.*/
  static fromJson(Map<String, dynamic> json) =>
      $KHDetailListEntityDatasFromJson(json);

  Map<String, dynamic> toJson() => $KHDetailListEntityDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
