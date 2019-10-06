import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/account_create/account_create_view.dart';
import 'package:my_finance_flutter/ui/view/account_list/account_list_view.dart';
import 'package:my_finance_flutter/ui/view/category_create/category_create_view.dart';
import 'package:my_finance_flutter/ui/view/category_list/category_list_view.dart';
import 'package:my_finance_flutter/ui/view/home/home_view.dart';
import 'package:my_finance_flutter/ui/view/splash/splash_view.dart';

class AppRouter {
  static const splashPath = "/";
  static const homePath = "/home";
  static const accountCreatePath = "/accountCreate";
  static const accountListPath = "/accountList";
  static const categoryCreatePath = "/categoryCreate";
  static const categoryListPath = "/categoryList";

  static Route generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashPath:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
          settings: routeSettings,
        );
      case homePath:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: routeSettings,
        );
      case accountCreatePath:
        return MaterialPageRoute(
          builder: (context) => AccountCreateView(),
          settings: routeSettings,
        );
      case accountListPath:
        return MaterialPageRoute(
          builder: (context) => AccountListView(),
          settings: routeSettings,
        );
      case categoryCreatePath:
        return MaterialPageRoute(
          builder: (context) => CategoryCreateView(),
          settings: routeSettings,
        );
      case categoryListPath:
        return MaterialPageRoute(
          builder: (context) => CategoryListView(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
          settings: routeSettings,
        );
    }
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homePath);
  }

  static void navigateToAccountCreate(BuildContext context) {
    Navigator.pushNamed(context, accountCreatePath);
  }

  static void navigateToAccountList(BuildContext context) {
    Navigator.pushNamed(context, accountListPath);
  }

  static void navigateToCategoryCreate(BuildContext context) {
    Navigator.pushNamed(context, categoryCreatePath);
  }

  static void navigateToCategoryList(BuildContext context) {
    Navigator.pushNamed(context, categoryListPath);
  }
}
