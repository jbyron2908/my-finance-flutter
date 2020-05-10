import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_screen.dart';
import 'package:provider/provider.dart';

class PayeeListRoute extends BaseRoute<PayeeListRoute, void> with MainTabRoute {
  PayeeListRoute.forRouter();

  PayeeListRoute({PayeeListRoute argument}) : super(argument: argument);

  @override
  String get routePath => '/manager/payee/list';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeListScreen(),
      settings: routeSettings,
    );
  }
}

class PayeeListRouteArgs {
  static PayeeListRouteArgs of(BuildContext context) =>
      Provider.of<PayeeListRouteArgs>(context, listen: false);

  int field1;

  PayeeListRouteArgs({
    this.field1,
  });
}
