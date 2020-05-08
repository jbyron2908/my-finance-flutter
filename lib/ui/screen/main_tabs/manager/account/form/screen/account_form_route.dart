import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';

class AccountFormRoute extends BaseRoute<AccountFormScreenArgs>
    with MainTabRoute {
  AccountFormRoute.forRouter();

  AccountFormRoute({
    @required AccountFormScreenArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => '/manager/account/create';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountFormScreen(),
      settings: routeSettings,
    );
  }
}
