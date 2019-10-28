import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/payee_list_view.dart';

class PayeeListRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/payee/list";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeListView(),
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
