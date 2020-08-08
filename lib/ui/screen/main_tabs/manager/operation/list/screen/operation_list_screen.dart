import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/controller/operation_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/widget/operation_list_view.dart';

class OperationListScreen extends StatelessWidget {
  static String get _routeName => '/manager/operation/list';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => OperationListScreen(),
          binding: OperationListBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return OperationListView();
  }
}

class OperationListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationListController());
  }
}
