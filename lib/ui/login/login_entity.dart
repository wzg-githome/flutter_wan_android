import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/login_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LoginEntity {

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
  
  LoginEntity();

 /* factory LoginEntity.*/ static fromJson(Map<String, dynamic> json) => $LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}