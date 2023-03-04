import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/dh_page/nav_json_entity.dart';

NavJsonEntity $NavJsonEntityFromJson(Map<String, dynamic> json) {
	final NavJsonEntity navJsonEntity = NavJsonEntity();
	final List<NavJsonEntityArticles>? articles = jsonConvert.convertListNotNull<NavJsonEntityArticles>(json['articles']);
	if (articles != null) {
		navJsonEntity.articles = articles;
	}
	final double? cid = jsonConvert.convert<double>(json['cid']);
	if (cid != null) {
		navJsonEntity.cid = cid;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		navJsonEntity.name = name;
	}
	return navJsonEntity;
}

Map<String, dynamic> $NavJsonEntityToJson(NavJsonEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['articles'] =  entity.articles?.map((v) => v.toJson()).toList();
	data['cid'] = entity.cid;
	data['name'] = entity.name;
	return data;
}

NavJsonEntityArticles $NavJsonEntityArticlesFromJson(Map<String, dynamic> json) {
	final NavJsonEntityArticles navJsonEntityArticles = NavJsonEntityArticles();
	final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
	if (adminAdd != null) {
		navJsonEntityArticles.adminAdd = adminAdd;
	}
	final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
	if (apkLink != null) {
		navJsonEntityArticles.apkLink = apkLink;
	}
	final double? audit = jsonConvert.convert<double>(json['audit']);
	if (audit != null) {
		navJsonEntityArticles.audit = audit;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		navJsonEntityArticles.author = author;
	}
	final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
	if (canEdit != null) {
		navJsonEntityArticles.canEdit = canEdit;
	}
	final double? chapterId = jsonConvert.convert<double>(json['chapterId']);
	if (chapterId != null) {
		navJsonEntityArticles.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		navJsonEntityArticles.chapterName = chapterName;
	}
	final bool? collect = jsonConvert.convert<bool>(json['collect']);
	if (collect != null) {
		navJsonEntityArticles.collect = collect;
	}
	final double? courseId = jsonConvert.convert<double>(json['courseId']);
	if (courseId != null) {
		navJsonEntityArticles.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		navJsonEntityArticles.desc = desc;
	}
	final String? descMd = jsonConvert.convert<String>(json['descMd']);
	if (descMd != null) {
		navJsonEntityArticles.descMd = descMd;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		navJsonEntityArticles.envelopePic = envelopePic;
	}
	final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
	if (fresh != null) {
		navJsonEntityArticles.fresh = fresh;
	}
	final String? host = jsonConvert.convert<String>(json['host']);
	if (host != null) {
		navJsonEntityArticles.host = host;
	}
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		navJsonEntityArticles.id = id;
	}
	final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
	if (isAdminAdd != null) {
		navJsonEntityArticles.isAdminAdd = isAdminAdd;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		navJsonEntityArticles.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		navJsonEntityArticles.niceDate = niceDate;
	}
	final String? niceShareDate = jsonConvert.convert<String>(json['niceShareDate']);
	if (niceShareDate != null) {
		navJsonEntityArticles.niceShareDate = niceShareDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		navJsonEntityArticles.origin = origin;
	}
	final String? prefix = jsonConvert.convert<String>(json['prefix']);
	if (prefix != null) {
		navJsonEntityArticles.prefix = prefix;
	}
	final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
	if (projectLink != null) {
		navJsonEntityArticles.projectLink = projectLink;
	}
	final double? publishTime = jsonConvert.convert<double>(json['publishTime']);
	if (publishTime != null) {
		navJsonEntityArticles.publishTime = publishTime;
	}
	final double? realSuperChapterId = jsonConvert.convert<double>(json['realSuperChapterId']);
	if (realSuperChapterId != null) {
		navJsonEntityArticles.realSuperChapterId = realSuperChapterId;
	}
	final bool? route = jsonConvert.convert<bool>(json['route']);
	if (route != null) {
		navJsonEntityArticles.route = route;
	}
	final double? selfVisible = jsonConvert.convert<double>(json['selfVisible']);
	if (selfVisible != null) {
		navJsonEntityArticles.selfVisible = selfVisible;
	}
	final double? shareDate = jsonConvert.convert<double>(json['shareDate']);
	if (shareDate != null) {
		navJsonEntityArticles.shareDate = shareDate;
	}
	final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
	if (shareUser != null) {
		navJsonEntityArticles.shareUser = shareUser;
	}
	final double? superChapterId = jsonConvert.convert<double>(json['superChapterId']);
	if (superChapterId != null) {
		navJsonEntityArticles.superChapterId = superChapterId;
	}
	final String? superChapterName = jsonConvert.convert<String>(json['superChapterName']);
	if (superChapterName != null) {
		navJsonEntityArticles.superChapterName = superChapterName;
	}
	// final List<dynamic>? tags = jsonConvert.convertListNotNull<dynamic>(json['tags']);
	// if (tags != null) {
	// 	navJsonEntityArticles.tags = tags;
	// }
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		navJsonEntityArticles.title = title;
	}
	final double? type = jsonConvert.convert<double>(json['type']);
	if (type != null) {
		navJsonEntityArticles.type = type;
	}
	final double? userId = jsonConvert.convert<double>(json['userId']);
	if (userId != null) {
		navJsonEntityArticles.userId = userId;
	}
	final double? visible = jsonConvert.convert<double>(json['visible']);
	if (visible != null) {
		navJsonEntityArticles.visible = visible;
	}
	final double? zan = jsonConvert.convert<double>(json['zan']);
	if (zan != null) {
		navJsonEntityArticles.zan = zan;
	}
	return navJsonEntityArticles;
}

Map<String, dynamic> $NavJsonEntityArticlesToJson(NavJsonEntityArticles entity) {
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
	data['route'] = entity.route;
	data['selfVisible'] = entity.selfVisible;
	data['shareDate'] = entity.shareDate;
	data['shareUser'] = entity.shareUser;
	data['superChapterId'] = entity.superChapterId;
	data['superChapterName'] = entity.superChapterName;
	// data['tags'] =  entity.tags;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}