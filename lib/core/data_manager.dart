import 'package:flutter_wan_android/core/net/abs_net_manager.dart';
import 'package:flutter_wan_android/core/net/net_manager.dart';
import 'package:flutter_wan_android/core/sp/sp_maager.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/entity/banner_entity.dart';

import 'sp/abs_sp_manager.dart';

///数据管理
class DataManager extends AbsNetManager with AbsSPManager {
  late NetManager _netManager;
  late SPManager _spManager;

  static final DataManager instance = DataManager._getInstance();

  ///私有构造
  DataManager._getInstance() {
    _netManager = NetManager();
    _spManager = SPManager();
  }

  factory DataManager() {
    return instance;
  }

  @override
  Future<void> login<T>(String name, String pwd, onSuccess, onFiled) async {
    await _netManager.login<T>(name, pwd, onSuccess, onFiled);
  }

  @override
  Future<void> logout<T>(onSuccess, onFiled) async {
    await _netManager.logout<T>(onSuccess, onFiled);
  }

  @override
  Future<void> register<T>(
      String name, String pwd, String pwd2, onSuccess, onFiled) async {
    await _netManager.register<T>(name, pwd, pwd2, onSuccess, onFiled);
  }

  @override
  Future<void> setLoginStatus(bool isLogin) async {
    await _spManager.setLoginStatus(isLogin);
  }

  @override
  bool getLoginStatus() {
    return _spManager.getLoginStatus();
  }

  @override
  Future<void> setLoginName(String name) async {
    await _spManager.setLoginName(name);
  }

  @override
  String? getLoginName() {
    return _spManager.getLoginName();
  }

  @override
  List<BannerEntity?>? getCacheBannerList() {
    return _spManager.getCacheBannerList();
  }

  @override
  Future<void> putBannerList(List<BannerEntity?>? bannerList) async {
    await _spManager.putBannerList(bannerList);
  }

  @override
  Future<void> getArticleList<T>(int page, onSuccess, onFailed) async {
    await _netManager.getArticleList<T>(page, onSuccess, onFailed);
  }

  @override
  Future<void> getBannerList<T>(onSuccess, onFiled) async {
    await _netManager.getBannerList<T>(onSuccess, onFiled);
  }

  @override
  Future<void> lgCollect<T>(int? id, onSuccess, onFailed) async {
    await _netManager.lgCollect<T>(id, onSuccess, onFailed);
  }

  @override
  Future<void> lgUnCollect<T>(
      int? id, int? originId, onSuccess, onFailed) async {
    await _netManager.lgUnCollect<T>(id, originId, onSuccess, onFailed);
  }

  @override
  Future<void> getProjectList<T>(int? cid, int page, onSuccess, onFiled) async {
    await _netManager.getProjectList<T>(cid, page, onSuccess, onFiled);
  }

  @override
  Future<void> getProjectTreeJson<T>(onSuccess, onFailed) async {
    await _netManager.getProjectTreeJson<T>(onSuccess, onFailed);
  }

  @override
  Future<void> getArticleListPageDetail<T>(
      int? page, int? cid, onSuccess, onFile) async {
    await _netManager.getArticleListPageDetail<T>(page, cid, onSuccess, onFile);
  }

  @override
  Future<void> getTreeList<T>(onSuccess, onFiled) async {
    await _netManager.getTreeList<T>(onSuccess, onFiled);
  }

  @override
  Future<void> lgCollectList<T>(int page, onSuccess, onFiled) async {
    await _netManager.lgCollectList<T>(page, onSuccess, onFiled);
  }

  @override
  Future<void> lgInStationCollect<T>(
      int? id, int? originId, onSuccess, onFiled) async {
    await _netManager.lgInStationCollect(id, originId, onSuccess, onFiled);
  }

  @override
  Future<void> lgInStationUnCollect<T>(int? id, onSuccess, onFiled) async {
    await _netManager.lgInStationUnCollect<T>(id, onSuccess, onFiled);
  }
}
