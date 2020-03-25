import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_list/screen/account_list_screen.dart';

class AccountListRoute extends BaseRoute {
  AccountListRouteArgs routeArguments;

  AccountListRoute({this.routeArguments});

  @override
  String get routePath => "/home/account_list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as AccountListRouteArgs;

    return MaterialPageRoute(
      builder: (context) => AccountListScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class AccountListRouteArgs {
  int field1;

  AccountListRouteArgs({
    this.field1,
  });
}
