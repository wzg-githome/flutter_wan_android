import 'package:flutter_wan_android/ui/login/login_page.dart';
import 'package:flutter_wan_android/ui/main/main_page.dart';
import 'package:flutter_wan_android/ui/register/register_page.dart';
import 'package:flutter_wan_android/ui/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  PageList.welcome: (context) => const WelcomePage(),
  PageList.loginPage: (context) => const LoginPge(),
  PageList.mainPage: (context) => const MainPage(),
  PageList.registerPage: (context) => const RegisterPage(),
};

class PageList {
  static var welcome = "/";
  static var loginPage = "loginPage";
  static var mainPage = "mainPage";
  static var registerPage = "registerPage";
}
