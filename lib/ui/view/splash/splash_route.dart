import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/splash/splash_view.dart';

class SplashRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => SplashView(),
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
