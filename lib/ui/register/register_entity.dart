import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/register_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class RegisterEntity {

	bool? admin;
	List<dynamic>? chapterTops;
	int? coinCount;
	List<dynamic>? collectIds;
	String? email;
	String? icon;
	int? id;
	String? nickname;
	String? password;
	String? publicName;
	String? token;
	int? type;
	String? username;
  
  RegisterEntity();

  /*factory RegisterEntity.*/static fromJson(Map<String, dynamic> json) => $RegisterEntityFromJson(json);

  Map<String, dynamic> toJson() => $RegisterEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}