import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/operation/list/screen/screen.dart';

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
