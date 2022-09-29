import 'package:flutter_wan_android/ui/login/login_page.dart';
import 'package:flutter_wan_android/ui/main/main_page.dart';
import 'package:flutter_wan_android/ui/register/register_page.dart';
import 'package:flutter_wan_android/ui/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const WelcomePage(),
  "loginPage": (context) => const LoginPge(),
  "mainPage": (context) => const MainPage(),
  "register": (context) => const RegisterPage(),
};
