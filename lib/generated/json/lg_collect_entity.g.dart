import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/lg_collect_page/lg_collect_entity.dart';

LgCollectEntity $LgCollectEntityFromJson(Map<String, dynamic> json) {
	final LgCollectEntity lgCollectEntity = LgCollectEntity();
	final int? curPage = jsonConvert.convert<int>(json['curPage']);
	if (curPage != null) {
		lgCollectEntity.curPage = curPage;
	}
	final List<LgCollectEntityDatas>? datas = jsonConvert.convertListNotNull<LgCollectEntityDatas>(json['datas']);
	if (datas != null) {
		lgCollectEntity.datas = datas;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		lgCollectEntity.offset = offset;
	}
	final bool? over = jsonConvert.convert<bool>(json['over']);
	if (over != null) {
		lgCollectEntity.over = over;
	}
	final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
	if (pageCount != null) {
		lgCollectEntity.pageCount = pageCount;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		lgCollectEntity.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		lgCollectEntity.total = total;
	}
	return lgCollectEntity;
}

Map<String, dynamic> $LgCollectEntityToJson(LgCollectEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['curPage'] = entity.curPage;
	data['datas'] =  entity.datas?.map((v) => v.toJson()).toList();
	data['offset'] = entity.offset;
	data['over'] = entity.over;
	data['pageCount'] = entity.pageCount;
	data['size'] = entity.size;
	data['total'] = entity.total;
	return data;
}

LgCollectEntityDatas $LgCollectEntityDatasFromJson(Map<String, dynamic> json) {
	final LgCollectEntityDatas lgCollectEntityDatas = LgCollectEntityDatas();
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		lgCollectEntityDatas.author = author;
	}
	final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
	if (chapterId != null) {
		lgCollectEntityDatas.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		lgCollectEntityDatas.chapterName = chapterName;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		lgCollectEntityDatas.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		lgCollectEntityDatas.desc = desc;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		lgCollectEntityDatas.envelopePic = envelopePic;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		lgCollectEntityDatas.id = id;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		lgCollectEntityDatas.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		lgCollectEntityDatas.niceDate = niceDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		lgCollectEntityDatas.origin = origin;
	}
	final int? originId = jsonConvert.convert<int>(json['originId']);
	if (originId != null) {
		lgCollectEntityDatas.originId = originId;
	}
	final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
	if (publishTime != null) {
		lgCollectEntityDatas.publishTime = publishTime;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		lgCollectEntityDatas.title = title;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		lgCollectEntityDatas.userId = userId;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		lgCollectEntityDatas.visible = visible;
	}
	final int? zan = jsonConvert.convert<int>(json['zan']);
	if (zan != null) {
		lgCollectEntityDatas.zan = zan;
	}
	return lgCollectEntityDatas;
}

Map<String, dynamic> $LgCollectEntityDatasToJson(LgCollectEntityDatas entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author;
	data['chapterId'] = entity.chapterId;
	data['chapterName'] = entity.chapterName;
	data['courseId'] = entity.courseId;
	data['desc'] = entity.desc;
	data['envelopePic'] = entity.envelopePic;
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['niceDate'] = entity.niceDate;
	data['origin'] = entity.origin;
	data['originId'] = entity.originId;
	data['publishTime'] = entity.publishTime;
	data['title'] = entity.title;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}