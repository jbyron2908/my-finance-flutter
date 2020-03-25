import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_screen.dart';

class PayeeListRoute extends BaseRoute {
  @override
  String get routePath => "/payee/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
