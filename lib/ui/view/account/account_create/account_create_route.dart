import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/account_create_view.dart';

class AccountCreateRoute extends BaseRoute {
  @override
  String get routePath => "/account/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountCreateView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
