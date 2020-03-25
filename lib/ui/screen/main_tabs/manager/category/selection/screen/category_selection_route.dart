import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';

class CategorySelectionRoute extends BaseRoute {
  @override
  String get routePath => "/category/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<CategoryModel>(
      builder: (context) => CategorySelectionScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
