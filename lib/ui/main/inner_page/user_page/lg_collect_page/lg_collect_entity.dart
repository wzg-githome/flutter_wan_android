import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/lg_collect_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LgCollectEntity {

	int? curPage;
	List<LgCollectEntityDatas>? datas;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
  
  LgCollectEntity();

 /* factory LgCollectEntity.*/static fromJson(Map<String, dynamic> json) => $LgCollectEntityFromJson(json);

  Map<String, dynamic> toJson() => $LgCollectEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LgCollectEntityDatas {

	String? author;
	int? chapterId;
	String? chapterName;
	int? courseId;
	String? desc;
	String? envelopePic;
	int? id;
	String? link;
	String? niceDate;
	String? origin;
	int? originId;
	int? publishTime;
	String? title;
	int? userId;
	int? visible;
	int? zan;
  
  LgCollectEntityDatas();

  /*factory LgCollectEntityDatas.*/static fromJson(Map<String, dynamic> json) => $LgCollectEntityDatasFromJson(json);

  Map<String, dynamic> toJson() => $LgCollectEntityDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}