import 'package:flutter_wan_android/custom/ace_app_bar.dart';
import 'package:flutter_wan_android/custom/custom_app_bar.dart';
import 'package:flutter_wan_android/custom/common_class.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/home_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/project_page/project_page.dart';
import 'package:flutter_wan_android/ui/main/inner_page/user_page/user_page.dart';
import 'package:flutter_wan_android/utils/ace_log.dart';

import 'inner_page/knowledge_hierarchy_page/knowledgn_hierarchy_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageCon;

  int _defaultIndex = 0;

  @override
  void initState() {
    _pageCon = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _checkedColor = Colors.blue;
    var _defaultColor = Colors.grey;

    return Scaffold(
      appBar: getAceAppBar("mainTitle".tr),
      body: PageView(
        controller: _pageCon,
        onPageChanged: (index) {
          if (mounted) {
            setState(() {
              _defaultIndex = index;
            });
          }
        },
        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          ProjectPage(),
          KnowledgeHierarchyPage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _defaultIndex,
        onTap: (index) {
          if (_defaultIndex != index) {
            _pageCon.jumpToPage(index);
          }
          if (mounted) {
            setState(() {
              _defaultIndex = index;
              AceLog.d("_defaultIndex: $_defaultIndex");
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultIndex == 0 ? _checkedColor : _defaultColor,
            ),
            label: "首页",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultIndex == 1 ? _checkedColor : _defaultColor,
              ),
              label: "项目"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultIndex == 2 ? _checkedColor : _defaultColor,
              ),
              label: "知识体系"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultIndex == 3 ? _checkedColor : _defaultColor,
              ),
              label: "我的"),
        ],
      ),
    );
  }
}
