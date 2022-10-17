import 'package:flutter_wan_android/core/net/abs_net_manager.dart';
import 'package:flutter_wan_android/network/dio_utils.dart';
import 'package:flutter_wan_android/core/wan_android_api.dart';

///网络实现层
class NetManager extends AbsNetManager {
  ///
  static final DioUtils _dioUtils = DioUtils.getInstance();

  @override
  Future<void> login<T>(String name, String pwd, onSuccess, onFiled) async {
    var map = <String, String>{};
    map["username"] = name;
    map["password"] = pwd;
    await _dioUtils.post<T>(WanAndroidApi.login, map, onSuccess, onFiled);
  }

  @override
  Future<void> logout<T>(onSuccess, onFiled) async {
    await _dioUtils.get<T>(WanAndroidApi.logout, onSuccess, onFiled);
  }

  @override
  Future<void> register<T>(
      String name, String pwd, String pwd2, onSuccess, onFiled) async {
    var map = <String, String>{};
    map["username"] = name;
    map["password"] = pwd;
    map["repassword"] = pwd2;
    await _dioUtils.post<T>(WanAndroidApi.register, map, onSuccess, onFiled);
  }

  @override
  Future<void> getArticleList<T>(int page, onSuccess, onFailed) async {
    var urlMap = <String, dynamic>{};
    urlMap["num"] = page;
    await _dioUtils.get<T>(WanAndroidApi.articleList, onSuccess, onFailed,
        appendUrlMap: urlMap);
  }

  @override
  Future<void> getBannerList<T>(onSuccess, onFiled) async {
    await _dioUtils.getList<T>(WanAndroidApi.bannerList, onSuccess, onFiled);
  }

  @override
  Future<void> lgCollect<T>(int? id, onSuccess, onFailed) async {
    var appendUrlMap = <String, dynamic>{};
    appendUrlMap["id"] = id;
    await _dioUtils.post<T>(WanAndroidApi.lgCollect, null, onSuccess, onFailed,
        appendUrlMap: appendUrlMap);
  }

  @override
  Future<void> getProjectList<T>(int? cid, int page, onSuccess, onFiled) async {
    var queryMap = <String, dynamic>{};
    var appendUrlMap = <String, dynamic>{};
    queryMap["cid"] = cid;
    appendUrlMap["page"] = page;
    await _dioUtils.get<T>(WanAndroidApi.projectList, onSuccess, onFiled,
        paramsMap: queryMap, appendUrlMap: appendUrlMap);
  }

  @override
  Future<void> getProjectTreeJson<T>(onSuccess, onFailed) async {
    await _dioUtils.getList<T>(WanAndroidApi.projectTree, onSuccess, onFailed);
  }

  @override
  Future<void> getArticleListPageDetail<T>(
      int? page, int? cid, onSuccess, onFile) async {
    var queryMap = <String, dynamic>{};
    var appendUrlMap = <String, dynamic>{};
    queryMap["cid"] = cid;
    appendUrlMap["page"] = page;

    await _dioUtils.get<T>(
        WanAndroidApi.articleListPageDetail, onSuccess, onFile,
        paramsMap: queryMap, appendUrlMap: appendUrlMap);
  }

  @override
  Future<void> getTreeList<T>(onSuccess, onFiled) async {
    await _dioUtils.getList<T>(WanAndroidApi.treeList, onSuccess, onFiled);
  }
}
