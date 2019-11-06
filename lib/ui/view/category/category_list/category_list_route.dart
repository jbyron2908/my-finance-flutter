import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/category_list_view.dart';

class CategoryListRoute extends BaseRoute {
  @override
  String get routePath => "/category/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryListView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
