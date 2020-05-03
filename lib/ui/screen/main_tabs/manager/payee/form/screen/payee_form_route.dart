import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';

class PayeeFormRoute extends BaseRoute<PayeeFormScreenArgs> with MainTabRoute {
  PayeeFormRoute.forRouter();

  PayeeFormRoute({
    @required PayeeFormScreenArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => "/manager/payee/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeFormScreen(),
      settings: routeSettings,
    );
  }
}
