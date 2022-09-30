import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/ui/register/register_entity.dart';

RegisterEntity $RegisterEntityFromJson(Map<String, dynamic> json) {
	final RegisterEntity registerEntity = RegisterEntity();
	final bool? admin = jsonConvert.convert<bool>(json['admin']);
	if (admin != null) {
		registerEntity.admin = admin;
	}
	final List<dynamic>? chapterTops = jsonConvert.convertListNotNull<dynamic>(json['chapterTops']);
	if (chapterTops != null) {
		registerEntity.chapterTops = chapterTops;
	}
	final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
	if (coinCount != null) {
		registerEntity.coinCount = coinCount;
	}
	final List<dynamic>? collectIds = jsonConvert.convertListNotNull<dynamic>(json['collectIds']);
	if (collectIds != null) {
		registerEntity.collectIds = collectIds;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		registerEntity.email = email;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		registerEntity.icon = icon;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		registerEntity.id = id;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		registerEntity.nickname = nickname;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		registerEntity.password = password;
	}
	final String? publicName = jsonConvert.convert<String>(json['publicName']);
	if (publicName != null) {
		registerEntity.publicName = publicName;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		registerEntity.token = token;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		registerEntity.type = type;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		registerEntity.username = username;
	}
	return registerEntity;
}

Map<String, dynamic> $RegisterEntityToJson(RegisterEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['admin'] = entity.admin;
	data['chapterTops'] =  entity.chapterTops;
	data['coinCount'] = entity.coinCount;
	data['collectIds'] =  entity.collectIds;
	data['email'] = entity.email;
	data['icon'] = entity.icon;
	data['id'] = entity.id;
	data['nickname'] = entity.nickname;
	data['password'] = entity.password;
	data['publicName'] = entity.publicName;
	data['token'] = entity.token;
	data['type'] = entity.type;
	data['username'] = entity.username;
	return data;
}