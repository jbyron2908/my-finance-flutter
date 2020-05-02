import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';

class CategorySelectionRoute extends BaseRoute<CategorySelectionScreenArgs> {
  CategorySelectionRoute({CategorySelectionScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/category/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<CategoryModel>(
      builder: (context) => CategorySelectionScreen(),
      settings: routeSettings,
    );
  }
}
