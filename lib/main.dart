import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_wan_android/page_list.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import 'config_center.dart';
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
    _initSp();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: false,
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: ConfigCenter.isDebug,
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
            ));
  }

  void _initSp() async {
    await SpUtil.getInstance();
    LogUtil.init(
        isDebug: ConfigCenter.isDebug, maxLen: ConfigCenter.logMaxLength);
  }
}
