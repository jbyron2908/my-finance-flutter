import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/category/create/screen/screen.dart';

class CategoryCreateRoute extends BaseRoute {
  @override
  String get routePath => "/category/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryCreateScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
