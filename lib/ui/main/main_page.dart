import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/custom/will_po_scope_view.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/home_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/user_page.dart';
import 'package:flutter_wan_android/ui/main/main_controller.dart';
import 'package:get/get.dart';

import 'inner_page/knowledge_hierarchy_page/k_h_page.dart';

///主页框架
class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPoScopeView(
        child: Scaffold(
      appBar: getAceAppBar("mainTitle".tr),
      body: PageView(
        controller: controller.pageCon,
        onPageChanged: controller.onPageChanged,
        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          ProjectPage(),
          KHPage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.defaultIndex.value,
            onTap: controller.onBottomNavigationBarTap,
            items: controller.bottomList
                .map((e) => BottomNavigationBarItem(
                      icon: Icon(
                        e["icon"] as IconData,
                        color: controller.defaultIndex.value == e["index"]
                            ? controller.checkedColor
                            : controller.defaultColor,
                      ),
                      label: e["name"] as String,
                    ))
                .toList(),
          )),
    ));
  }
}
