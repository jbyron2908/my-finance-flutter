import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/populate_demo/controller/populate_demo_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/populate_demo/widget/populate_demo_view.dart';

class PopulateDemoScreen extends StatelessWidget {
  static String get _routeName => '/debub/populate_demo';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => PopulateDemoScreen(),
          binding: PopulateDemoBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return PopulateDemoView();
  }
}

class PopulateDemoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PopulateDemoController());
  }
}
