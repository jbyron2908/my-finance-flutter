import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/category/selection/screen/screen.dart';

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
