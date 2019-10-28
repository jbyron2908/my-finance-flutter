import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/account_create_view.dart';

class AccountCreateRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/account/create";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountCreateView(),
      settings: routeSettings,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(
      context,
      _routePath,
    );
  }
}
