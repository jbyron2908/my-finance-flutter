import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/screen/operation_list_screen.dart';

class OperationListRoute extends BaseRoute {
  OperationListRoute({this.routeArguments});

  final OperationListRouteArgs routeArguments;

  @override
  String get routePath => "/manager/operation/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as OperationListRouteArgs;

    return MaterialPageRoute(
      builder: (context) => OperationListScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => routeArguments;
}

class OperationListRouteArgs {
  int field1;

  OperationListRouteArgs({
    this.field1,
  });
}
