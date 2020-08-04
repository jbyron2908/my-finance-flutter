import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main/controller/main_controller.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_view.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/bottom_navigation_view.dart';

class MainScreen extends StatelessWidget {
  static String get _routePath => '/main';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => MainScreen(),
        binding: MainBinding(),
      );

  static void replaceTo() {
    AppRouter.replaceTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return MainView();
  }
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(MainTabRouter([
      TabItem(
        id: 'home',
        title: 'Home',
        iconData: Icons.home,
        rootPath: '/home/main',
        defaultTab: true,
      ),
      TabItem(
        id: 'management',
        title: 'Management',
        iconData: Icons.business,
        rootPath: '/home/manager',
      ),
    ]));
  }
}
