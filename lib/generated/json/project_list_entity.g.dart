import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/entity/project_list_entity.dart';

ProjectListEntity $ProjectListEntityFromJson(Map<String, dynamic> json) {
	final ProjectListEntity projectListEntity = ProjectListEntity();
	final int? curPage = jsonConvert.convert<int>(json['curPage']);
	if (curPage != null) {
		projectListEntity.curPage = curPage;
	}
	final List<ProjectListEntityDatas>? datas = jsonConvert.convertListNotNull<ProjectListEntityDatas>(json['datas']);
	if (datas != null) {
		projectListEntity.datas = datas;
	}
	final int? offset = jsonConvert.convert<int>(json['offset']);
	if (offset != null) {
		projectListEntity.offset = offset;
	}
	final bool? over = jsonConvert.convert<bool>(json['over']);
	if (over != null) {
		projectListEntity.over = over;
	}
	final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
	if (pageCount != null) {
		projectListEntity.pageCount = pageCount;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		projectListEntity.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		projectListEntity.total = total;
	}
	return projectListEntity;
}

Map<String, dynamic> $ProjectListEntityToJson(ProjectListEntity entity) {
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

ProjectListEntityDatas $ProjectListEntityDatasFromJson(Map<String, dynamic> json) {
	final ProjectListEntityDatas projectListEntityDatas = ProjectListEntityDatas();
	final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
	if (adminAdd != null) {
		projectListEntityDatas.adminAdd = adminAdd;
	}
	final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
	if (apkLink != null) {
		projectListEntityDatas.apkLink = apkLink;
	}
	final int? audit = jsonConvert.convert<int>(json['audit']);
	if (audit != null) {
		projectListEntityDatas.audit = audit;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		projectListEntityDatas.author = author;
	}
	final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
	if (canEdit != null) {
		projectListEntityDatas.canEdit = canEdit;
	}
	final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
	if (chapterId != null) {
		projectListEntityDatas.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		projectListEntityDatas.chapterName = chapterName;
	}
	final bool? collect = jsonConvert.convert<bool>(json['collect']);
	if (collect != null) {
		projectListEntityDatas.collect = collect;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		projectListEntityDatas.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		projectListEntityDatas.desc = desc;
	}
	final String? descMd = jsonConvert.convert<String>(json['descMd']);
	if (descMd != null) {
		projectListEntityDatas.descMd = descMd;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		projectListEntityDatas.envelopePic = envelopePic;
	}
	final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
	if (fresh != null) {
		projectListEntityDatas.fresh = fresh;
	}
	final String? host = jsonConvert.convert<String>(json['host']);
	if (host != null) {
		projectListEntityDatas.host = host;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		projectListEntityDatas.id = id;
	}
	final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
	if (isAdminAdd != null) {
		projectListEntityDatas.isAdminAdd = isAdminAdd;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		projectListEntityDatas.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		projectListEntityDatas.niceDate = niceDate;
	}
	final String? niceShareDate = jsonConvert.convert<String>(json['niceShareDate']);
	if (niceShareDate != null) {
		projectListEntityDatas.niceShareDate = niceShareDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		projectListEntityDatas.origin = origin;
	}
	final String? prefix = jsonConvert.convert<String>(json['prefix']);
	if (prefix != null) {
		projectListEntityDatas.prefix = prefix;
	}
	final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
	if (projectLink != null) {
		projectListEntityDatas.projectLink = projectLink;
	}
	final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
	if (publishTime != null) {
		projectListEntityDatas.publishTime = publishTime;
	}
	final int? realSuperChapterId = jsonConvert.convert<int>(json['realSuperChapterId']);
	if (realSuperChapterId != null) {
		projectListEntityDatas.realSuperChapterId = realSuperChapterId;
	}
	final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
	if (selfVisible != null) {
		projectListEntityDatas.selfVisible = selfVisible;
	}
	final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
	if (shareDate != null) {
		projectListEntityDatas.shareDate = shareDate;
	}
	final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
	if (shareUser != null) {
		projectListEntityDatas.shareUser = shareUser;
	}
	final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
	if (superChapterId != null) {
		projectListEntityDatas.superChapterId = superChapterId;
	}
	final String? superChapterName = jsonConvert.convert<String>(json['superChapterName']);
	if (superChapterName != null) {
		projectListEntityDatas.superChapterName = superChapterName;
	}
	final List<ProjectListEntityDatasTags>? tags = jsonConvert.convertListNotNull<ProjectListEntityDatasTags>(json['tags']);
	if (tags != null) {
		projectListEntityDatas.tags = tags;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		projectListEntityDatas.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		projectListEntityDatas.type = type;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		projectListEntityDatas.userId = userId;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		projectListEntityDatas.visible = visible;
	}
	final int? zan = jsonConvert.convert<int>(json['zan']);
	if (zan != null) {
		projectListEntityDatas.zan = zan;
	}
	return projectListEntityDatas;
}

Map<String, dynamic> $ProjectListEntityDatasToJson(ProjectListEntityDatas entity) {
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

ProjectListEntityDatasTags $ProjectListEntityDatasTagsFromJson(Map<String, dynamic> json) {
	final ProjectListEntityDatasTags projectListEntityDatasTags = ProjectListEntityDatasTags();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		projectListEntityDatasTags.name = name;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		projectListEntityDatasTags.url = url;
	}
	return projectListEntityDatasTags;
}

Map<String, dynamic> $ProjectListEntityDatasTagsToJson(ProjectListEntityDatasTags entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['url'] = entity.url;
	return data;
}