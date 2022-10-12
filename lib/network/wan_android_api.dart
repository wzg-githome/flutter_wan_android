///玩android的APi
class WanAndroidApi {
  ///登录
  static var login = "user/login";

  ///注册
  static var register = "user/register";

  ///logout
  static var logout="user/logout/json";

  ///banner
  static var bannerList = "banner/json";

  ///获取feed文章列表
  ///num 页数
  static var articleList="article/list/{num}/json";
}
