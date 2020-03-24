import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/label/create/screen/screen.dart';

class LabelCreateRoute extends BaseRoute {
  @override
  String get routePath => "/label/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelCreateScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
