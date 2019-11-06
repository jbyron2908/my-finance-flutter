import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/category_create_view.dart';

class CategoryCreateRoute extends BaseRoute {
  @override
  String get routePath => "/category/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryCreateView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
