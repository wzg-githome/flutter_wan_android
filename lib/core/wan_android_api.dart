///玩android的APi
class WanAndroidApi {
  ///登录
  static var login = "user/login";

  ///注册
  static var register = "user/register";

  ///logout
  static var logout = "user/logout/json";

  ///banner
  static var bannerList = "banner/json";

  ///获取feed文章列表
  ///num 页数
  static var articleList = "article/list/{num}/json";

  ///项目分类
  static var projectTree = "project/tree/json";

  ///项目类别数据
  static var projectList = "project/list/{page}/json";

  ///知识体系数据
  static var treeList = "tree/json";

  ///知识体系feed文章数据
  static var articleListPageDetail = "article/list/{page}/json";

  ///收藏站内文章列表
  static var lgCollect = "lg/collect/{id}/json";

  ///取消站内文章收藏列表
  static var lgUnCollect = "lg/uncollect/{id}/json";

  ///post 收藏站外文章
  static var lgInStationCollect = "lg/collect/add/json";

  ///取消收藏页面站内文章
  static var lgInStationUnCollect = "lg/uncollect_originId/{id}/json";

  ///我的收藏列表
  static var lgCollectList = "lg/collect/list/{page}/json";

  ///公众号列表数据
  static var wxChapters = "wxarticle/chapters/json";

  ///获取当前公众号某页的数据
  static var wxListFormId = "wxarticle/list/{id}/{page}/json";

  ///指定搜索内容，搜索当前公众号的某页的此类数据
  static var searchWxFormK = "wxarticle/list/{id}/{page}/json";
}
