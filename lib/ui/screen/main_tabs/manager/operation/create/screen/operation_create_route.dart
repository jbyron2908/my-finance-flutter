import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/create/screen/operation_create_screen.dart';

class OperationCreateRoute extends BaseRoute<OperationCreateScreenArgs> {
  OperationCreateRoute({OperationCreateScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/operation/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationCreateScreen(),
      settings: routeSettings,
    );
  }
}
