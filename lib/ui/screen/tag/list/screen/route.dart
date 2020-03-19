import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/tag/list/screen/screen.dart';

class TagListRoute extends BaseRoute {
  @override
  String get routePath => "/tag/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => TagListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
