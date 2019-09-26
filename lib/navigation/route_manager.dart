import 'package:flutter/material.dart';
import 'package:my_finance_flutter/navigation/route_manager_contract.dart';
import 'package:my_finance_flutter/ui/page/create_account/page.dart';
import 'package:my_finance_flutter/ui/page/home/page.dart';
import 'package:my_finance_flutter/ui/page/splash/page.dart';

class MyFinanceRouteManager implements RouteManager {
  static const _splashPath = "/splash";
  static const _homePath = "/";
  static const _createAccountPath = "/createAccount";

  Route configureRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case _splashPath:
        return MaterialPageRoute(
            builder: (context) => SplashPage(), settings: routeSettings);
      case _homePath:
        return MaterialPageRoute(
            builder: (context) => HomePage(), settings: routeSettings);
      case _createAccountPath:
        return MaterialPageRoute(
            builder: (context) => CreateAccountPage(), settings: routeSettings);
      default:
        return MaterialPageRoute(
            builder: (context) => HomePage(), settings: routeSettings);
    }
  }

  @override
  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, _homePath);
  }

  @override
  void navigateToCreateAccount(BuildContext context) {
    Navigator.pushNamed(context, _createAccountPath);
  }
}
