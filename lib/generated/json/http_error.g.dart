import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';
import 'package:flutter_wan_android/network/entity/http_error.dart';

HttpError $HttpErrorFromJson(Map<String, dynamic> json) {
	final HttpError httpError = HttpError();
	final dynamic? e = jsonConvert.convert<dynamic>(json['e']);
	if (e != null) {
		httpError.e = e;
	}
	final String? errMsg = jsonConvert.convert<String>(json['errMsg']);
	if (errMsg != null) {
		httpError.errMsg = errMsg;
	}
	final int? errCode = jsonConvert.convert<int>(json['errCode']);
	if (errCode != null) {
		httpError.errCode = errCode;
	}
	final String? data = jsonConvert.convert<String>(json['data']);
	if (data != null) {
		httpError.data = data;
	}
	return httpError;
}

Map<String, dynamic> $HttpErrorToJson(HttpError entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['e'] = entity.e;
	data['errMsg'] = entity.errMsg;
	data['errCode'] = entity.errCode;
	data['data'] = entity.data;
	return data;
}