import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/payee/list/screen/screen.dart';

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
