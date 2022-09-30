import 'package:flutter_wan_android/custom/custom_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          centerTitle: "mainTitle".tr,
        ),
      ),
      body: Container(),
    );
  }
}
