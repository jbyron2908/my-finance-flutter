import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_screen.dart';

class PayeeListRoute extends BaseRoute<PayeeListRoute> with MainTabRoute {
  PayeeListRoute.forRouter();

  PayeeListRoute({PayeeListRoute argument}) : super(argument: argument);

  @override
  String get routePath => "/manager/payee/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeListScreen(),
      settings: routeSettings,
    );
  }
}
