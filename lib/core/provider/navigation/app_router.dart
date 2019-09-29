import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/create_account/create_account_view.dart';
import 'package:my_finance_flutter/ui/view/home/home_view.dart';
import 'package:my_finance_flutter/ui/view/splash/splash_view.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static AppRouter of(BuildContext context) => Provider.of<AppRouter>(context);

  static const splashPath = "/";
  static const homePath = "/home";
  static const createAccountPath = "/createAccount";

  static Route generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashPath:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: routeSettings);
      case homePath:
        return MaterialPageRoute(
            builder: (context) => HomeView(), settings: routeSettings);
      case createAccountPath:
        return MaterialPageRoute(
            builder: (context) => CreateAccountView(), settings: routeSettings);
      default:
        return MaterialPageRoute(
            builder: (context) => HomeView(), settings: routeSettings);
    }
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homePath);
  }

  void navigateToCreateAccount(BuildContext context) {
    Navigator.pushNamed(context, createAccountPath);
  }
}
