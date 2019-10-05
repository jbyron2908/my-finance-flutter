import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/account_create/account_create_view.dart';
import 'package:my_finance_flutter/ui/view/account_list/account_list_view.dart';
import 'package:my_finance_flutter/ui/view/home/home_view.dart';
import 'package:my_finance_flutter/ui/view/splash/splash_view.dart';

class AppRouter {
  static const splashPath = "/";
  static const homePath = "/home";
  static const accountCreatePath = "/accountCreate";
  static const accountListPath = "/accountList";

  static Route generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashPath:
        return MaterialPageRoute(
            builder: (context) => SplashView(), settings: routeSettings);
      case homePath:
        return MaterialPageRoute(
            builder: (context) => HomeView(), settings: routeSettings);
      case accountCreatePath:
        return MaterialPageRoute(
            builder: (context) => AccountCreateView(), settings: routeSettings);
      case accountListPath:
        return MaterialPageRoute(
            builder: (context) => AccountListView(), settings: routeSettings);
      default:
        return MaterialPageRoute(
            builder: (context) => HomeView(), settings: routeSettings);
    }
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homePath);
  }

  static void navigateToCreateAccount(BuildContext context) {
    Navigator.pushNamed(context, accountCreatePath);
  }
}
