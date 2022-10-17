///网络接口层
abstract class AbsNetManager {
  Future<void> login<T>(String name, String pwd, onSuccess, onFiled);

  Future<void> logout<T>(onSuccess, onFiled);

  Future<void> register<T>(
      String name, String pwd, String pwd2, onSuccess, onFiled);

  Future<void> getBannerList<T>(onSuccess, onFiled);

  Future<void> getArticleList<T>(int page, onSuccess, onFailed);

  Future<void> lgCollect<T>(int? id, onSuccess, onFailed);

  Future<void> getProjectTreeJson<T>(onSuccess, onFailed);

  Future<void> getProjectList<T>(int? cid, int page, onSuccess, onFiled);

  Future<void> getTreeList<T>(onSuccess, onFiled);

  Future<void> getArticleListPageDetail<T>(
      int? page, int? cid, onSuccess, onFile);
}
