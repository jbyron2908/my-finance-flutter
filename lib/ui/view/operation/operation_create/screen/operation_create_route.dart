import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/screen/operation_create_screen.dart';

class OperationCreateRoute extends BaseRoute {
  @override
  String get routePath => "/operation/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => OperationCreateScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
