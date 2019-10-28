import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/tag_list_view.dart';

class TagListRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/tag/list";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => TagListView(),
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
