import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/create/screen/category_create_screen.dart';

class CategoryCreateRoute extends BaseRoute<CategoryCreateScreenArgs> {
  CategoryCreateRoute({CategoryCreateScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/category/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryCreateScreen(),
      settings: routeSettings,
    );
  }
}
