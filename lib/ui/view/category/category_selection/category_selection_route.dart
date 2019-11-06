import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/category_selection_view.dart';

class CategorySelectionRoute extends BaseRoute {
  @override
  String get routePath => "/category/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<CategoryModel>(
      builder: (context) => CategorySelectionView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
