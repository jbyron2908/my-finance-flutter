import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';

class CategorySelectionRoute extends BaseRoute {
  @override
  String get routePath => "/manager/category/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as CategorySelectionRouteArgs;

    return MaterialPageRoute<CategoryModel>(
      builder: (context) => CategorySelectionScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class CategorySelectionRouteArgs {
  int field1;

  CategorySelectionRouteArgs({
    this.field1,
  });
}
