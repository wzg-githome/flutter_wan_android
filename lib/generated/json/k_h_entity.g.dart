import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/entity/k_h_entity.dart';

KHEntity $KHEntityFromJson(Map<String, dynamic> json) {
	final KHEntity kHEntity = KHEntity();
	final List<dynamic>? articleList = jsonConvert.convertListNotNull<dynamic>(json['articleList']);
	if (articleList != null) {
		kHEntity.articleList = articleList;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		kHEntity.author = author;
	}
	final List<KHEntityChildren>? children = jsonConvert.convertListNotNull<KHEntityChildren>(json['children']);
	if (children != null) {
		kHEntity.children = children;
	}
	final double? courseId = jsonConvert.convert<double>(json['courseId']);
	if (courseId != null) {
		kHEntity.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		kHEntity.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		kHEntity.desc = desc;
	}
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		kHEntity.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		kHEntity.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		kHEntity.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		kHEntity.name = name;
	}
	final double? order = jsonConvert.convert<double>(json['order']);
	if (order != null) {
		kHEntity.order = order;
	}
	final double? parentChapterId = jsonConvert.convert<double>(json['parentChapterId']);
	if (parentChapterId != null) {
		kHEntity.parentChapterId = parentChapterId;
	}
	final double? type = jsonConvert.convert<double>(json['type']);
	if (type != null) {
		kHEntity.type = type;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		kHEntity.userControlSetTop = userControlSetTop;
	}
	final double? visible = jsonConvert.convert<double>(json['visible']);
	if (visible != null) {
		kHEntity.visible = visible;
	}
	final bool? curCheck = jsonConvert.convert<bool>(json['curCheck']);
	if (curCheck != null) {
		kHEntity.curCheck = curCheck;
	}
	return kHEntity;
}

Map<String, dynamic> $KHEntityToJson(KHEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['articleList'] =  entity.articleList;
	data['author'] = entity.author;
	data['children'] =  entity.children?.map((v) => v.toJson()).toList();
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
	data['curCheck'] = entity.curCheck;
	return data;
}

KHEntityChildren $KHEntityChildrenFromJson(Map<String, dynamic> json) {
	final KHEntityChildren kHEntityChildren = KHEntityChildren();
	final List<dynamic>? articleList = jsonConvert.convertListNotNull<dynamic>(json['articleList']);
	if (articleList != null) {
		kHEntityChildren.articleList = articleList;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		kHEntityChildren.author = author;
	}
	final List<dynamic>? children = jsonConvert.convertListNotNull<dynamic>(json['children']);
	if (children != null) {
		kHEntityChildren.children = children;
	}
	final double? courseId = jsonConvert.convert<double>(json['courseId']);
	if (courseId != null) {
		kHEntityChildren.courseId = courseId;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		kHEntityChildren.cover = cover;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		kHEntityChildren.desc = desc;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		kHEntityChildren.id = id;
	}
	final String? lisense = jsonConvert.convert<String>(json['lisense']);
	if (lisense != null) {
		kHEntityChildren.lisense = lisense;
	}
	final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
	if (lisenseLink != null) {
		kHEntityChildren.lisenseLink = lisenseLink;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		kHEntityChildren.name = name;
	}
	final double? order = jsonConvert.convert<double>(json['order']);
	if (order != null) {
		kHEntityChildren.order = order;
	}
	final double? parentChapterId = jsonConvert.convert<double>(json['parentChapterId']);
	if (parentChapterId != null) {
		kHEntityChildren.parentChapterId = parentChapterId;
	}
	final double? type = jsonConvert.convert<double>(json['type']);
	if (type != null) {
		kHEntityChildren.type = type;
	}
	final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
	if (userControlSetTop != null) {
		kHEntityChildren.userControlSetTop = userControlSetTop;
	}
	final double? visible = jsonConvert.convert<double>(json['visible']);
	if (visible != null) {
		kHEntityChildren.visible = visible;
	}
	return kHEntityChildren;
}

Map<String, dynamic> $KHEntityChildrenToJson(KHEntityChildren entity) {
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