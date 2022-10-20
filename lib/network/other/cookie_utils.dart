import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

import '../constant.dart';

class CookieUtils {
  static const _tag = "CookieUtils";

  ///cookie file path
  static Future<String?> getCookieFilePath() async {
    var dir = await getApplicationSupportDirectory();
    return dir.path + "/.cookies/";
  }

  ///delete cookie file
  static Future<void> deleteCookieFile() async {
    var dir = await getApplicationSupportDirectory();
    String path = dir.path + "/.cookies/";
    var file = File(path);
    bool exists = await file.exists();
    LogUtil.d("exists: $exists", tag: _tag);
    if (exists) await file.delete();

    var _persistCookieJar =
        PersistCookieJar(storage: FileStorage(path)); //持久化cookie
    var loadForRequest =
        await _persistCookieJar.loadForRequest(Uri.parse(Constant.baseUrl));
    LogUtil.d("cookie:\t${loadForRequest.toString()}", tag: _tag);
  }
}
