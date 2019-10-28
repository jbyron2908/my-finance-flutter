import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/home/home_view.dart';

class HomeRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/home";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => HomeView(),
      settings: routeSettings,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(
      context,
      _routePath,
    );
  }

  static void replaceTo(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      _routePath,
    );
  }
}
