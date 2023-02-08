import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/wx_article_detail_entity.dart';

WxArticleDetailEntity $WxArticleDetailEntityFromJson(Map<String, dynamic> json) {
	final WxArticleDetailEntity wxArticleDetailEntity = WxArticleDetailEntity();
	final int? curPage = jsonConvert.convert<int>(json['curPage']);
	if (curPage != null) {
		wxArticleDetailEntity.curPage = curPage;
	}
	final List<WxArticleDetailEntityDatas>? datas = jsonConvert.convertListNotNull<WxArticleDetailEntityDatas>(json['datas']);
	if (datas != null) {
		wxArticleDetailEntity.datas = datas;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		wxArticleDetailEntity.offset = offset;
	}
	final bool? over = jsonConvert.convert<bool>(json['over']);
	if (over != null) {
		wxArticleDetailEntity.over = over;
	}
	final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
	if (pageCount != null) {
		wxArticleDetailEntity.pageCount = pageCount;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		wxArticleDetailEntity.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		wxArticleDetailEntity.total = total;
	}
	return wxArticleDetailEntity;
}

Map<String, dynamic> $WxArticleDetailEntityToJson(WxArticleDetailEntity entity) {
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

WxArticleDetailEntityDatas $WxArticleDetailEntityDatasFromJson(Map<String, dynamic> json) {
	final WxArticleDetailEntityDatas wxArticleDetailEntityDatas = WxArticleDetailEntityDatas();
	final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
	if (adminAdd != null) {
		wxArticleDetailEntityDatas.adminAdd = adminAdd;
	}
	final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
	if (apkLink != null) {
		wxArticleDetailEntityDatas.apkLink = apkLink;
	}
	final int? audit = jsonConvert.convert<int>(json['audit']);
	if (audit != null) {
		wxArticleDetailEntityDatas.audit = audit;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		wxArticleDetailEntityDatas.author = author;
	}
	final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
	if (canEdit != null) {
		wxArticleDetailEntityDatas.canEdit = canEdit;
	}
	final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
	if (chapterId != null) {
		wxArticleDetailEntityDatas.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		wxArticleDetailEntityDatas.chapterName = chapterName;
	}
	final bool? collect = jsonConvert.convert<bool>(json['collect']);
	if (collect != null) {
		wxArticleDetailEntityDatas.collect = collect;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		wxArticleDetailEntityDatas.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		wxArticleDetailEntityDatas.desc = desc;
	}
	final String? descMd = jsonConvert.convert<String>(json['descMd']);
	if (descMd != null) {
		wxArticleDetailEntityDatas.descMd = descMd;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		wxArticleDetailEntityDatas.envelopePic = envelopePic;
	}
	final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
	if (fresh != null) {
		wxArticleDetailEntityDatas.fresh = fresh;
	}
	final String? host = jsonConvert.convert<String>(json['host']);
	if (host != null) {
		wxArticleDetailEntityDatas.host = host;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		wxArticleDetailEntityDatas.id = id;
	}
	final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
	if (isAdminAdd != null) {
		wxArticleDetailEntityDatas.isAdminAdd = isAdminAdd;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		wxArticleDetailEntityDatas.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		wxArticleDetailEntityDatas.niceDate = niceDate;
	}
	final String? niceShareDate = jsonConvert.convert<String>(json['niceShareDate']);
	if (niceShareDate != null) {
		wxArticleDetailEntityDatas.niceShareDate = niceShareDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		wxArticleDetailEntityDatas.origin = origin;
	}
	final String? prefix = jsonConvert.convert<String>(json['prefix']);
	if (prefix != null) {
		wxArticleDetailEntityDatas.prefix = prefix;
	}
	final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
	if (projectLink != null) {
		wxArticleDetailEntityDatas.projectLink = projectLink;
	}
	final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
	if (publishTime != null) {
		wxArticleDetailEntityDatas.publishTime = publishTime;
	}
	final int? realSuperChapterId = jsonConvert.convert<int>(json['realSuperChapterId']);
	if (realSuperChapterId != null) {
		wxArticleDetailEntityDatas.realSuperChapterId = realSuperChapterId;
	}
	final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
	if (selfVisible != null) {
		wxArticleDetailEntityDatas.selfVisible = selfVisible;
	}
	final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
	if (shareDate != null) {
		wxArticleDetailEntityDatas.shareDate = shareDate;
	}
	final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
	if (shareUser != null) {
		wxArticleDetailEntityDatas.shareUser = shareUser;
	}
	final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
	if (superChapterId != null) {
		wxArticleDetailEntityDatas.superChapterId = superChapterId;
	}
	final String? superChapterName = jsonConvert.convert<String>(json['superChapterName']);
	if (superChapterName != null) {
		wxArticleDetailEntityDatas.superChapterName = superChapterName;
	}
	final List<WxArticleDetailEntityDatasTags>? tags = jsonConvert.convertListNotNull<WxArticleDetailEntityDatasTags>(json['tags']);
	if (tags != null) {
		wxArticleDetailEntityDatas.tags = tags;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		wxArticleDetailEntityDatas.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		wxArticleDetailEntityDatas.type = type;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		wxArticleDetailEntityDatas.userId = userId;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		wxArticleDetailEntityDatas.visible = visible;
	}
	final int? zan = jsonConvert.convert<int>(json['zan']);
	if (zan != null) {
		wxArticleDetailEntityDatas.zan = zan;
	}
	return wxArticleDetailEntityDatas;
}

Map<String, dynamic> $WxArticleDetailEntityDatasToJson(WxArticleDetailEntityDatas entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['adminAdd'] = entity.adminAdd;
	data['apkLink'] = entity.apkLink;
	data['audit'] = entity.audit;
	data['author'] = entity.author;
	data['canEdit'] = entity.canEdit;
	data['chapterId'] = entity.chapterId;
	data['chapterName'] = entity.chapterName;
	data['collect'] = entity.collect;
	data['courseId'] = entity.courseId;
	data['desc'] = entity.desc;
	data['descMd'] = entity.descMd;
	data['envelopePic'] = entity.envelopePic;
	data['fresh'] = entity.fresh;
	data['host'] = entity.host;
	data['id'] = entity.id;
	data['isAdminAdd'] = entity.isAdminAdd;
	data['link'] = entity.link;
	data['niceDate'] = entity.niceDate;
	data['niceShareDate'] = entity.niceShareDate;
	data['origin'] = entity.origin;
	data['prefix'] = entity.prefix;
	data['projectLink'] = entity.projectLink;
	data['publishTime'] = entity.publishTime;
	data['realSuperChapterId'] = entity.realSuperChapterId;
	data['selfVisible'] = entity.selfVisible;
	data['shareDate'] = entity.shareDate;
	data['shareUser'] = entity.shareUser;
	data['superChapterId'] = entity.superChapterId;
	data['superChapterName'] = entity.superChapterName;
	data['tags'] =  entity.tags?.map((v) => v.toJson()).toList();
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}

WxArticleDetailEntityDatasTags $WxArticleDetailEntityDatasTagsFromJson(Map<String, dynamic> json) {
	final WxArticleDetailEntityDatasTags wxArticleDetailEntityDatasTags = WxArticleDetailEntityDatasTags();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		wxArticleDetailEntityDatasTags.name = name;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		wxArticleDetailEntityDatasTags.url = url;
	}
	return wxArticleDetailEntityDatasTags;
}

Map<String, dynamic> $WxArticleDetailEntityDatasTagsToJson(WxArticleDetailEntityDatasTags entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['url'] = entity.url;
	return data;
}