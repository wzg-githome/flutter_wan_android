import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/wx_article_detail_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class WxArticleDetailEntity {
  int? curPage;
  List<WxArticleDetailEntityDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  WxArticleDetailEntity();

  /* factory WxArticleDetailEntity.*/
  static fromJson(Map<String, dynamic> json) =>
      $WxArticleDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $WxArticleDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WxArticleDetailEntityDatas {
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
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<WxArticleDetailEntityDatasTags>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  WxArticleDetailEntityDatas();

  /* factory WxArticleDetailEntityDatas.*/
  static fromJson(Map<String, dynamic> json) =>
      $WxArticleDetailEntityDatasFromJson(json);

  Map<String, dynamic> toJson() => $WxArticleDetailEntityDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WxArticleDetailEntityDatasTags {
  String? name;
  String? url;

  WxArticleDetailEntityDatasTags();

  /* factory WxArticleDetailEntityDatasTags.*/
  static fromJson(Map<String, dynamic> json) =>
      $WxArticleDetailEntityDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => $WxArticleDetailEntityDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
