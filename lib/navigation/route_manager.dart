import 'package:flutter/material.dart';
import 'package:my_finance_flutter/navigation/route_manager_contract.dart';
import 'package:my_finance_flutter/ui/page/home/page.dart';
import 'package:my_finance_flutter/ui/page/splash/page.dart';

class MyFinanceRouteManager implements RouteManager {
  static const _splashPath = "/splash";
  static const _homePath = "/";

  Route configureRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case _splashPath:
        return MaterialPageRoute(
            builder: (context) => SplashPage(), settings: routeSettings);
      case _homePath:
        return MaterialPageRoute(
            builder: (context) => HomePage(), settings: routeSettings);
      default:
        return MaterialPageRoute(
            builder: (context) => HomePage(), settings: routeSettings);
    }
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, _homePath);
  }
}
