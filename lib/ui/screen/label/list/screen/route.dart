import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/label/list/screen/screen.dart';

class LabelListRoute extends BaseRoute {
  @override
  String get routePath => "/label/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
