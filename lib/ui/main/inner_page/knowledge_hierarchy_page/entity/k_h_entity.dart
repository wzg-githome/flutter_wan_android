import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/k_h_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class KHEntity {
  List<dynamic>? articleList;
  String? author;
  List<KHEntityChildren>? children;
  double? courseId;
  String? cover;
  String? desc;
  double? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  double? order;
  double? parentChapterId;
  double? type;
  bool? userControlSetTop;
  double? visible;

  ///显示与隐藏
  bool curCheck = false;

  KHEntity();

  /*factory KHEntity.*/
  static fromJson(Map<String, dynamic> json) => $KHEntityFromJson(json);

  Map<String, dynamic> toJson() => $KHEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class KHEntityChildren {
  // List<dynamic>? articleList;
  String? author;
  // List<dynamic>? children;
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

  KHEntityChildren();

  /*factory KHEntityChildren.*/
  static fromJson(Map<String, dynamic> json) => $KHEntityChildrenFromJson(json);

  Map<String, dynamic> toJson() => $KHEntityChildrenToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
