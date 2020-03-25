import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/create/screen/account_create_screen.dart';

class AccountCreateRoute extends BaseRoute {
  @override
  String get routePath => "/manager/account/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as AccountCreateRouteArgs;

    return MaterialPageRoute(
      builder: (context) => AccountCreateScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class AccountCreateRouteArgs {
  int field1;

  AccountCreateRouteArgs({
    this.field1,
  });
}
