import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/view/tag/create/screen/screen.dart';

class TagCreateRoute extends BaseRoute {
  @override
  String get routePath => "/tag/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => TagCreateScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
