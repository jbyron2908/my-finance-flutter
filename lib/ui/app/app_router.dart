import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/account_create_view.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/account_list_view.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/account_selection_view.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/category_create_view.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/category_list_view.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/category_selection_view.dart';
import 'package:my_finance_flutter/ui/view/home/home_view.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/operation_create_view.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/operation_list_view.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/payee_create_view.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/payee_list_view.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/payee_selection_view.dart';
import 'package:my_finance_flutter/ui/view/splash/splash_view.dart';

class AppRouter {
  static const splashPath = "/";
  static const homePath = "/home";
  static const accountCreatePath = "/accountCreate";
  static const accountListPath = "/accountList";
  static const accountSelectionPath = "/accountSelection";
  static const categoryCreatePath = "/categoryCreate";
  static const categoryListPath = "/categoryList";
  static const categorySelectionPath = "/categorySelection";
  static const payeeCreatePath = "/payeeCreate";
  static const payeeListPath = "/payeeList";
  static const payeeSelectionPath = "/payeeSelection";
  static const operationCreatePath = "/operationCreate";
  static const operationListPath = "/operationList";
  static const operationSelectionPath = "/operationSelection";

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
      case accountSelectionPath:
        return MaterialPageRoute<AccountModel>(
          builder: (context) => AccountSelectionView(),
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
      case categorySelectionPath:
        return MaterialPageRoute<CategoryModel>(
          builder: (context) => CategorySelectionView(),
          settings: routeSettings,
        );
      case payeeCreatePath:
        return MaterialPageRoute(
          builder: (context) => PayeeCreateView(),
          settings: routeSettings,
        );
      case payeeListPath:
        return MaterialPageRoute(
          builder: (context) => PayeeListView(),
          settings: routeSettings,
        );
      case payeeSelectionPath:
        return MaterialPageRoute<CategoryModel>(
          builder: (context) => PayeeSelectionView(),
          settings: routeSettings,
        );
      case operationCreatePath:
        return MaterialPageRoute(
          builder: (context) => OperationCreateView(),
          settings: routeSettings,
        );
      case operationListPath:
        return MaterialPageRoute(
          builder: (context) => OperationListView(),
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

  static Future<AccountModel> navigateToAccountSelection(
    BuildContext context,
  ) {
    return Navigator.pushNamed(context, accountSelectionPath);
  }

  static void navigateToCategoryCreate(BuildContext context) {
    Navigator.pushNamed(context, categoryCreatePath);
  }

  static void navigateToCategoryList(BuildContext context) {
    Navigator.pushNamed(context, categoryListPath);
  }

  static Future<CategoryModel> navigateToCategorySelection(
    BuildContext context,
  ) {
    return Navigator.pushNamed(context, categorySelectionPath);
  }

  static void navigateToPayeeCreate(BuildContext context) {
    Navigator.pushNamed(context, payeeCreatePath);
  }

  static void navigateToPayeeList(BuildContext context) {
    Navigator.pushNamed(context, payeeListPath);
  }

  static Future<PayeeModel> navigateToPayeeSelection(
    BuildContext context,
  ) {
    return Navigator.pushNamed(context, payeeSelectionPath);
  }

  static void navigateToOperationCreate(BuildContext context) {
    Navigator.pushNamed(context, operationCreatePath);
  }

  static void navigateToOperationList(BuildContext context) {
    Navigator.pushNamed(context, operationListPath);
  }
}
