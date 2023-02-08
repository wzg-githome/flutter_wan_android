import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/wx_article_entity.dart';

WxArticleEntity $WxArticleEntityFromJson(Map<String, dynamic> json) {
	final WxArticleEntity wxArticleEntity = WxArticleEntity();
	final List<dynamic>? articleList = jsonConvert.convertListNotNull<dynamic>(json['articleList']);
	if (articleList != null) {
		wxArticleEntity.articleList = articleList;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		wxArticleEntity.author = author;
	}
	final List<dynamic>? children = jsonConvert.convertListNotNull<dynamic>(json['children']);
	if (children != null) {
		wxArticleEntity.children = children;
	}
	final double? courseId = jsonConvert.convert<double>(json['courseId']);
	if (courseId != null) {
		wxArticleEntity.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		wxArticleEntity.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		wxArticleEntity.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		wxArticleEntity.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		wxArticleEntity.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		wxArticleEntity.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		wxArticleEntity.name = name;
	}
	final double? order = jsonConvert.convert<double>(json['order']);
	if (order != null) {
		wxArticleEntity.order = order;
	}
	final double? parentChapterId = jsonConvert.convert<double>(json['parentChapterId']);
	if (parentChapterId != null) {
		wxArticleEntity.parentChapterId = parentChapterId;
	}
	final double? type = jsonConvert.convert<double>(json['type']);
	if (type != null) {
		wxArticleEntity.type = type;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		wxArticleEntity.userControlSetTop = userControlSetTop;
	}
	final double? visible = jsonConvert.convert<double>(json['visible']);
	if (visible != null) {
		wxArticleEntity.visible = visible;
	}
	return wxArticleEntity;
}

Map<String, dynamic> $WxArticleEntityToJson(WxArticleEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['articleList'] =  entity.articleList;
	data['author'] = entity.author;
	data['children'] =  entity.children;
	data['courseId'] = entity.courseId;
	data['cover'] = entity.cover;
	data['desc'] = entity.desc;
	data['id'] = entity.id;
	data['lisense'] = entity.lisense;
	data['lisenseLink'] = entity.lisenseLink;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['type'] = entity.type;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	return data;
}