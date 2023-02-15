import 'package:flutter/material.dart';
import 'package:flutter_wan_android/ui/login/login_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/knowledge_hierarchy_page/k_h_detail_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_list_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/lg_collect_page/lg_collect_page.dart';
import 'package:flutter_wan_android/ui/main/main_page.dart';
import 'package:flutter_wan_android/ui/register/register_page.dart';
import 'package:flutter_wan_android/ui/welcome/welcome_binding.dart';
import 'package:flutter_wan_android/ui/welcome/welcome_page.dart';
import 'package:get/get.dart';

///路由的name
class Routers {
  static var welcome = "/";
  static var loginPage = "loginPage";
  static var mainPage = "mainPage";
  static var registerPage = "registerPage";
  static var projectListPage = "projectListPage";
  static var kHDetailPage = "KHDetailPage";
  static var lgCollectPage = "lgCollectPage";

  ///路由Map
  static Map<String, WidgetBuilder> routes = {
    // Routers.welcome: (context) => const WelcomePage(),
    Routers.loginPage: (context) => const LoginPge(),
    Routers.mainPage: (context) => const MainPage(),
    Routers.registerPage: (context) => const RegisterPage(),
    Routers.projectListPage: (context) => const ProjectListPage(),
    Routers.kHDetailPage: (context) => const KHDetailPage(),
    Routers.lgCollectPage: (context) => const LgCollectPage(),
  };

  static List<GetPage> getPageList = [
    GetPage(
      name: Routers.welcome,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    // GetPage(
    //   name: Routers.loginPage,
    //   page: () => const LoginPge(),
    // ),
    // GetPage(
    //   name: Routers.mainPage,
    //   page: () => const MainPage(),
    // ),
    // GetPage(
    //   name: Routers.registerPage,
    //   page: () => const RegisterPage(),
    // ),
    // GetPage(
    //   name: Routers.projectListPage,
    //   page: () => const ProjectListPage(),
    // ),
    // GetPage(
    //   name: Routers.kHDetailPage,
    //   page: () => const KHDetailPage(),
    // ),
    // GetPage(
    //   name: Routers.lgCollectPage,
    //   page: () => const LgCollectPage(),
    // ),
  ];
}
