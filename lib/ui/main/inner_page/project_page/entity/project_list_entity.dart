import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/project_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProjectListEntity {

	int? curPage;
	List<ProjectListEntityDatas>? datas;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
  
  ProjectListEntity();

 /* factory ProjectListEntity.*/static fromJson(Map<String, dynamic> json) => $ProjectListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProjectListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectListEntityDatas {

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
	List<ProjectListEntityDatasTags>? tags;
	String? title;
	int? type;
	int? userId;
	int? visible;
	int? zan;
  
  ProjectListEntityDatas();

  /*factory ProjectListEntityDatas.*/static fromJson(Map<String, dynamic> json) => $ProjectListEntityDatasFromJson(json);

  Map<String, dynamic> toJson() => $ProjectListEntityDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectListEntityDatasTags {

	String? name;
	String? url;
  
  ProjectListEntityDatasTags();

 /* factory ProjectListEntityDatasTags.*/static fromJson(Map<String, dynamic> json) => $ProjectListEntityDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => $ProjectListEntityDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}