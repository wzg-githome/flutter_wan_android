import 'package:flutter_wan_android/page_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sp_util/sp_util.dart';

import 'l10n/messages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initSp();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      title: 'flutter WanAndroid',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      //默认语言
      locale: Get.deviceLocale,
      translations: Messages(),
      fallbackLocale: const Locale('zh', 'CH'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
    );
  }

  void initSp() async {
    await SpUtil.getInstance();
  }
}
