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
import 'package:my_finance_flutter/ui/view/import_csv/form/screen/import_form_route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/screen/import_preview_route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/screen/import_result_route.dart';
import 'package:my_finance_flutter/ui/view/main/screen/main_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/screen/operation_create_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/screen/operation_list_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_type_selection/screen/operation_type_selection_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/screen/payee_create_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/screen/payee_list_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_selection/screen/payee_selection_route.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_create/screen/profile_create_route.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_list/screen/profile_list_route.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_selection/screen/profile_selection_route.dart';
import 'package:my_finance_flutter/ui/view/splash/screen/splash_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_create/screen/tag_create_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/screen/tag_list_route.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/screen/tag_selection_route.dart';

class AppRouter {
  static Map routes = HashMap.fromEntries(
    [
      SplashRoute().route,
      HomeRoute().route,
      MainRoute().route,
      ProfileCreateRoute().route,
      ProfileListRoute().route,
      ProfileSelectionRoute().route,
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
      OperationTypeSelectionRoute().route,
      OperationStateSelectionRoute().route,
      ImportCsvFormRoute().route,
      ImportCsvPreviewRoute().route,
      ImportCsvResultRoute().route,
    ],
  );

  static Route generateRoutes(RouteSettings routeSettings) {
    Function(RouteSettings) routeGenerator = routes[routeSettings.name];
    if (routeGenerator != null) {
      return routeGenerator(routeSettings);
    } else {
      return null;
    }
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

  static void pop(BuildContext context, [Object result]) {
    Navigator.of(context).pop(result);
  }
}
