import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/category_create_view.dart';

class CategoryCreateRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/category/create";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryCreateView(),
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
