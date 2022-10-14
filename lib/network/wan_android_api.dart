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
}
