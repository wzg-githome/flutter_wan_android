import 'package:flutter_wan_android/ui/common/web_page.dart';
import 'package:flutter_wan_android/ui/login/login_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/k_h_detail_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_list_page.dart';
import 'package:flutter_wan_android/ui/main/main_page.dart';
import 'package:flutter_wan_android/ui/register/register_page.dart';
import 'package:flutter_wan_android/ui/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  PageList.welcome: (context) => const WelcomePage(),
  PageList.loginPage: (context) => const LoginPge(),
  PageList.mainPage: (context) => const MainPage(),
  PageList.registerPage: (context) => const RegisterPage(),
  PageList.projectListPage: (context) => const ProjectListPage(),
  PageList.KHDetailPage: (context) => const KHDetailPage(),
  // PageList.webView: (context) => const WebPage(),
};

class PageList {
  static var welcome = "/";
  static var loginPage = "loginPage";
  static var mainPage = "mainPage";
  static var registerPage = "registerPage";
  static var projectListPage = "projectListPage";
  static var KHDetailPage = "KHDetailPage";
  // static var webView = "webView";
}
