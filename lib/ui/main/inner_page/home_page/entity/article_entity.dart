import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/article_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ArticleEntity {

	int? curPage;
	List<ArticleEntityDatas>? datas;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
  
  ArticleEntity();

  /*factory ArticleEntity.*/static fromJson(Map<String, dynamic> json) => $ArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleEntityDatas {

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
	// List<dynamic>? tags;
	String? title;
	int? type;
	int? userId;
	int? visible;
	int? zan;
  
  ArticleEntityDatas();

  /*factory ArticleEntityDatas.*/static fromJson(Map<String, dynamic> json) => $ArticleEntityDatasFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}