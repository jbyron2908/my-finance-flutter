import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/create/screen/payee_create_screen.dart';

class PayeeCreateRoute extends BaseRoute<PayeeCreateScreenArgs> {
  PayeeCreateRoute({PayeeCreateScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/payee/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeCreateScreen(),
      settings: routeSettings,
    );
  }
}
