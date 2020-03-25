import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_screen.dart';

class CategoryListRoute extends BaseRoute {
  @override
  String get routePath => "/manager/category/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as CategoryListRouteArgs;

    return MaterialPageRoute(
      builder: (context) => CategoryListScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class CategoryListRouteArgs {
  int field1;

  CategoryListRouteArgs({
    this.field1,
  });
}
