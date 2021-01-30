import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/demo_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/entity/account_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/entity/category_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/controller/entity/payee_populate_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/debug/demo_populate/widget/demo_populate_view.dart';

class DemoPopulateScreen extends StatelessWidget {
  static String get _routeName => '/debug/populate';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => DemoPopulateScreen(),
          binding: DemoPopulateBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DemoPopulateView();
  }
}

class DemoPopulateBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryPopulateController());
    Get.put(PayeePopulateController());
    Get.put(AccountPopulateController());
    Get.put(DemoPopulateController());
  }
}
