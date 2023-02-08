import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/wx_article_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class WxArticleEntity {
  List<dynamic>? articleList;
  String? author;
  List<dynamic>? children;
  double? courseId;
  String? cover;
  String? desc;
  int? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  double? order;
  double? parentChapterId;
  double? type;
  bool? userControlSetTop;
  double? visible;

  WxArticleEntity();

  /* factory  WxArticleEntity.*/
  static fromJson(Map<String, dynamic> json) => $WxArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $WxArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
