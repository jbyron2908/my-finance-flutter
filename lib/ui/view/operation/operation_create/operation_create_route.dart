import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/operation_create_view.dart';

class OperationCreateRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/operation/create";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationCreateView(),
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
