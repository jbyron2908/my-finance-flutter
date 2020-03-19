import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/account/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/account/list/screen/route.dart';
import 'package:my_finance_flutter/ui/view/account/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/category/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/category/list/screen/route.dart';
import 'package:my_finance_flutter/ui/view/category/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/home/screen/route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/screen/route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/screen/route.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/list/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/state_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/type_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/payee/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/payee/list/screen/route.dart';
import 'package:my_finance_flutter/ui/view/payee/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/profile/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/profile/list/screen/route.dart';
import 'package:my_finance_flutter/ui/view/profile/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/tag/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/tag/list/screen/route.dart';
import 'package:my_finance_flutter/ui/view/tag/selection/screen/route.dart';

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
