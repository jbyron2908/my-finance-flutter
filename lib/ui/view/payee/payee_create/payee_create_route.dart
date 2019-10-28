import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/payee_create_view.dart';

class PayeeCreateRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/payee/create";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PayeeCreateView(),
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
