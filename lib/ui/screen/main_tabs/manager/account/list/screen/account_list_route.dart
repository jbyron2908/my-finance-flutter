import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_screen.dart';
import 'package:provider/provider.dart';

class AccountListRoute extends BaseRoute<AccountListRouteArgs, void>
    with MainTabRoute {
  AccountListRoute.forRouter();

  AccountListRoute({AccountListRouteArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/manager/account/list';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountListScreen(),
      settings: routeSettings,
    );
  }
}

class AccountListRouteArgs {
  static AccountListRouteArgs of(BuildContext context) =>
      Provider.of<AccountListRouteArgs>(context, listen: false);

  int field1;

  AccountListRouteArgs({
    this.field1,
  });
}
