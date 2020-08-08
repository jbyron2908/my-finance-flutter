import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/controller/label_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/widget/label_list_view.dart';

class LabelListScreen extends StatelessWidget {
  static String get _routeName => '/manager/label/list';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => LabelListScreen(),
          binding: LabelListBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return LabelListView();
  }
}

class LabelListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LabelListController());
  }
}
