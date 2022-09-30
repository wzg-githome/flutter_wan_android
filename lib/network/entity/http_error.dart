import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/http_error.g.dart';

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

@JsonSerializable()
class HttpError {
  dynamic e;
  String? errMsg;
  int? errCode;
  String? data;

  HttpError();

  ///Map<String, dynamic> json
  /*factory HttpError.*/
  static fromJson(Map<String, dynamic> json) => $HttpErrorFromJson(json);

  Map<String, dynamic> toJson() => $HttpErrorToJson(this);

  @override
  String toString() {
    return 'HttpError{e: $e, errMsg: $errMsg, errCode: $errCode, data: $data}';
  }
}
