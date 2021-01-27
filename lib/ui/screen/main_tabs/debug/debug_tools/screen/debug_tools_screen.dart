import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/debug_tools/controller/debug_tools_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/debug_tools/widget/debug_tools_view.dart';

class DebugToolsScreen extends StatelessWidget {
  static String get _routeName => '/debug/main';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => DebugToolsScreen(),
          binding: DebugToolsBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DebugToolsView();
  }
}

class DebugToolsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DebugToolsController());
  }
}
