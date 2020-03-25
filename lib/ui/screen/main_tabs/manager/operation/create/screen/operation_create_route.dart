import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/create/screen/operation_create_screen.dart';

class OperationCreateRoute extends BaseRoute {
  OperationCreateRouteArgs routeArguments;

  OperationCreateRoute({this.routeArguments});

  @override
  String get routePath => "/manager/operation/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    OperationCreateRouteArgs arguments =
        routeSettings.arguments as OperationCreateRouteArgs;

    return MaterialPageRoute(
      builder: (context) => OperationCreateScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => routeArguments;
}

class OperationCreateRouteArgs {
  int field1;

  OperationCreateRouteArgs({
    this.field1,
  });
}
