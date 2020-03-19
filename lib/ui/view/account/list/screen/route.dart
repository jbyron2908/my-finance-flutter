import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/view/account/list/screen/screen.dart';

class AccountListRoute extends BaseRoute {
  @override
  String get routePath => "/account/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
