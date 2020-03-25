import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/create/screen/category_create_screen.dart';

class CategoryCreateRoute extends BaseRoute {
  @override
  String get routePath => "/manager/category/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as CategoryCreateRouteArgs;

    return MaterialPageRoute(
      builder: (context) => CategoryCreateScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class CategoryCreateRouteArgs {
  int field1;

  CategoryCreateRouteArgs({
    this.field1,
  });
}
