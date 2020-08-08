import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/controller/balance_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/widget/balance_view.dart';

class BalanceScreen extends StatelessWidget {
  static String get _routeName => '/home/main';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => BalanceScreen(),
          binding: BalanceBinding(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BalanceView();
  }
}

class BalanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BalanceController());
  }
}
