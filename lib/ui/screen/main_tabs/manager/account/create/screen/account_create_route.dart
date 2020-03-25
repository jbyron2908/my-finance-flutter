import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/create/screen/account_create_screen.dart';

class AccountCreateRoute extends BaseRoute<AccountCreateScreenArgs> {
  AccountCreateRoute({AccountCreateScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/account/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountCreateScreen(),
      settings: routeSettings,
    );
  }
}
