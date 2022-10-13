import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/project_tree_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProjectTreeEntity {
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

  ProjectTreeEntity();

  /* factory ProjectTreeEntity .*/
  static fromJson(Map<String, dynamic> json) => $ProjectTreeEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProjectTreeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
