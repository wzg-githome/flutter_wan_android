import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/nav_json_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NavJsonEntity {
  List<NavJsonEntityArticles>? articles;
  double? cid;
  String? name;

  NavJsonEntity();

  static /*factory NavJsonEntity.*/ fromJson(Map<String, dynamic> json) =>
      $NavJsonEntityFromJson(json);

  Map<String, dynamic> toJson() => $NavJsonEntityToJson(this);


  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NavJsonEntityArticles {
  bool? adminAdd;
  String? apkLink;
  double? audit;
  String? author;
  bool? canEdit;
  double? chapterId;
  String? chapterName;
  bool? collect;
  double? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  double? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  double? publishTime;
  double? realSuperChapterId;
  bool? route;
  double? selfVisible;
  double? shareDate;
  String? shareUser;
  double? superChapterId;
  String? superChapterName;
  // List<dynamic>? tags;
  String? title;
  double? type;
  double? userId;
  double? visible;
  double? zan;

  NavJsonEntityArticles();

  static /* factory NavJsonEntityArticles.*/ fromJson(
          Map<String, dynamic> json) =>
      $NavJsonEntityArticlesFromJson(json);

  Map<String, dynamic> toJson() => $NavJsonEntityArticlesToJson(this);


  @override
  String toString() {
    return jsonEncode(this);
  }
}
