import 'package:flutter/material.dart';
import 'package:flutter_wan_android/ui/login/login_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/k_h_detail_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_list_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/lg_collect_page/lg_collect_page.dart';
import 'package:flutter_wan_android/ui/main/main_page.dart';
import 'package:flutter_wan_android/ui/register/register_page.dart';
import 'package:flutter_wan_android/ui/welcome/welcome_page.dart';

///路由Map
Map<String, WidgetBuilder> routes = {
  PageList.welcome: (context) => const WelcomePage(),
  PageList.loginPage: (context) => const LoginPge(),
  PageList.mainPage: (context) => const MainPage(),
  PageList.registerPage: (context) => const RegisterPage(),
  PageList.projectListPage: (context) => const ProjectListPage(),
  PageList.kHDetailPage: (context) => const KHDetailPage(),
  PageList.lgCollectPage: (context) => const LgCollectPage(),
};

///路由的name
class PageList {
  static var welcome = "/";
  static var loginPage = "loginPage";
  static var mainPage = "mainPage";
  static var registerPage = "registerPage";
  static var projectListPage = "projectListPage";
  static var kHDetailPage = "KHDetailPage";
  static var lgCollectPage = "lgCollectPage";
}
