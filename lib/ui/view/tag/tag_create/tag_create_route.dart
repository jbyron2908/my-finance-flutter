import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_create/tag_create_view.dart';

class TagCreateRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/tag/create";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => TagCreateView(),
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
