import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_screen.dart';

class OperationListRoute extends BaseRoute {
  @override
  String get routePath => "/manager/operation/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
