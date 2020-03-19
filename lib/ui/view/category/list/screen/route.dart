import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/view/category/list/screen/screen.dart';

class CategoryListRoute extends BaseRoute {
  @override
  String get routePath => "/category/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
