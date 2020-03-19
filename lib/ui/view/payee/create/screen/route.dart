import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/view/payee/create/screen/screen.dart';

class PayeeCreateRoute extends BaseRoute {
  @override
  String get routePath => "/payee/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeCreateScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
