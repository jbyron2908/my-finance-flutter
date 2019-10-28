import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/operation_list_view.dart';

class OperationListRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/operation/list";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationListView(),
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
