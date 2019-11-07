import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/payee_create_view.dart';

class PayeeCreateRoute extends BaseRoute {
  @override
  String get routePath => "/payee/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeCreateView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
