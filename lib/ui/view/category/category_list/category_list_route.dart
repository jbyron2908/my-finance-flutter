import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/category_list_view.dart';

class CategoryListRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/category/list";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryListView(),
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
