import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_screen.dart';

class AccountListRoute extends BaseRoute<AccountListScreenArgs>
    with MainTabRoute {
  AccountListRoute.forRouter();

  AccountListRoute({AccountListScreenArgs argument})
      : super(argument: argument);

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
