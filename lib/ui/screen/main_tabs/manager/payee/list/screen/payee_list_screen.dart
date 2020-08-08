import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/controller/payee_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/payee_list_view.dart';

class PayeeListScreen extends StatelessWidget {
  static String get _routeName => '/manager/payee/list';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => PayeeListScreen(),
          binding: PayeeListBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return PayeeListView();
  }
}

class PayeeListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PayeeListController());
  }
}
