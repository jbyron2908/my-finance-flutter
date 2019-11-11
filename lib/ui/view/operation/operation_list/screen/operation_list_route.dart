import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/screen/operation_list_screen.dart';

class OperationListRoute extends BaseRoute {
  @override
  String get routePath => "/operation/list";

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
