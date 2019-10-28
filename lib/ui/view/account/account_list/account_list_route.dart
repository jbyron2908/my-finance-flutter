import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/account_list_view.dart';

class AccountListRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/account/list";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountListView(),
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
