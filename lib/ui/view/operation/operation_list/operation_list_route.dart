import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/operation_list_view.dart';

class OperationListRoute extends BaseRoute {
  @override
  String get routePath => "/operation/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationListView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
