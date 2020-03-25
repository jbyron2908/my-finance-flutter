import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_screen.dart';

class AccountListRoute extends BaseRoute {
  @override
  String get routePath => "/account/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as AccountListRouteArgs;

    return MaterialPageRoute(
      builder: (context) => AccountListScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class AccountListRouteArgs {
  int field1;

  AccountListRouteArgs({
    this.field1,
  });
}
