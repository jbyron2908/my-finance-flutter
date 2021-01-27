import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/controller/main_controller.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_view.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_navigation/bottom_navigation_view.dart';

class MainScreen extends StatelessWidget {
  static String get _routeName => '/main';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => MainScreen(),
          binding: MainBinding(),
        ),
      );

  static void replaceTo() {
    AppRouter.replaceTo(_routeName);
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
    Get.put(MainTabRouter(
      [
        TabItem(
          id: 'debug',
          title: 'Debug',
          iconData: FontAwesomeIcons.bug,
          rootPath: '/debug/main',
        ),
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
      ],
    ));
  }
}
