import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_screen.dart';

class OperationListRoute extends BaseRoute<OperationListScreenArgs> {
  OperationListRoute({OperationListScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/operation/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationListScreen(),
      settings: routeSettings,
    );
  }
}
