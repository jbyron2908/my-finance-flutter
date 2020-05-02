import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_screen.dart';

class BalanceRoute extends BaseRoute<BalanceScreenArgs> with MainTabRoute {
  BalanceRoute.forRouter();

  BalanceRoute({BalanceScreenArgs argument}) : super(argument: argument);

  @override
  String get routePath => "/home/main";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => BalanceScreen(),
      settings: routeSettings,
    );
  }
}
