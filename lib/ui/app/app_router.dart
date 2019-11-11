import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/screen/account_create_route.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/screen/category_create_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/view/home/screen/home_route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/import_form_route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/import_preview_route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/import_result_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/operation_create_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/operation_list_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/payee_create_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/payee_list_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/payee_selection_route.dart';
import 'package:my_finance_flutter/ui/view/splash/splash_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_create/tag_create_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/tag_list_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/tag_selection_route.dart';

class AppRouter {
  static Map routes = HashMap.fromEntries(
    [
      SplashRoute().route,
      HomeRoute().route,
      AccountCreateRoute().route,
      AccountListRoute().route,
      AccountSelectionRoute().route,
      CategoryCreateRoute().route,
      CategoryListRoute().route,
      CategorySelectionRoute().route,
      PayeeCreateRoute().route,
      PayeeListRoute().route,
      PayeeSelectionRoute().route,
      TagCreateRoute().route,
      TagListRoute().route,
      TagSelectionRoute().route,
      OperationCreateRoute().route,
      OperationListRoute().route,
      ImportCsvFormRoute().route,
      ImportCsvPreviewRoute().route,
      ImportCsvResultRoute().route,
    ],
  );

  static Route generateRoutes(RouteSettings routeSettings) {
    Function(RouteSettings) routeGenerator = routes[routeSettings.name];
    return routeGenerator(routeSettings);
  }

  static Future<T> navigateTo<T>(BuildContext context, BaseRoute route) {
    return Navigator.pushNamed<T>(
      context,
      route.routePath,
      arguments: route.arguments,
    );
  }

  static Future<T> replaceTo<T>(BuildContext context, BaseRoute route) {
    return Navigator.pushReplacementNamed(
      context,
      route.routePath,
      arguments: route.arguments,
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
