import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/account/create/screen/account_create_route.dart';
import 'package:my_finance_flutter/ui/screen/account/list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/screen/account/selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/category/create/screen/category_create_route.dart';
import 'package:my_finance_flutter/ui/screen/category/list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/screen/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/home/screen/home_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_route.dart';
import 'package:my_finance_flutter/ui/screen/label/create/screen/label_create_route.dart';
import 'package:my_finance_flutter/ui/screen/label/list/screen/label_list_route.dart';
import 'package:my_finance_flutter/ui/screen/label/selection/screen/label_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_route.dart';
import 'package:my_finance_flutter/ui/screen/operation/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/operation/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/operation/state_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/operation/type_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/payee/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/payee/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/payee/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/profile/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/profile/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/profile/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/splash/screen/route.dart';

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
      LabelCreateRoute().route,
      LabelListRoute().route,
      LabelSelectionRoute().route,
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
