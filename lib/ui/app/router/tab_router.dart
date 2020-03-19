import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/account/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/account/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/account/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/category/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/category/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/category/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/home/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/route.dart';
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
import 'package:my_finance_flutter/ui/screen/tag/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/tag/list/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/tag/selection/screen/route.dart';

class TabRouter {
  static Map routes = HashMap.fromEntries(
    [
      HomeRoute().route,
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
}
