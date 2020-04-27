import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/router/base_router.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_route.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/screen/balance_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/create/screen/label_create_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/create/screen/payee_create_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/screen/payee_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/list/screen/profile_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/splash/screen/splash_route.dart';

class AppRouter extends BaseRouter {
  Map<String, MaterialPageRoute Function(RouteSettings routeSettings)>
      _routeMap = HashMap.fromEntries(
    [
      SplashRoute().route,
      EntityListRoute().route,
      BalanceRoute().route,
      MainRoute().route,
      ProfileFormRoute().route,
      ProfileListRoute().route,
      ProfileSelectionRoute().route,
      AccountFormRoute().route,
      AccountListRoute().route,
      AccountSelectionRoute().route,
      CategoryFormRoute().route,
      CategoryListRoute().route,
      CategorySelectionRoute().route,
      PayeeCreateRoute().route,
      PayeeListRoute().route,
      PayeeSelectionRoute().route,
      LabelCreateRoute().route,
      LabelListRoute().route,
      LabelSelectionRoute().route,
      OperationFormRoute().route,
      OperationListRoute().route,
      OperationTypeSelectionRoute().route,
      OperationStateSelectionRoute().route,
      ImportCsvFormRoute().route,
      ImportCsvPreviewRoute().route,
      ImportCsvResultRoute().route,
    ],
  );

  @override
  Map<String, MaterialPageRoute Function(RouteSettings routeSettings)>
      get routeMap => _routeMap;

  static Future<T> navigateTo<T>(BuildContext context, BaseRoute route) {
    return Navigator.of(context, rootNavigator: true).pushNamed<T>(
      route.routePath,
      arguments: route.argument,
    );
  }

  static Future<T> replaceTo<T>(BuildContext context, BaseRoute route) {
    return Navigator.of(context, rootNavigator: true).pushReplacementNamed(
      route.routePath,
      arguments: route.argument,
    );
  }

  static void pop(BuildContext context, [Object result]) {
    Navigator.of(context, rootNavigator: true).pop(result);
  }
}
