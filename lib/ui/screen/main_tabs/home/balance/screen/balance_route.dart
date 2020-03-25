import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_screen.dart';

class BalanceRoute extends BaseRoute {
  BalanceRouteArgs routeArguments;

  BalanceRoute({this.routeArguments});

  @override
  String get routePath => "/home/account_list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as BalanceRouteArgs;

    return MaterialPageRoute(
      builder: (context) => BalanceScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class BalanceRouteArgs {
  int field1;

  BalanceRouteArgs({
    this.field1,
  });
}
